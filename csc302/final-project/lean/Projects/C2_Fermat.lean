import FinalProject

/-!
# C2. Fermat's little theorem  (★★★★)

For a prime `p`, `a ^ p ≡ a (mod p)`. Route: binomial coefficients, `p ∣ C(p, k)` for
`0 < k < p`, hence `(a + 1) ^ p ≡ a ^ p + 1 (mod p)`, and induction on `a`.

Needs: Euclid's lemma (topic B2), which in turn needs `gcd` and Bézout from A1. Prove them
as the first part of this file; the size below includes them.

Size: 300–400 lines is the usual target; this topic is larger (guideline estimate:
450–550 lines).

Rules for the submitted file:
* It compiles with `scripts/check.sh`, with no `sorry`, `admit`, `axiom` or `native_decide`.
* It ends with `#print axioms` for the main theorem (only `propext`, `Classical.choice`,
  `Quot.sound` may appear).
* `grind` only to close an equation between polynomial expressions; never for
  inequalities, divisibility or logic.
* Import only `FinalProject`. No Mathlib, no Lean `Nat` theorems, no `omega`.
-/

namespace MyNat

/-! ## Part B2: Euclid's lemma

-- TODO: define `gcd` and prove Bézout (topic A1), as a step towards Euclid's lemma.
-/

/-- **Euclid's lemma:** if `p` is prime and `p ∣ a * b`, then `p ∣ a` or `p ∣ b`. -/
theorem euclid_lemma {p a b : ℕ} (hp : Prime p) (h : p ∣ a * b) : p ∣ a ∨ p ∣ b := by
  sorry

/-! ## Binomial coefficients and finite sums -/

/-- Binomial coefficients by Pascal's rule:
`C(0, 0) = 1`, `C(0, k + 1) = 0`, `C(n + 1, 0) = 1`,
`C(n + 1, k + 1) = C(n, k) + C(n, k + 1)`. -/
def choose : ℕ → ℕ → ℕ
  | .zero, .zero => 1
  | .zero, .succ _ => 0
  | .succ _, .zero => 1
  | .succ n, .succ k => choose n k + choose n (succ k)

/-- `sum n f = f 0 + f 1 + ⋯ + f (n - 1)`: `sum 0 f = 0`, `sum (n + 1) f = sum n f + f n`. -/
def sum : ℕ → (ℕ → ℕ) → ℕ
  | .zero, _ => 0
  | .succ n, f => sum n f + f n

/-- **The binomial theorem for `(a + 1) ^ n`:**
`(a + 1) ^ n = C(n, 0) a⁰ + C(n, 1) a¹ + ⋯ + C(n, n) aⁿ`.
(With `b = 1`, the binomial theorem needs no subtraction.) -/
theorem add_one_pow (a n : ℕ) : (a + 1) ^ n = sum (succ n) (fun k => choose n k * a ^ k) := by
  sorry

/-! ## The prime divides the middle binomial coefficients -/

/-- **`p ∣ C(p, k)` for `0 < k < p`**, when `p` is prime. -/
theorem prime_dvd_choose {p k : ℕ} (hp : Prime p) (hk0 : 0 < k) (hkp : k < p) :
    p ∣ choose p k := by
  sorry

/-- **The "freshman's dream":** `(a + 1) ^ p ≡ a ^ p + 1 (mod p)` for a prime `p`. -/
theorem add_one_pow_modEq {p : ℕ} (hp : Prime p) (a : ℕ) :
    (a + 1) ^ p ≡ a ^ p + 1 [MOD p] := by
  sorry

/-! ## Fermat's little theorem -/

/-- **Fermat's little theorem:** for a prime `p` and every `a`, `a ^ p ≡ a (mod p)`. -/
theorem fermat_little {p : ℕ} (hp : Prime p) (a : ℕ) : a ^ p ≡ a [MOD p] := by
  sorry

#print axioms prime_dvd_choose
#print axioms fermat_little

end MyNat
