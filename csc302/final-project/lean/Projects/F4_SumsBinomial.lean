import FinalProject.NNG

/-!
# F4. Finite sums and the binomial theorem  (★★★)

Define `sum n f = f 0 + f 1 + ⋯ + f (n - 1)` by recursion. Prove
`2 * (0 + 1 + ⋯ + n) = n * (n + 1)` and that the first `n` odd numbers sum to `n²`. Define
binomial coefficients by Pascal's rule and prove the binomial theorem
`(a + b)^n = ∑ₖ C(n, k) aᵏ bⁿ⁻ᵏ`. Since there is no subtraction, part of the work is to state
it without `n - k`; below it is stated as a sum over the pairs `(i, j)` with `i + j = n`.

Size: about 300–400 lines, comments included (guideline estimate: 350–450 lines).

Rules for the submitted file:
* It compiles with `scripts/check.sh`, with no `sorry`, `admit`, `axiom` or `native_decide`.
* It ends with `#print axioms` for the main theorem (only `propext`, `Classical.choice`,
  `Quot.sound` may appear).
* `grind` only to close an equation between polynomial expressions; never for
  inequalities, divisibility or logic.
* Track F: import only `FinalProject.NNG`. No Mathlib, no Lean `Nat` theorems, no `omega`.

Everything lives in the namespace `F4`.

The subtraction-free form of the binomial theorem below (`sumPairs`) is one choice. You may
choose another one (for example with two sums, or a sum with a reversed index); if you do,
explain in the report why your statement says the same as the binomial theorem.
-/

open MyNat

namespace F4

/-! ## Finite sums -/

/-- `sum n f = f 0 + f 1 + ⋯ + f (n - 1)`: `sum 0 f = 0`, `sum (n + 1) f = sum n f + f n`. -/
def sum : ℕ → (ℕ → ℕ) → ℕ
  | .zero, _ => 0
  | .succ n, f => sum n f + f n

/-- `sum 0 f = 0`. -/
theorem sum_zero (f : ℕ → ℕ) : sum 0 f = 0 := rfl

/-- `sum (n + 1) f = sum n f + f n`. -/
theorem sum_succ (n : ℕ) (f : ℕ → ℕ) : sum (succ n) f = sum n f + f n := rfl

/-- **Gauss's formula:** `2 * (0 + 1 + ⋯ + n) = n * (n + 1)`. -/
theorem two_mul_sum_id (n : ℕ) : 2 * sum (succ n) (fun i => i) = n * succ n := by
  sorry

/-- **Sum of odd numbers:** `1 + 3 + ⋯ + (2n - 1) = n²`. -/
theorem sum_odd (n : ℕ) : sum n (fun i => 2 * i + 1) = n ^ 2 := by
  sorry

/-! ## Binomial coefficients -/

/-- Binomial coefficients by Pascal's rule:
`C(0, 0) = 1`, `C(0, k + 1) = 0`, `C(n + 1, 0) = 1`,
`C(n + 1, k + 1) = C(n, k) + C(n, k + 1)`. -/
def choose : ℕ → ℕ → ℕ
  | .zero, .zero => 1
  | .zero, .succ _ => 0
  | .succ _, .zero => 1
  | .succ n, .succ k => choose n k + choose n (succ k)

/-- `C(n, 0) = 1`. -/
theorem choose_zero_right (n : ℕ) : choose n 0 = 1 := by
  sorry

/-- `C(n, k) = 0` when `k > n`, stated without `<`: `C(n, n + 1 + j) = 0`. -/
theorem choose_eq_zero (n j : ℕ) : choose n (succ n + j) = 0 := by
  sorry

/-- `C(n, n) = 1`. -/
theorem choose_self (n : ℕ) : choose n n = 1 := by
  sorry

/-! ## The binomial theorem -/

/-- `sumPairs n g` is the sum of `g i j` over all pairs with `i + j = n`:
`g 0 n + g 1 (n - 1) + ⋯ + g n 0`, defined without subtraction by
`sumPairs 0 g = g 0 0` and `sumPairs (n + 1) g = g 0 (n + 1) + sumPairs n (fun i j => g (i + 1) j)`. -/
def sumPairs : ℕ → (ℕ → ℕ → ℕ) → ℕ
  | .zero, g => g 0 0
  | .succ n, g => g 0 (succ n) + sumPairs n (fun i j => g (succ i) j)

/-- **The binomial theorem:** `(a + b)^n` is the sum, over the pairs `i + j = n`,
of `C(n, i) * a^i * b^j`. -/
theorem binomial (a b n : ℕ) :
    (a + b) ^ n = sumPairs n (fun i j => choose n i * a ^ i * b ^ j) := by
  sorry

#print axioms two_mul_sum_id
#print axioms sum_odd
#print axioms binomial

end F4
