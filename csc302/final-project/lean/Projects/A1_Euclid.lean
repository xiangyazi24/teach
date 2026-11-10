import FinalProject

/-!
# A1. Euclid's algorithm and the extended Euclidean algorithm  (★★)

Define `gcd` by Euclid's recursion `gcd 0 b = b`, `gcd a b = gcd (b % a) a`, prove that it
terminates and that it is the greatest common divisor. Then define the extended algorithm,
which also returns Bézout coefficients, and prove its output correct. Without negative
numbers Bézout's identity reads: if `a ≠ 0` there are `x, y` with `a * x = b * y + gcd a b`.
`#eval` your algorithms on examples and show the output in your slides.

Size: about 300–400 lines, comments included (guideline: 290 lines measured).

Rules for the submitted file:
* It compiles with `scripts/check.sh`, with no `sorry`, `admit`, `axiom` or `native_decide`.
* It ends with `#print axioms` for the main theorem (only `propext`, `Classical.choice`,
  `Quot.sound` may appear).
* `grind` only to close an equation between polynomial expressions; never for
  inequalities, divisibility or logic.
* Import only `FinalProject`. No Mathlib, no Lean `Nat` theorems, no `omega`.

Defining `gcd` and the extended algorithm is part of the exercise, so the statements that
mention them are in comment blocks below. Once your definitions compile, remove the
comment markers and prove the statements; do not weaken them.
-/

namespace MyNat

/-! ## Euclid's algorithm

-- TODO: define
--   def gcd (a b : ℕ) : ℕ := ...
-- by Euclid's recursion: `gcd 0 b = b`, and `gcd a b = gcd (b % a) a` for `a ≠ 0`.
-- It terminates because the first argument goes down (`b % a < a`): copy the
-- `termination_by` / `decreasing_by` pattern from `FinalProject/Modulo/Order.lean`.

Required statements (after defining `gcd`):

/-- The first defining equation: `gcd 0 b = b`. -/
theorem gcd_zero_left (b : ℕ) : gcd 0 b = b := by
  sorry

/-- The second defining equation: `gcd a b = gcd (b % a) a` for `a ≠ 0`. -/
theorem gcd_rec {a : ℕ} (b : ℕ) (ha : a ≠ 0) : gcd a b = gcd (b % a) a := by
  sorry

/-- `gcd a b` divides `a`. -/
theorem gcd_dvd_left (a b : ℕ) : gcd a b ∣ a := by
  sorry

/-- `gcd a b` divides `b`. -/
theorem gcd_dvd_right (a b : ℕ) : gcd a b ∣ b := by
  sorry

/-- **Every common divisor divides the gcd:** `d ∣ a → d ∣ b → d ∣ gcd a b`. -/
theorem dvd_gcd {d a b : ℕ} (ha : d ∣ a) (hb : d ∣ b) : d ∣ gcd a b := by
  sorry

/-- info: 6 -/
#guard_msgs in
#eval gcd 48 18
-/

/-! ## The extended Euclidean algorithm

-- TODO: define the extended algorithm, e.g.
--   def xgcd (a b : ℕ) : ... := ...
-- returning `gcd a b` together with Bézout coefficients. Without negative numbers the
-- equation changes sides at every step: from the pair `(b % a, a)` you get
-- `b * x = a * y + g`, the wrong way round for `(a, b)`. So keep track of both forms,
-- `a * x = b * y + g` and `b * y = a * x + g` (for example with a flag saying which one
-- holds, or by returning coefficients for both).
-- Then state and prove its correctness: the `g` it returns is `gcd a b`, and the
-- coefficients satisfy the equation you specified. Choose the output type yourself;
-- the correctness theorem must say exactly what the output means.
-/

/-! ## Bézout's identity without negative numbers

Required statement (after defining `gcd`); prove it from the correctness of your
extended algorithm, converting `b * y = a * x + g` into the other form where needed:

/-- **Bézout's identity (without negative numbers).** If `a ≠ 0`, there are `x, y` with
`a * x = b * y + gcd a b`. -/
theorem bezout (a b : ℕ) (ha : a ≠ 0) : ∃ x y, a * x = b * y + gcd a b := by
  sorry
-/

/-- The hypothesis `a ≠ 0` in Bézout is needed: for `a = 0`, `b = 1` (where
`gcd 0 1 = 1`) there are no `x, y` with `0 * x = 1 * y + 1`. -/
theorem bezout_zero_one_fails : ¬ ∃ x y : ℕ, 0 * x = 1 * y + 1 := by
  sorry

/-! ## Examples

`#eval` both algorithms on several examples, e.g. `gcd 1071 462 = 21`, and check a
Bézout equation it returns with `decide`. -/

/-
#print axioms gcd_dvd_left
#print axioms dvd_gcd
#print axioms bezout
-/
#print axioms bezout_zero_one_fails

end MyNat
