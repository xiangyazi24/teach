#!/usr/bin/env python3
"""Capture the public NNG data, then render and check the course documents offline."""

import argparse
from concurrent.futures import ThreadPoolExecutor
from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path
import re
import subprocess
from urllib.request import Request, urlopen


ROOT = Path(__file__).resolve().parent
BASE = "https://adam.math.hhu.de/data/g/leanprover-community/nng4/"
PLAY = "https://adam.math.hhu.de/#/g/leanprover-community/nng4"
REPO = "https://github.com/leanprover-community/NNG4"
DATA = ROOT / "data/nng4.json"
WORLD_FILES = {
    "Tutorial": "01-tutorial.md",
    "Addition": "02-addition.md",
    "Multiplication": "03-multiplication.md",
    "Power": "04-power.md",
    "Implication": "05-implication.md",
    "AdvAddition": "06-advanced-addition.md",
    "LessOrEqual": "07-less-or-equal.md",
    "AdvMultiplication": "08-advanced-multiplication.md",
    "Algorithm": "09-algorithm.md",
}
KINDS = {"definitions": "Definition", "lemmas": "Theorem", "tactics": "Tactic"}


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def json_text(value):
    return json.dumps(value, ensure_ascii=False, indent=2) + "\n"


def require(condition, message):
    if not condition:
        raise ValueError(message)


def signature(text):
    require(bool(re.search(r"\s*:=\s*by\s*$", text)), "Unexpected statement format")
    return re.sub(r"\s*:=\s*by\s*$", "", text).strip()


def normalized(text):
    return re.sub(r"\s+", "", text)


def source_link(revision, path, line):
    return f"{REPO}/blob/{revision}/{path}#L{line}"


