import FinalProject

/-!
# D3. Squares modulo a prime  (★★★)

For a prime `p`: `x² ≡ y² (mod p)` implies `x ≡ y` or `x + y ≡ 0 (mod p)`. Deduce that if
`p = 2k + 1`, then for `i < j ≤ k` the squares `i²` and `j²` are not congruent modulo `p`:
the `k + 1` squares `0², 1², …, k²` are different modulo `p`.

Needs: Euclid's lemma (topic B2), which in turn needs `gcd` and Bézout from A1. Prove them
as the first part of this file; the size below includes them.

Size: about 300–400 lines, comments included (guideline estimate: about 350 lines).

Rules for the submitted file:
* It compiles with `scripts/check.sh`, with no `sorry`, `admit`, `axiom` or `native_decide`.
* It ends with `#print axioms` for the main theorem (only `propext`, `Classical.choice`,
  `Quot.sound` may appear).
* `grind` only to close an equation between polynomial expressions; never for
  inequalities, divisibility or logic.
* Import only `FinalProject`. No Mathlib, no Lean `Nat` theorems, no `omega`.

Squares are written `x * x`, as in the definitions `IsSum2`, `IsSum4` of Track D.
-/

namespace MyNat

/-! ## Part B2: Euclid's lemma

-- TODO: define `gcd` and prove Bézout (topic A1), as a step towards Euclid's lemma.
-/

/-- **Euclid's lemma:** if `p` is prime and `p ∣ a * b`, then `p ∣ a` or `p ∣ b`. -/
theorem euclid_lemma {p a b : ℕ} (hp : Prime p) (h : p ∣ a * b) : p ∣ a ∨ p ∣ b := by
  sorry

/-! ## Square roots modulo a prime -/

/-- **Square roots modulo a prime.** If `p` is prime and `x² ≡ y² (mod p)`, then
`x ≡ y (mod p)` or `x + y ≡ 0 (mod p)`. -/
theorem sq_modEq_sq {p x y : ℕ} (hp : Prime p) (h : x * x ≡ y * y [MOD p]) :
    x ≡ y [MOD p] ∨ x + y ≡ 0 [MOD p] := by
  sorry

/-! ## The squares up to `k` are distinct -/

/-- **The squares `0², 1², …, k²` are different modulo `p = 2k + 1`:** if `p` is prime and
`i < j ≤ k`, then `i² ≢ j² (mod p)`. -/
theorem sq_not_modEq {p k i j : ℕ} (hp : Prime p) (hpk : p = 2 * k + 1)
    (hij : i < j) (hjk : j ≤ k) : ¬ (i * i ≡ j * j [MOD p]) := by
  sorry

#print axioms sq_modEq_sq
#print axioms sq_not_modEq

end MyNat
