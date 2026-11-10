import FinalProject

/-!
# D1. Sums of two squares  (★★)

Products of sums of two squares are sums of two squares: on paper,
`(a² + b²)(c² + d²) = (ac + bd)² + (ad − bc)²`. Without subtraction, split into the cases
`a * d ≤ b * c` and `b * c ≤ a * d`. Prove the identity in each case *twice*: once with
`grind`, once by hand with `rw`, and explain what `grind` did. Write a function computing
the pair for `m * n` from the pairs for `m` and `n`, with `#eval`
(`5 * 13 = 65 = 1² + 8² = 4² + 7²`); prove that powers of a sum of two squares are sums of
two squares; and prove that no number `≡ 3 (mod 4)` is a sum of two squares.

Size: about 300–400 lines, comments included (guideline: about 320 lines; 261 measured
without the obstruction).

Rules for the submitted file:
* It compiles with `scripts/check.sh`, with no `sorry`, `admit`, `axiom` or `native_decide`.
* It ends with `#print axioms` for the main theorem (only `propext`, `Classical.choice`,
  `Quot.sound` may appear).
* `grind` only to close an equation between polynomial expressions; never for
  inequalities, divisibility or logic.
* Import only `FinalProject`. No Mathlib, no Lean `Nat` theorems, no `omega`.
-/

namespace MyNat

/-- `IsSum2 n`: `n` is a sum of two squares. -/
def IsSum2 (n : ℕ) : Prop := ∃ a b : ℕ, n = a * a + b * b

/-! ## The two cases of the identity (with `grind`) -/

/-- Case `b * c ≤ a * d`: if `a * d = b * c + e`, then
`(a² + b²)(c² + d²) = (ac + bd)² + e²`. -/
theorem two_sq_mul_of_le (a b c d e : ℕ) (h : a * d = b * c + e) :
    (a * a + b * b) * (c * c + d * d) = (a * c + b * d) * (a * c + b * d) + e * e := by
  sorry

/-- Case `a * d ≤ b * c`: if `b * c = a * d + e`, then
`(a² + b²)(c² + d²) = (ac + bd)² + e²`. -/
theorem two_sq_mul_of_ge (a b c d e : ℕ) (h : b * c = a * d + e) :
    (a * a + b * b) * (c * c + d * d) = (a * c + b * d) * (a * c + b * d) + e * e := by
  sorry

/-! ## The two cases by hand

The same two statements, proved with `rw` and the library's theorems, without `grind`. -/

namespace ByHand

/-- Case `b * c ≤ a * d`, by hand. -/
theorem two_sq_mul_of_le (a b c d e : ℕ) (h : a * d = b * c + e) :
    (a * a + b * b) * (c * c + d * d) = (a * c + b * d) * (a * c + b * d) + e * e := by
  sorry

/-- Case `a * d ≤ b * c`, by hand. -/
theorem two_sq_mul_of_ge (a b c d e : ℕ) (h : b * c = a * d + e) :
    (a * a + b * b) * (c * c + d * d) = (a * c + b * d) * (a * c + b * d) + e * e := by
  sorry

end ByHand

/-! ## The main theorem -/

/-- **Sums of two squares are closed under products:**
`IsSum2 m → IsSum2 n → IsSum2 (m * n)`. -/
theorem isSum2_mul {m n : ℕ} (hm : IsSum2 m) (hn : IsSum2 n) : IsSum2 (m * n) := by
  sorry

/-- **Powers:** if `n` is a sum of two squares, so is `n ^ k` for every `k`. -/
theorem isSum2_pow {n : ℕ} (hn : IsSum2 n) (k : ℕ) : IsSum2 (n ^ k) := by
  sorry

/-! ## Computing the pair

-- TODO: define
--   def mulWitness (ab cd : ℕ × ℕ) : ℕ × ℕ := ...
-- which, from `m = a² + b²` (the pair `(a, b)`) and `n = c² + d²` (the pair `(c, d)`),
-- computes a pair `(x, y)` with `m * n = x² + y²` (namely `(ac + bd, |ad − bc|)`).

Required statement (after defining `mulWitness`):

/-- `mulWitness` is correct: its two squares add up to `(a² + b²)(c² + d²)`. -/
theorem mulWitness_spec (a b c d : ℕ) :
    (a * a + b * b) * (c * c + d * d)
      = (mulWitness (a, b) (c, d)).1 * (mulWitness (a, b) (c, d)).1
        + (mulWitness (a, b) (c, d)).2 * (mulWitness (a, b) (c, d)).2 := by
  sorry

#eval mulWitness (1, 2) (2, 3)   -- 65 = 8² + 1²
#eval mulWitness (1, 2) (3, 2)   -- 65 = 7² + 4²

#print axioms mulWitness_spec
-/

/-! ## The obstruction modulo 4 -/

/-- **No number `≡ 3 (mod 4)` is a sum of two squares.** -/
theorem not_isSum2_of_modEq_three {n : ℕ} (h : n ≡ 3 [MOD 4]) : ¬ IsSum2 n := by
  sorry

#print axioms isSum2_mul
#print axioms isSum2_pow
#print axioms ByHand.two_sq_mul_of_le
#print axioms ByHand.two_sq_mul_of_ge
#print axioms not_isSum2_of_modEq_three

end MyNat