def capture(source, cache):
    """Use official public JSON; source text supplies provenance, never level answers."""
    cache.mkdir(parents=True, exist_ok=True)

    def fetch(name):
        path = cache / name
        if not path.exists():
            request = Request(BASE + name, headers={"User-Agent": "CSC302-NNG-extraction/1.0"})
            with urlopen(request, timeout=45) as response:
                raw = response.read()
            json.loads(raw)
            path.write_bytes(raw)
        return json.loads(path.read_text())

    revision = subprocess.check_output(
        ["git", "-C", str(source), "rev-parse", "HEAD"], text=True
    ).strip()
    require(not subprocess.check_output(
        ["git", "-C", str(source), "status", "--porcelain"], text=True
    ).strip(), "The upstream source checkout must be clean")
    game, inventory = fetch("game.json"), fetch("inventory.json")
    require(set(game["worldSize"]) == set(WORLD_FILES), "Live world set changed; review the ordering")
    requests = [f"level__{w}__{i}.json" for w in WORLD_FILES
                for i in range(1, game["worldSize"][w] + 1)]
    requests += [f"doc__{kind}__{entry['name']}.json"
                 for key, kind in KINDS.items() for entry in inventory[key]
                 if not entry["hidden"]]
    with ThreadPoolExecutor(max_workers=6) as executor:
        responses = dict(zip(requests, executor.map(fetch, requests)))

    source_texts = {}

    def read_source(path):
        if path not in source_texts:
            source_texts[path] = (source / path).read_text()
        return source_texts[path]

    worlds = []
    for world, filename in WORLD_FILES.items():
        metadata = game["worlds"]["nodes"][world]
        world_path = f"Game/Levels/{world}.lean"
        world_text = read_source(world_path)
        source_modules = re.findall(r"^import (Game\.Levels\.[\w.]+)", world_text, re.M)
        levels = []
        for number in range(1, game["worldSize"][world] + 1):
            name = f"level__{world}__{number}.json"
            live = responses[name]
            require(live["index"] == number, f"Wrong level index: {name}")
            require(live["template"] is None, f"New proof template requires review: {name}")
            path = live["module"].replace(".", "/") + ".lean"
            text = read_source(path)
            matches = list(re.finditer(r"^Statement\b(.*?):=\s*by", text, re.M | re.S))
            require(len(matches) == 1, f"Expected one active Statement in {path}")
            match = matches[0]
            prefix = "example " if live["statementName"] == "[anonymous]" else "theorem "
            source_signature = prefix + match[1].strip()
            require(normalized(source_signature) == normalized(signature(live["descrFormat"])),
                    f"Source/live statement mismatch: {world}/{number}")
            title = re.search(r'^Title\s*("(?:[^"\\]|\\.)*")', text, re.M)
            require(title and json.loads(title[1]) == live["title"], f"Title mismatch: {path}")
            require(re.search(rf'^World "{world}"$', text, re.M), f"Wrong source world: {path}")
            require(re.search(rf'^Level {number}$', text, re.M), f"Wrong source level: {path}")
            require(live["module"] in source_modules, f"Unimported level: {path}")
            line = text[:match.start()].count("\n") + 1
            item = {key: live[key] for key in ["title", "statementName", "module", "index",
                                             "introduction", "descrText", "descrFormat"]}
            item.update({"id": f"{world}/{number}", "url": f"{PLAY}/world/{world}/level/{number}",
                         "data_url": BASE + name, "source_path": path, "source_line": line,
                         "source_url": source_link(revision, path, line),
                         "source_statement": source_signature,
                         "kind": "exhibition" if (world, number) == ("Power", 10) else "exercise"})
            item["inventory"] = {}
            for key in KINDS:
                entries = live[key]
                item["inventory"][key] = {
                    "available": [x["name"] for x in entries
                                  if not (x["locked"] or x["disabled"] or x["hidden"])],
                    "new": [x["name"] for x in entries if x["new"] and not x["hidden"]],
                    "disabled": [x["name"] for x in entries if x["disabled"]],
                    "hidden_available": [x["name"] for x in entries
                                         if x["hidden"] and not (x["locked"] or x["disabled"])],
                }
            levels.append(item)
        require({x["module"] for x in levels} == set(source_modules),
                f"Source/live level coverage mismatch: {world}")
        worlds.append({"id": world, "title": metadata["title"], "filename": filename,
                       "introduction": metadata["introduction"],
                       "prerequisites": [a for a, b in game["worlds"]["edges"] if b == world],
                       "levels": levels})

    # Search only the active levels and their foundation modules, excluding abandoned worlds.
    for path in sorted((source / "Game/MyNat").glob("*.lean")):
        read_source(str(path.relative_to(source)))
    levels = [level for world in worlds for level in world["levels"]]
    named_levels = {x["statementName"]: x for x in levels if x["statementName"] != "[anonymous]"}
    documents = {}
    first_level = responses["level__Tutorial__1.json"]
    for key, kind in KINDS.items():
        docs = []
        for entry in inventory[key]:
            if entry["hidden"]:
                continue
            name = entry["name"]
            filename = f"doc__{kind}__{name}.json"
            doc = dict(responses[filename], data_url=BASE + filename)
            require(doc["name"] == name and doc["type"] == kind, f"Mismatched card: {filename}")
            doc["introduced_at"] = [x["id"] for x in levels if name in x["inventory"][key]["new"]]
            if key == "lemmas":
                printed = next(x["altTitle"] for x in first_level[key] if x["name"] == name)
                require(doc["statement"] == printed, f"Inconsistent live signature: {name}")
                if name in named_levels:
                    level = named_levels[name]
                    doc.update({"source_kind": "theorem", "source_url": level["source_url"],
                                "proved_at": level["id"]})
                else:
                    short = name.removeprefix("MyNat.")
                    pattern = rf"^(axiom|theorem|lemma)\s+{re.escape(short)}\b"
                    matches = [(path, text, re.search(pattern, text, re.M))
                               for path, text in source_texts.items()]
                    matches = [(path, text, m) for path, text, m in matches if m]
                    require(bool(matches), f"No source declaration found for {name}")
                    path, text, match = matches[0]
                    line = text[:match.start()].count("\n") + 1
                    doc.update({"source_kind": match[1],
                                "source_url": source_link(revision, path, line), "proved_at": None})
            docs.append(doc)
        documents[key] = sorted(docs, key=lambda x: x["name"])

    fragments = []
    specifications = [
        ("Natural numbers", "Game/MyNat/Definition.lean", r"^inductive MyNat where", 3),
        ("Numeral conversion", "Game/MyNat/Definition.lean", r"^def ofNat", 4),
        ("One", "Game/MyNat/Definition.lean", r"^def one", 1),
        ("Addition operation", "Game/MyNat/Addition.lean", r"^opaque add", 1),
        ("Multiplication operation", "Game/MyNat/Multiplication.lean", r"^opaque mul", 1),
        ("Power operation", "Game/MyNat/Power.lean", r"^opaque pow", 1),
        ("Order", "Game/MyNat/LE.lean", r"^def le", 1),
        ("Predecessor helper", "Game/MyNat/PeanoAxioms.lean", r"^def pred", 3),
        ("Zero test", "Game/MyNat/PeanoAxioms.lean", r"^def is_zero", 3),
    ]
    for title, path, pattern, count in specifications:
        lines = read_source(path).splitlines()
        indices = [i for i, line in enumerate(lines) if re.search(pattern, line)]
        require(len(indices) == 1, f"Missing or ambiguous source fragment: {title}")
        start = indices[0]
        fragments.append({"title": title, "code": "\n".join(lines[start:start + count]),
                          "source_url": source_link(revision, path, start + 1)})
    axiom_names = {x["name"] for x in documents["lemmas"] if x["source_kind"] == "axiom"}
    require(axiom_names == {f"MyNat.{op}_{arg}" for op in ["add", "mul", "pow"]
                            for arg in ["zero", "succ"]}, "Arithmetic axiom inventory changed")
    raw_manifest = [{"url": BASE + name, "sha256": digest((cache / name).read_bytes())}
                    for name in ["game.json", "inventory.json"] + requests]
    source_manifest = [{"path": path, "sha256": digest(text.encode())}
                       for path, text in sorted(source_texts.items())]
    dataset = {"provenance": {
        "captured_at_utc": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "game_url": PLAY, "data_base_url": BASE, "source_repository": REPO,
        "source_revision": revision, "source_lean_toolchain": (source / "lean-toolchain").read_text().strip(),
        "live_info": game["info"], "source_statement_matches": len(levels),
        "source_title_matches": len(levels), "raw_responses": raw_manifest,
        "source_files": source_manifest,
        "note": "Live JSON is authoritative. The source commit was compared with all level statements and titles; the deployed commit is not advertised by game.json.",
    }, "game": {"title": game["title"], "introduction": game["introduction"],
                 "world_sizes": game["worldSize"], "edges": game["worlds"]["edges"]},
        "foundation_fragments": fragments, "documents": documents, "worlds": worlds}
    require(len(levels) == game["tile"]["levels"], "Level total mismatch")
    require(len(worlds) == game["tile"]["worlds"], "World total mismatch")
    DATA.parent.mkdir(parents=True, exist_ok=True)
    DATA.write_text(json_text(dataset))
    (ROOT / "LICENSE.upstream").write_bytes((source / "LICENSE").read_bytes())
    return dataset


