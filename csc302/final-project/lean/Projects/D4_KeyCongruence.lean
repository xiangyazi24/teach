import FinalProject

/-!
# D4. The key congruence  (★★★★★)

For an odd prime `p = 2k + 1` there are `a, b ≤ k` with `p ∣ a² + b² + 1`. The values `a²`
and the values "the residue `r` with `r + b² + 1 ≡ 0`" (for `a, b = 0, …, k`) are `2k + 2`
numbers in `2k + 1` residue classes, so two of them share a class (pigeonhole); within each
family they are distinct (D3), so one is an `a²` and the other belongs to some `b`.
For ambitious teams.

Assumed results (as hypotheses of the main theorem, so that you can work in parallel with
the teams doing D3 and F5): D3's "the squares `0², …, k²` are different modulo `p`" and
F5's pigeonhole principle. Both hypotheses are true theorems, so the main theorem is not
vacuous; do not prove them here.

Size: 300–400 lines is the usual target; this topic is much larger (guideline estimate:
600 lines or more).

Rules for the submitted file:
* It compiles with `scripts/check.sh`, with no `sorry`, `admit`, `axiom` or `native_decide`.
* It ends with `#print axioms` for the main theorem (only `propext`, `Classical.choice`,
  `Quot.sound` may appear).
* `grind` only to close an equation between polynomial expressions; never for
  inequalities, divisibility or logic.
* Import only `FinalProject`. No Mathlib, no Lean `Nat` theorems, no `omega`.
-/

namespace MyNat

/-- The result of D3, as a statement: for a prime `p = 2k + 1` and `i < j ≤ k`,
`i² ≢ j² (mod p)`. -/
def SquaresDistinct : Prop :=
  ∀ p k i j : ℕ, Prime p → p = 2 * k + 1 → i < j → j ≤ k → ¬ (i * i ≡ j * j [MOD p])

/-- The result of F5 (pigeonhole principle), as a statement: if `f 0, …, f n` all lie
below `n`, then `f i = f j` for some `i < j ≤ n`. -/
def Pigeonhole : Prop :=
  ∀ (n : ℕ) (f : ℕ → ℕ), (∀ i, i ≤ n → f i < n) → ∃ i j, i < j ∧ j ≤ n ∧ f i = f j

/-- **The key congruence.** Assuming D3 and the pigeonhole principle: for a prime
`p = 2k + 1` there are `a, b ≤ k` with `p ∣ a² + b² + 1`. -/
theorem key_congruence (hD3 : SquaresDistinct) (hPH : Pigeonhole)
    {p k : ℕ} (hp : Prime p) (hpk : p = 2 * k + 1) :
    ∃ a b, a ≤ k ∧ b ≤ k ∧ p ∣ a * a + b * b + 1 := by
  sorry

#print axioms key_congruence

end MyNat
