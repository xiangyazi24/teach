import FinalProject

/-!
# B3. Irrationality of square roots  (★★)

`√2` is irrational: there are no `a, b` with `b ≠ 0` and `a² = 2 b²` (parity and infinite
descent). The extension: for any prime `p`, there are no `a, b` with `b ≠ 0` and `a² = p b²`.

Needs: Euclid's lemma (topic B2) for the extension, which in turn needs `gcd` and Bézout
from A1. Prove them in this file; the size below includes them.

Size: about 300–400 lines, comments included (guideline estimate: 300–350 lines).
Do the extension.

Rules for the submitted file:
* It compiles with `scripts/check.sh`, with no `sorry`, `admit`, `axiom` or `native_decide`.
* It ends with `#print axioms` for the main theorem (only `propext`, `Classical.choice`,
  `Quot.sound` may appear).
* `grind` only to close an equation between polynomial expressions; never for
  inequalities, divisibility or logic.
* Import only `FinalProject`. No Mathlib, no Lean `Nat` theorems, no `omega`.
-/

namespace MyNat

/-! ## `√2` is irrational -/

/-- **`√2` is irrational:** there are no `a, b` with `b ≠ 0` and `a² = 2 b²`. -/
theorem sqrt_two_irrational : ¬ ∃ a b : ℕ, b ≠ 0 ∧ a ^ 2 = 2 * b ^ 2 := by
  sorry

/-! ## Extension: `√p` is irrational for every prime `p`

-- TODO: define `gcd` and prove Bézout (topic A1), as a step towards Euclid's lemma.
-/

/-- **Euclid's lemma:** if `p` is prime and `p ∣ a * b`, then `p ∣ a` or `p ∣ b`. -/
theorem euclid_lemma {p a b : ℕ} (hp : Prime p) (h : p ∣ a * b) : p ∣ a ∨ p ∣ b := by
  sorry

/-- **`√p` is irrational for every prime `p`:** there are no `a, b` with `b ≠ 0` and
`a² = p b²`. -/
theorem sqrt_prime_irrational {p : ℕ} (hp : Prime p) :
    ¬ ∃ a b : ℕ, b ≠ 0 ∧ a ^ 2 = p * b ^ 2 := by
  sorry

#print axioms sqrt_two_irrational
#print axioms sqrt_prime_irrational

end MyNat
