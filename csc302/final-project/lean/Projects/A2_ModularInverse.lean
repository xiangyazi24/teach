import FinalProject

/-!
# A2. Cancellation in congruences and modular inverses  (★★★)

When may you divide both sides of a congruence by a number? If `gcd c n = 1` and
`a * c ≡ b * c (mod n)`, then `a ≡ b (mod n)`; and `c` has an inverse modulo `n` (some `x`
with `c * x ≡ 1 (mod n)`) if and only if `gcd c n = 1`. A counterexample shows that
cancellation fails without the hypothesis. The extension characterizes when the linear
congruence `a * x ≡ b (mod n)` has a solution.

Needs: `gcd` and Bézout from A1 (prove them as the first part of this file; the size
below includes them).

Size: about 300–400 lines, comments included (guideline estimate: about 350 lines).

Rules for the submitted file:
* It compiles with `scripts/check.sh`, with no `sorry`, `admit`, `axiom` or `native_decide`.
* It ends with `#print axioms` for the main theorem (only `propext`, `Classical.choice`,
  `Quot.sound` may appear).
* `grind` only to close an equation between polynomial expressions; never for
  inequalities, divisibility or logic.
* Import only `FinalProject`. No Mathlib, no Lean `Nat` theorems, no `omega`.

The statements that mention `gcd` are in comment blocks, because you define `gcd` yourself
(part A1). Once your definition compiles, remove the comment markers and prove them; do not
weaken them.
-/

namespace MyNat

/-! ## Part A1: `gcd` and Bézout

-- TODO: define `gcd` by Euclid's recursion (`gcd 0 b = b`, `gcd a b = gcd (b % a) a`
-- for `a ≠ 0`) and prove what you need from topic A1:

/-- `gcd a b ∣ a`. -/
theorem gcd_dvd_left (a b : ℕ) : gcd a b ∣ a := by
  sorry

/-- `gcd a b ∣ b`. -/
theorem gcd_dvd_right (a b : ℕ) : gcd a b ∣ b := by
  sorry

/-- Every common divisor of `a` and `b` divides `gcd a b`. -/
theorem dvd_gcd {d a b : ℕ} (ha : d ∣ a) (hb : d ∣ b) : d ∣ gcd a b := by
  sorry

/-- Bézout without negative numbers: if `a ≠ 0`, then `a * x = b * y + gcd a b` for some `x, y`. -/
theorem bezout (a b : ℕ) (ha : a ≠ 0) : ∃ x y, a * x = b * y + gcd a b := by
  sorry
-/

/-! ## Cancellation and inverses

Required statements (after defining `gcd`):

/-- **Cancellation.** If `gcd c n = 1` and `a * c ≡ b * c (mod n)`, then `a ≡ b (mod n)`. -/
theorem modEq_cancel {a b c n : ℕ} (hc : gcd c n = 1) (h : a * c ≡ b * c [MOD n]) :
    a ≡ b [MOD n] := by
  sorry

/-- **Modular inverses.** `c` has an inverse modulo `n` (some `x` with `c * x ≡ 1 (mod n)`)
if and only if `gcd c n = 1`. -/
theorem exists_inverse_iff (c n : ℕ) : (∃ x, c * x ≡ 1 [MOD n]) ↔ gcd c n = 1 := by
  sorry
-/

/-- **Cancellation needs the hypothesis.** `2 * 2 ≡ 2 * 5 (mod 6)`, but `2 ≢ 5 (mod 6)`
(here `gcd 2 6 = 2`). -/
theorem cancel_counterexample : (2 * 2 : ℕ) ≡ 2 * 5 [MOD 6] ∧ ¬ (2 : ℕ) ≡ 5 [MOD 6] := by
  sorry

/-! ## Extension: linear congruences

Required statement (after defining `gcd`):

/-- **Linear congruences.** `a * x ≡ b (mod n)` has a solution `x` if and only if
`gcd a n ∣ b`. -/
theorem exists_linear_solution_iff (a b n : ℕ) :
    (∃ x, a * x ≡ b [MOD n]) ↔ gcd a n ∣ b := by
  sorry

#print axioms modEq_cancel
#print axioms exists_inverse_iff
#print axioms exists_linear_solution_iff
-/

#print axioms cancel_counterexample

end MyNat
