import FinalProject

/-!
# C3. Wilson's theorem  (★★★★★)

For a prime `p`, `(p - 1)! ≡ -1 (mod p)`. Without subtraction: if `p = k + 1` is prime,
then `p ∣ k ! + 1`. The proof pairs each number with its inverse modulo `p`; making that
pairing precise is the hard part. For ambitious teams only.

Needs: topic A2 (inverses modulo `n`, which needs `gcd` and Bézout from A1). Prove what you
need as the first part of this file; the size below includes it.

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

/-! ## Part A2: inverses modulo a prime

-- TODO: define `gcd`, prove Bézout (topic A1) and what you need from topic A2.
-- For Wilson's theorem only primes matter; a statement you will need, with no `gcd` in it:
-/

/-- **Inverses modulo a prime:** if `p` is prime and `p ∤ c`, there is `x` with
`c * x ≡ 1 (mod p)`. -/
theorem exists_inverse_mod_prime {p c : ℕ} (hp : Prime p) (hc : ¬ p ∣ c) :
    ∃ x, c * x ≡ 1 [MOD p] := by
  sorry

/-- **Only `1` and `p - 1` are their own inverses:** if `p` is prime and
`x * x ≡ 1 (mod p)`, then `x ≡ 1 (mod p)` or `x + 1 ≡ 0 (mod p)`. -/
theorem self_inverse_mod_prime {p x : ℕ} (hp : Prime p) (h : x * x ≡ 1 [MOD p]) :
    x ≡ 1 [MOD p] ∨ x + 1 ≡ 0 [MOD p] := by
  sorry

/-! ## The factorial -/

/-- The factorial: `0 ! = 1` and `(n + 1) ! = (n + 1) * n !`. -/
def factorial : ℕ → ℕ
  | .zero => 1
  | .succ n => succ n * factorial n

/-- The notation `n !` for `factorial n`. -/
notation:10000 n "!" => factorial n

/-! ## Wilson's theorem -/

/-- **Wilson's theorem (without subtraction):** if `p = k + 1` is prime, then
`p ∣ k ! + 1`, i.e. `(p - 1)! ≡ -1 (mod p)`. -/
theorem wilson {k : ℕ} (hp : Prime (k + 1)) : k + 1 ∣ k ! + 1 := by
  sorry

#print axioms wilson

end MyNat
