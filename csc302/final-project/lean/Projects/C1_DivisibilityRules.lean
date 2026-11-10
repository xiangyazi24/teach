import FinalProject

/-!
# C1. Divisibility rules  (★★)

Represent a number by its list of decimal digits. Prove that `n` is congruent to its digit
sum modulo `9` (hence modulo `3`), and the rule for `11` in subtraction-free form: `n` plus
the sum of the digits in odd positions is congruent modulo `11` to the sum of the digits in
even positions.

Size: about 300–400 lines, comments included (guideline estimate: about 300 lines).

Rules for the submitted file:
* It compiles with `scripts/check.sh`, with no `sorry`, `admit`, `axiom` or `native_decide`.
* It ends with `#print axioms` for the main theorem (only `propext`, `Classical.choice`,
  `Quot.sound` may appear).
* `grind` only to close an equation between polynomial expressions; never for
  inequalities, divisibility or logic.
* Import only `FinalProject`. No Mathlib, no Lean `Nat` theorems, no `omega`.

Convention: digit lists are written **least significant digit first**, so `[3, 2, 1]` is
the number `123`, and the digit in position `i` is multiplied by `10 ^ i`. Position `0`
(the units digit) is even.
-/

namespace MyNat

/-! ## Numbers from digit lists -/

/-- The number with digit list `l` (least significant first):
`ofDigits [] = 0`, `ofDigits (d :: l) = d + 10 * ofDigits l`. -/
def ofDigits : List ℕ → ℕ
  | [] => 0
  | d :: l => d + 10 * ofDigits l

/-- The sum of the digits. -/
def digitSum : List ℕ → ℕ
  | [] => 0
  | d :: l => d + digitSum l

mutual
/-- The sum of the digits in even positions (`0, 2, 4, …`). -/
def evenSum : List ℕ → ℕ
  | [] => 0
  | d :: l => d + oddSum l

/-- The sum of the digits in odd positions (`1, 3, 5, …`). -/
def oddSum : List ℕ → ℕ
  | [] => 0
  | _ :: l => evenSum l
end

/-- **Every number has a decimal digit list:** for every `n` there is a list `l` of digits,
each `< 10`, with `ofDigits l = n`. (So the rules below apply to every `n`.) -/
theorem exists_digits (n : ℕ) : ∃ l : List ℕ, (∀ d, d ∈ l → d < 10) ∧ ofDigits l = n := by
  sorry

/-! ## The rules for `9` and `3` -/

/-- **Rule for 9:** a number is congruent to its digit sum modulo `9`. -/
theorem ofDigits_modEq_digitSum_nine (l : List ℕ) : ofDigits l ≡ digitSum l [MOD 9] := by
  sorry

/-- **Rule for 3:** a number is congruent to its digit sum modulo `3`. -/
theorem ofDigits_modEq_digitSum_three (l : List ℕ) : ofDigits l ≡ digitSum l [MOD 3] := by
  sorry

/-- `9` divides `n` if and only if `9` divides the digit sum. -/
theorem nine_dvd_iff (l : List ℕ) : 9 ∣ ofDigits l ↔ 9 ∣ digitSum l := by
  sorry

/-! ## The rule for `11` -/

/-- **Rule for 11, without subtraction:** `n` plus the sum of the digits in odd positions
is congruent modulo `11` to the sum of the digits in even positions. -/
theorem ofDigits_add_oddSum_modEq (l : List ℕ) :
    ofDigits l + oddSum l ≡ evenSum l [MOD 11] := by
  sorry

-- Example: `121 = ofDigits [1, 2, 1]`; even positions `1 + 1 = 2`, odd positions `2`;
-- `121 + 2 = 123 = 11 * 11 + 2`.

#print axioms ofDigits_modEq_digitSum_nine
#print axioms ofDigits_add_oddSum_modEq

end MyNat
