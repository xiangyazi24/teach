#!/usr/bin/env bash
# Compile the library module by module (no `lake build`), then optionally check extra files.
#
# Usage (from anywhere):
#   scripts/check.sh                      # compile all FinalProject modules in order,
#                                         # then run FinalProject/Check.lean (#print axioms)
#   scripts/check.sh Projects/Team.lean   # ... and then also check the given files
#   VERBOSE=1 scripts/check.sh            # also show every module's messages
#
# Each module is compiled with `lake env lean -o`, writing its .olean where Lake looks for it,
# so later modules (and your own files) can `import` it. The script stops at the first error and
# finally reports any `sorry`/`admit`/`axiom`/`native_decide` found in the checked sources.
set -u
cd "$(dirname "$0")/.." || exit 1
export PATH="$HOME/.elan/bin:$PATH"

MODULES=(
  FinalProject/NNG/Definition
  FinalProject/NNG/Addition
  FinalProject/NNG/Multiplication
  FinalProject/NNG/Power
  FinalProject/NNG/Implication
  FinalProject/NNG/AdvAddition
  FinalProject/NNG/LessOrEqual
  FinalProject/NNG/AdvMultiplication
  FinalProject/NNG/Algorithm
  FinalProject/NNG
  FinalProject/Tactic/Ring
  FinalProject/Modulo/Order
  FinalProject/Modulo/Divisibility
  FinalProject/Modulo/DivMod
  FinalProject/Modulo/Congruence
  FinalProject/Modulo/Prime
  FinalProject
)

OUT=.lake/build/lib/lean
status=0

compile() {  # $1 = path without .lean; $2 = 1 to write an .olean
  local src="$1.lean" log
  if [ "$2" = 1 ]; then
    mkdir -p "$OUT/$(dirname "$1")"
    log=$(lake env lean -o "$OUT/$1.olean" -i "$OUT/$1.ilean" "$src" 2>&1)
  else
    log=$(lake env lean "$src" 2>&1)
  fi
  local rc=$?
  if [ $rc -ne 0 ] || printf '%s\n' "$log" | grep -q -E '(^|: )error'; then
    echo "FAIL  $src"
    printf '%s\n' "$log"
    return 1
  fi
  if printf '%s\n' "$log" | grep -q -E 'warning'; then
    echo "WARN  $src"
    printf '%s\n' "$log" | grep -A3 'warning'
  else
    echo "ok    $src"
  fi
  if [ "${VERBOSE:-0}" = 1 ]; then printf '%s\n' "$log"; fi
}

for m in "${MODULES[@]}"; do
  compile "$m" 1 || exit 1
done

# Axiom report for the main theorems, and goal-display tests.
echo "--- FinalProject/Check.lean"
checklog=$(lake env lean FinalProject/Check.lean 2>&1)
printf '%s\n' "$checklog"
if printf '%s\n' "$checklog" | grep -q -E 'error|sorryAx'; then
  echo "FAIL  FinalProject/Check.lean"
  status=1
elif printf '%s\n' "$checklog" | grep 'depends on axioms' \
    | sed -e 's/.*\[//' -e 's/\]//' | tr ',' '\n' | tr -d ' ' \
    | grep -v -x -E 'propext|Classical.choice|Quot.sound' | grep -q .; then
  echo "FAIL  FinalProject/Check.lean: a non-standard axiom is used"
  status=1
fi

for f in "$@"; do
  compile "${f%.lean}" 0 || { status=1; continue; }
  # Your own `#print axioms` lines: only the three standard axioms may appear.
  flog=$(lake env lean "$f" 2>&1)
  if printf '%s\n' "$flog" | grep -q -E "declaration uses .sorry."; then
    echo "FAIL  $f: uses sorry"
    status=1
  fi
  if ! printf '%s\n' "$flog" | grep -q -E 'depends on axioms|does not depend on any axioms'; then
    echo "FAIL  $f: no #print axioms output (add '#print axioms <main theorem>' at the end)"
    status=1
  elif printf '%s\n' "$flog" | grep 'depends on axioms' \
      | sed -e 's/.*\[//' -e 's/\]//' | tr ',' '\n' | tr -d ' ' \
      | grep -v -x -E 'propext|Classical.choice|Quot.sound' | grep -q .; then
    echo "FAIL  $f: a non-standard axiom is used:"
    printf '%s\n' "$flog" | grep 'depends on axioms'
    status=1
  else
    echo "axioms ok  $f"
  fi
done

# Forbidden escape hatches (comments are not stripped; review any hit by hand).
if grep -n -E '\b(sorry|admit|native_decide|implemented_by)\b|^\s*axiom\b|\bunsafe\b' \
    FinalProject.lean FinalProject/NNG.lean FinalProject/NNG/*.lean FinalProject/Tactic/*.lean FinalProject/Modulo/*.lean "$@" 2>/dev/null \
    | grep -v -E '^\S+:[0-9]+:\s*(--|/-|\*)'; then
  echo "WARNING: forbidden keyword found (see lines above)"
  status=1
fi

exit $status