def rebase_headings(content, floor):
    """Nest original prose headings without changing headings inside fenced examples."""
    if content is None:
        return ""
    lines, fence = [], None
    for line in content.splitlines():
        marker = re.match(r"^\s*(`{3,}|~{3,})", line)
        if marker:
            if fence is None:
                fence = marker[1][0]
            elif marker[1][0] == fence:
                fence = None
        if fence is None:
            line = re.sub(r"^(#{1,6})\s+", lambda m: "#" * min(6, floor + len(m[1]) - 1) + " ", line)
        lines.append(line.rstrip())
    return "\n".join(lines).strip()


def anchor(name):
    return re.sub(r"[^a-z0-9]+", "-", name.lower()).strip("-")


def codes(names):
    return ", ".join(f"`{x.removeprefix('MyNat.')}`" for x in names) or "None"


def render(data):
    provenance = data["provenance"]
    docs, worlds = data["documents"], data["worlds"]
    date = provenance["captured_at_utc"][:10]
    files = {}
    theorem_by_name = {x["name"]: x for x in docs["lemmas"]}
    header = f"Extracted from the [Natural Number Game]({PLAY}) on {date}. See [source and usage notes](README.md)."
    reference = ["# Natural Number Game: definitions, axioms and theorems", header,
                 "## How to read this reference",
                 "The six definition cards and all 70 theorem cards below reproduce the live game's English documentation. "
                 "The six arithmetic axioms are included among those 70 cards. The source notes distinguish `axiom` declarations "
                 "from proved declarations; the game's general label ‘Theorem’ does not make every entry an axiom. "
                 "Signatures are documentation excerpts, with their original hypotheses and generated binder names preserved.",
                 "## Foundations and Peano principles",
                 "The game uses the inductive type `MyNat`, written `ℕ`, rather than Lean's built-in `Nat`. "
                 "Its constructors are zero and successor. Mathematical induction proves a property for every number "
                 "by proving the zero case and proving the successor case from the induction hypothesis. "
                 f"See the [live induction documentation]({BASE}doc__Tactic__induction.json).",
                 "The familiar Peano principles `succ_inj` (successor is injective) and `zero_ne_succ` "
                 "(zero is not a successor) are proved theorems in the supplied source. They are not additional "
                 "Lean `axiom` declarations. Their exact statements and source links appear in the Peano catalogue below.",
                 "The source defines `add`, `mul` and `pow` as opaque operations and declares two axioms for each. "
                 "These are the recursive arithmetic rules supplied to the player:",
                 "| Axiom | Exact live signature | Source |\n|---|---|---|"]
    for op in ["add", "mul", "pow"]:
        for arg in ["zero", "succ"]:
            doc = theorem_by_name[f"MyNat.{op}_{arg}"]
            reference[-1] += f"\n| `{doc['displayName']}` | `{doc['displayName']}{doc['statement']}` | [declaration]({doc['source_url']}) |"
    reference += ["### Source definitions and helpers",
                  "These additional excerpts preserve the upstream definitions. In particular, `pred 0 = 37` "
                  "is intentional in this game; it is not the usual truncated predecessor. Only the successor "
                  "equation is needed in Algorithm World. The following fragments omit their surrounding namespace and imports."]
    for fragment in data["foundation_fragments"]:
        reference += [f"#### {fragment['title']}", f"```lean\n{fragment['code']}\n```",
                      f"[Source]({fragment['source_url']})"]
    reference += ["## Definition cards"]
    for name in ["MyNat", "Add", "Mul", "Pow", "LE", "Ne"]:
        doc = next(x for x in docs["definitions"] if x["name"] == name)
        reference += [f"### {doc['displayName']} ({name})",
                      rebase_headings(doc["content"], 4), f"[Live definition card]({doc['data_url']})"]
    reference += ["## Theorem catalogue",
                  "Each card retains the live statement and explanatory text. “Exercise result” identifies "
                  "the level that asks the player to prove it; other entries are supplied facts. This extraction "
                  "does not independently rebuild or re-prove the upstream Lean project."]
    for category, title in [("012", "Numerals"), ("Peano", "Peano and helper facts"),
                            ("+", "Addition"), ("*", "Multiplication"), ("^", "Powers"), ("≤", "Order")]:
        reference.append(f"### {title}")
        for doc in [x for x in docs["lemmas"] if x["category"] == category]:
            where = f"Exercise result: `{doc['proved_at']}`." if doc["proved_at"] else "Supplied fact."
            reference += [f'<a id="{anchor(doc["name"])}"></a>\n\n#### {doc["displayName"]}',
                          f"Source declaration: `{doc['source_kind']}`. {where}",
                          f"```lean\n{doc['displayName']}{doc['statement']}\n```",
                          rebase_headings(doc["content"], 5),
                          f"[Live card]({doc['data_url']}) · [Source]({doc['source_url']})"]
    files["reference.md"] = "\n\n".join(x for x in reference if x) + "\n"

    for world in worlds:
        prerequisites = ", ".join(world["prerequisites"]) or "None"
        sheet = [f"# {world['title']}",
                 f"World ID: `{world['id']}` · Levels: {len(world['levels'])} · Prerequisites: {prerequisites}.",
                 "[Index](../README.md) · [Mathematical reference](../reference.md)",
                 "## World introduction", rebase_headings(world["introduction"], 3)]
        for level in world["levels"]:
            sheet += [f'<a id="level-{level["index"]}"></a>\n\n## Level {level["index"]}: {level["title"]}',
                      f"[Play level]({level['url']}) · [Live data]({level['data_url']}) · [Source]({level['source_url']})"]
            if level["kind"] == "exhibition":
                sheet.append("**Instructor note: exhibition level.** The upstream source uses the hidden `xyzzy` "
                             "placeholder to finish this level. It does not contain a genuine proof of Fermat's Last Theorem. "
                             "Keep this as a discussion or closing slide, rather than a routine proof assignment.")
            sheet += ["### Original instructions", rebase_headings(level["introduction"], 4),
                      "### Exercise", rebase_headings(level["descrText"], 4),
                      f"```lean\n{signature(level['descrFormat'])}\n```"]
            inv = level["inventory"]
            sheet += [f"**Available tactics:** {codes(inv['tactics']['available'])}."]
            for key, label in [("tactics", "New tactics"), ("lemmas", "New supplied facts"),
                               ("definitions", "New definitions")]:
                if inv[key]["new"]:
                    sheet.append(f"**{label}:** {codes(inv[key]['new'])}.")
                if inv[key]["disabled"]:
                    sheet.append(f"**Disabled {key}:** {codes(inv[key]['disabled'])}.")
            available = ", ".join(f"[{x.removeprefix('MyNat.')}](../reference.md#{anchor(x)})"
                                  for x in inv["lemmas"]["available"]) or "None"
            sheet.append("<details>\n<summary>Available facts at this level</summary>\n\n" + available + "\n\n</details>")
        files[f"worlds/{world['filename']}"] = "\n\n".join(x for x in sheet if x) + "\n"

    index = ["# Natural Number Game materials for CSC302", header.replace("README.md", "#sources-and-reproduction"),
             "The material has two parts: [definitions, axioms and theorems](reference.md), and the world exercise sheets below. "
             "English source wording is preserved. The exercise sheets include the original instructions, mathematical statement, "
             "Lean signature, available tactics and facts, newly introduced tools, and any explicit restrictions.",
             "## Worlds", "| World | Levels | Prerequisite worlds |\n|---|---:|---|"]
    for world in worlds:
        index[-1] += f"\n| [{world['title']}](worlds/{world['filename']}) | {len(world['levels'])} | {', '.join(world['prerequisites']) or 'None'} |"
    index += ["Total: **9 worlds, 79 levels** (78 regular exercises and the final Fermat exhibition level), "
              "**6 definition cards**, and **70 theorem cards**, including **6 arithmetic axioms**.",
              "## Using the material",
              "The sheets preserve the game's introductions, which sometimes teach a tactic by showing a worked example. "
              "Author solution bodies, dynamic proof-state hints and post-completion text are omitted. The final "
              "Fermat level is retained and explicitly labelled as an exhibition, since its upstream completion uses a placeholder.",
              "Available-tool lists come from each level's published inventory and assume its prerequisite worlds and earlier levels "
              "have been completed. Hidden engine tactics are omitted from the sheets and retained separately in the JSON. "
              "Algorithm level 5 explicitly disables `succ_inj`; that restriction is preserved.",
              "These are reading and assignment documents, not a standalone Lean/Lake project. The displayed signatures "
              "omit proof bodies. The game uses `MyNat` and custom tactics; in particular its pedagogical `rfl` and `rw` "
              "should not be assumed to behave identically to stock Lean. Use the per-level links to work in the game.",
              "Source spelling, quotation escapes, and time-dependent remarks inside quoted game prose have been retained. "
              "They describe the captured game content and are not fresh claims about the current state of external projects.",
              "## Sources and reproduction",
              f"Live site: [Natural Number Game]({PLAY}). Data endpoint: [game.json]({BASE}game.json). "
              f"The live Game Info text labels the game version **4.3**. Capture: `{provenance['captured_at_utc']}`.",
              f"Supplementary official source: [leanprover-community/NNG4 at {provenance['source_revision'][:12]}]"
              f"({REPO}/tree/{provenance['source_revision']}). Its toolchain is `{provenance['source_lean_toolchain']}`. "
              "All 79 level statements, all 79 level titles, and every world's imported level list were compared with that source. "
              "The server does not advertise its deployed commit in `game.json`; matching these fields does not imply the whole "
              "deployment is identical to the current repository. Live JSON is authoritative for reproduced player text.",
              "[data/nng4.json](data/nng4.json) preserves the selected live fields, supplementary source fragments, "
              "per-level restrictions, exact source locations, and SHA-256 hashes of all fetched JSON and inspected source files. "
              "It excludes old and work-in-progress worlds that the live game does not expose.",
              "To regenerate or verify the checked-in documents without network access:",
              "```bash\npython3 csc302/natural-number-game/extract.py\npython3 csc302/natural-number-game/extract.py --check\n```",
              "To capture again, first obtain a clean official source checkout at the desired revision, then use a fresh cache directory:",
              "```bash\npython3 csc302/natural-number-game/extract.py --capture "
              "--source /path/to/NNG4 --cache csc302/.work/new-nng-capture\n```",
              "Capture rejects changes to the expected world set or any source/live statement mismatch, so upstream changes receive review "
              "before replacing the materials. Existing cache files are reused; use a new directory to obtain a new live snapshot.",
              "## Attribution",
              "Natural Number Game creators: Kevin Buzzard and Jon Eugster. Original Lean 3 version: Kevin Buzzard "
              "and Mohammad Pedramfar. Additional levels: Sian Carey, Ivan Farabella and Archie Browne. "
              "The original Game Info credits are also preserved in the JSON.",
              "Upstream content is licensed under Apache-2.0; see [LICENSE.upstream](LICENSE.upstream) and [NOTICE.md](NOTICE.md). "
              "This course extraction reorganizes the original content, adjusts Markdown heading levels, omits solution bodies, "
              "and adds source classification and instructor notes."]
    files["README.md"] = "\n\n".join(index) + "\n"
    files["NOTICE.md"] = (
        "# Attribution and modifications\n\n"
        "This directory contains an adapted extraction of Natural Number Game content from "
        "leanprover-community/NNG4 and its public deployment at adam.math.hhu.de.\n\n"
        "Creators: Kevin Buzzard and Jon Eugster. Original Lean 3 version: Kevin Buzzard and "
        "Mohammad Pedramfar. Additional levels: Sian Carey, Ivan Farabella and Archie Browne.\n\n"
        "Upstream licensing: Apache License 2.0, reproduced in LICENSE.upstream. "
        "The original content remains attributable to its respective contributors.\n\n"
        "Modifications for CSC302: extraction into Markdown and structured JSON; reordered headings and "
        "world index; added source links, inventory summaries and declaration classifications; "
        "omitted author proof bodies, dynamic hints and completion messages; added instructor notes "
        "about the game's foundations and the Fermat exhibition level. Original player prose is retained "
        "without silently correcting its wording. These changes do not imply upstream endorsement.\n"
    )
    return files


