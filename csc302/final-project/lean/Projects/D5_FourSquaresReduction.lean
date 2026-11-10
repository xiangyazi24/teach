import FinalProject

/-!
# D5. Reduction to primes, and why three squares are not enough  (★★)

Assuming Euler's identity (D2) and that every prime is a sum of four squares, prove that
every natural number is a sum of four squares (strong induction; every `n ≥ 2` has a prime
divisor). Then show that four is the right number: no number `≡ 7 (mod 8)` is a sum of
three squares, and more generally no number of the form `4 ^ a * (8 * b + 7)` is.
Hint: replace each number by its remainder (a square's remainder depends only on the
number's remainder), then let `decide` check the finitely many cases.

Size: about 300–400 lines, comments included (guideline estimate: about 350 lines; 183
measured for the two three-square items).

Rules for the submitted file:
* It compiles with `scripts/check.sh`, with no `sorry`, `admit`, `axiom` or `native_decide`.
* It ends with `#print axioms` for the main theorem (only `propext`, `Classical.choice`,
  `Quot.sound` may appear).
* `grind` only to close an equation between polynomial expressions; never for
  inequalities, divisibility or logic.
* Import only `FinalProject`. No Mathlib, no Lean `Nat` theorems, no `omega`.

The assumed results are hypotheses of the main theorem (do not prove them here). Both are
true (topic D2, and Lagrange's theorem for primes), so the theorem is not vacuous.
-/

namespace MyNat

/-- `IsSum3 n`: `n` is a sum of three squares. -/
def IsSum3 (n : ℕ) : Prop := ∃ a b c : ℕ, n = a * a + b * b + c * c

/-- `IsSum4 n`: `n` is a sum of four squares. -/
def IsSum4 (n : ℕ) : Prop := ∃ a b c d : ℕ, n = a * a + b * b + c * c + d * d

/-! ## Reduction to primes -/

/-- Every `n ≥ 2` has a prime divisor. -/
theorem exists_prime_dvd (n : ℕ) (hn : 2 ≤ n) : ∃ p, Prime p ∧ p ∣ n := by
  sorry

/-- **Lagrange's four-square theorem, reduced to primes.** Assume Euler's identity
(a product of two sums of four squares is a sum of four squares, topic D2) and that every
prime is a sum of four squares. Then every natural number is a sum of four squares. -/
theorem isSum4_of_primes
    (hEuler : ∀ m n, IsSum4 m → IsSum4 n → IsSum4 (m * n))
    (hPrime : ∀ p, Prime p → IsSum4 p) :
    ∀ n, IsSum4 n := by
  sorry

/-! ## Three squares are not enough -/

/-- **No number `≡ 7 (mod 8)` is a sum of three squares.** -/
theorem not_isSum3_of_modEq_seven {n : ℕ} (h : n ≡ 7 [MOD 8]) : ¬ IsSum3 n := by
  sorry

/-- **Legendre's obstruction:** no number of the form `4 ^ a * (8 * b + 7)` is a sum of
three squares. -/
theorem not_isSum3_four_pow (a b : ℕ) : ¬ IsSum3 (4 ^ a * (8 * b + 7)) := by
  sorry

/-- So four squares are really needed: `7` is a sum of four squares but not of three. -/
theorem seven_needs_four : IsSum4 7 ∧ ¬ IsSum3 7 := by
  sorry

#print axioms isSum4_of_primes
#print axioms not_isSum3_of_modEq_seven
#print axioms not_isSum3_four_pow

end MyNat
