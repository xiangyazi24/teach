# Natural Number Game materials for CSC302

Extracted from the [Natural Number Game](https://adam.math.hhu.de/#/g/leanprover-community/nng4) on 2026-09-08. See [source and usage notes](#sources-and-reproduction).

The material has two parts: [definitions, axioms and theorems](reference.md), and the world exercise sheets below. English source wording is preserved. The exercise sheets include the original instructions, mathematical statement, Lean signature, available tactics and facts, newly introduced tools, and any explicit restrictions.

## Worlds

| World | Levels | Prerequisite worlds |
|---|---:|---|
| [Tutorial World](worlds/01-tutorial.md) | 8 | None |
| [Addition World](worlds/02-addition.md) | 5 | Tutorial |
| [Multiplication World](worlds/03-multiplication.md) | 9 | Addition |
| [Power World](worlds/04-power.md) | 10 | Multiplication |
| [Implication World](worlds/05-implication.md) | 11 | Addition |
| [Advanced Addition World](worlds/06-advanced-addition.md) | 6 | Implication |
| [≤ World](worlds/07-less-or-equal.md) | 11 | AdvAddition |
| [Advanced Multiplication World](worlds/08-advanced-multiplication.md) | 10 | LessOrEqual, Multiplication |
| [Algorithm World](worlds/09-algorithm.md) | 9 | Implication |

Total: **9 worlds, 79 levels** (78 regular exercises and the final Fermat exhibition level), **6 definition cards**, and **70 theorem cards**, including **6 arithmetic axioms**.

## Using the material

The sheets preserve the game's introductions, which sometimes teach a tactic by showing a worked example. Author solution bodies, dynamic proof-state hints and post-completion text are omitted. The final Fermat level is retained and explicitly labelled as an exhibition, since its upstream completion uses a placeholder.

Available-tool lists come from each level's published inventory and assume its prerequisite worlds and earlier levels have been completed. Hidden engine tactics are omitted from the sheets and retained separately in the JSON. Algorithm level 5 explicitly disables `succ_inj`; that restriction is preserved.

These are reading and assignment documents, not a standalone Lean/Lake project. The displayed signatures omit proof bodies. The game uses `MyNat` and custom tactics; in particular its pedagogical `rfl` and `rw` should not be assumed to behave identically to stock Lean. Use the per-level links to work in the game.

Source spelling, quotation escapes, and time-dependent remarks inside quoted game prose have been retained. They describe the captured game content and are not fresh claims about the current state of external projects.

## Sources and reproduction

Live site: [Natural Number Game](https://adam.math.hhu.de/#/g/leanprover-community/nng4). Data endpoint: [game.json](https://adam.math.hhu.de/data/g/leanprover-community/nng4/game.json). The live Game Info text labels the game version **4.3**. Capture: `2026-09-08T00:59:10+00:00`.

Supplementary official source: [leanprover-community/NNG4 at 360d7976c335](https://github.com/leanprover-community/NNG4/tree/360d7976c3353883e0a09581e819017bd0656312). Its toolchain is `leanprover/lean4:v4.23.0`. All 79 level statements, all 79 level titles, and every world's imported level list were compared with that source. The server does not advertise its deployed commit in `game.json`; matching these fields does not imply the whole deployment is identical to the current repository. Live JSON is authoritative for reproduced player text.

[data/nng4.json](data/nng4.json) preserves the selected live fields, supplementary source fragments, per-level restrictions, exact source locations, and SHA-256 hashes of all fetched JSON and inspected source files. It excludes old and work-in-progress worlds that the live game does not expose.

To regenerate or verify the checked-in documents without network access:

```bash
python3 csc302/natural-number-game/extract.py
python3 csc302/natural-number-game/extract.py --check
```

To capture again, first obtain a clean official source checkout at the desired revision, then use a fresh cache directory:

```bash
python3 csc302/natural-number-game/extract.py --capture --source /path/to/NNG4 --cache csc302/.work/new-nng-capture
```

Capture rejects changes to the expected world set or any source/live statement mismatch, so upstream changes receive review before replacing the materials. Existing cache files are reused; use a new directory to obtain a new live snapshot.

## Attribution

Natural Number Game creators: Kevin Buzzard and Jon Eugster. Original Lean 3 version: Kevin Buzzard and Mohammad Pedramfar. Additional levels: Sian Carey, Ivan Farabella and Archie Browne. The original Game Info credits are also preserved in the JSON.

Upstream content is licensed under Apache-2.0; see [LICENSE.upstream](LICENSE.upstream) and [NOTICE.md](NOTICE.md). This course extraction reorganizes the original content, adjusts Markdown heading levels, omits solution bodies, and adds source classification and instructor notes.