def validate(data):
    worlds = data["worlds"]
    levels = [level for world in worlds for level in world["levels"]]
    require(len(worlds) == 9 and len(levels) == 79, "Expected 9 worlds and 79 levels")
    require(len({x["id"] for x in levels}) == len(levels), "Duplicate level IDs")
    require(sum(x["kind"] == "exhibition" for x in levels) == 1, "Exhibition accounting mismatch")
    require({x["id"] for x in worlds} == set(data["game"]["world_sizes"]), "Missing world")
    theorems = data["documents"]["lemmas"]
    require(len(theorems) == 70 and len({x["name"] for x in theorems}) == 70, "Theorem coverage mismatch")
    require(len(data["documents"]["definitions"]) == 6, "Definition coverage mismatch")
    require(sum(x["source_kind"] == "axiom" for x in theorems) == 6, "Axiom classification mismatch")
    require({x["category"] for x in theorems} == {"012", "Peano", "+", "*", "^", "≤"}, "Unrendered theorem category")
    known = {key: {x["name"] for x in entries} for key, entries in data["documents"].items()}
    for world in worlds:
        require(len(world["levels"]) == data["game"]["world_sizes"][world["id"]], "World count mismatch")
        require([x["index"] for x in world["levels"]] == list(range(1, len(world["levels"]) + 1)), "Level order mismatch")
        for level in world["levels"]:
            require(normalized(signature(level["descrFormat"])) == normalized(level["source_statement"]), "Statement drift")
            for key, entry in level["inventory"].items():
                require(set(entry["available"]) <= known[key], f"Unresolved inventory item: {level['id']}")
                require(not set(entry["available"]) & set(entry["disabled"]), "Disabled tool listed as available")
            require(level["statementName"] not in level["inventory"]["lemmas"]["available"], "Exercise answer leaked as available fact")
    algorithm5 = next(x for x in levels if x["id"] == "Algorithm/5")
    require("MyNat.succ_inj" in algorithm5["inventory"]["lemmas"]["disabled"], "Lost Algorithm/5 restriction")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--capture", action="store_true", help="Capture live JSON and compare a clean upstream source checkout")
    mode.add_argument("--check", action="store_true", help="Check coverage and generated documents without modifying files")
    parser.add_argument("--source", type=Path)
    parser.add_argument("--cache", type=Path, default=ROOT.parent / ".work/nng4/live")
    args = parser.parse_args()
    if args.capture:
        if args.source is None:
            parser.error("--capture requires --source")
        data = capture(args.source.resolve(), args.cache.resolve())
    else:
        data = json.loads(DATA.read_text())
    validate(data)
    files = render(data)
    for name, content in files.items():
        path = ROOT / name
        if args.check:
            require(path.exists() and path.read_text() == content, f"Generated file differs: {name}")
        else:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content)
    require(len(list((ROOT / "worlds").glob("*.md"))) == 9, "Unexpected extra world sheets")
    require((ROOT / "LICENSE.upstream").is_file(), "Missing upstream license")
    print("PASS: 9 worlds; 79 unique levels; 6 definition cards; 70 theorem cards, including 6 axioms.")
    print("PASS: all source/live statement comparisons, inventory references, and the Algorithm/5 restriction.")
    print(f"{'Verified' if args.check else 'Generated'} {len(files)} Markdown documents.")


if __name__ == "__main__":
    main()
