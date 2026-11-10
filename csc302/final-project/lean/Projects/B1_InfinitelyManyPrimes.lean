import FinalProject

/-!
# B1. There are infinitely many primes  (★★)

Every `n ≥ 2` has a prime divisor (strong induction). With the factorial and the fact
`d ∣ n!` for `1 ≤ d ≤ n`, Euclid's argument gives: for every `n` there is a prime `p` with
`n < p`. The extension (a) computes the smallest divisor `≥ 2` with a function `minFac`, and
(b) proves that there are infinitely many primes `≡ 3 (mod 4)`.

Size: about 300–400 lines, comments included (guideline: about 350 lines; 172 measured
without the extension). Do the extension.

Rules for the submitted file:
* It compiles with `scripts/check.sh`, with no `sorry`, `admit`, `axiom` or `native_decide`.
* It ends with `#print axioms` for the main theorem (only `propext`, `Classical.choice`,
  `Quot.sound` may appear).
* `grind` only to close an equation between polynomial expressions; never for
  inequalities, divisibility or logic.
* Import only `FinalProject`. No Mathlib, no Lean `Nat` theorems, no `omega`.
-/

namespace MyNat

/-! ## Every `n ≥ 2` has a prime divisor -/

/-- **Every `n ≥ 2` has a prime divisor.** (Strong induction on `n`.) -/
theorem exists_prime_dvd (n : ℕ) (hn : 2 ≤ n) : ∃ p, Prime p ∧ p ∣ n := by
  sorry

/-! ## The factorial -/

/-- The factorial: `0 ! = 1` and `(n + 1) ! = (n + 1) * n !`. -/
def factorial : ℕ → ℕ
  | .zero => 1
  | .succ n => succ n * factorial n

/-- The notation `n !` for `factorial n`. -/
notation:10000 n "!" => factorial n

/-- `0 ! = 1`. -/
theorem factorial_zero : (0 : ℕ) ! = 1 := rfl

/-- `(n + 1) ! = (n + 1) * n !`. -/
theorem factorial_succ (n : ℕ) : (succ n) ! = succ n * n ! := rfl

/-- **Every `d` with `1 ≤ d ≤ n` divides `n !`.** -/
theorem dvd_factorial {d n : ℕ} (hd : 1 ≤ d) (hdn : d ≤ n) : d ∣ n ! := by
  sorry

/-! ## Euclid's theorem -/

/-- **Euclid's theorem: there are infinitely many primes.**
For every `n` there is a prime `p` with `n < p`. -/
theorem exists_prime_gt (n : ℕ) : ∃ p, Prime p ∧ n < p := by
  sorry

/-! ## Extension (a): the smallest divisor

-- TODO: define
--   def minFac (n : ℕ) : ℕ := ...
-- computing the smallest divisor `≥ 2` of `n` (for `n ≥ 2`), e.g. by trying
-- `2, 3, 4, …` in turn. You choose the value for `n < 2`.

Required statements (after defining `minFac`):

/-- `minFac n` divides `n`, for `n ≥ 2`. -/
theorem minFac_dvd (n : ℕ) (hn : 2 ≤ n) : minFac n ∣ n := by
  sorry

/-- `minFac n` is the smallest divisor `≥ 2` of `n`: `2 ≤ minFac n`, and `minFac n ≤ d`
for every divisor `d ≥ 2` of `n`. -/
theorem minFac_min (n : ℕ) (hn : 2 ≤ n) :
    2 ≤ minFac n ∧ ∀ d, 2 ≤ d → d ∣ n → minFac n ≤ d := by
  sorry

/-- **`minFac n` is prime**, for `n ≥ 2`. -/
theorem minFac_prime (n : ℕ) (hn : 2 ≤ n) : Prime (minFac n) := by
  sorry

#eval minFac 91     -- 7
#eval minFac 97     -- 97

#print axioms minFac_prime
-/

/-! ## Extension (b): infinitely many primes `≡ 3 (mod 4)` -/

/-- A product of two numbers `≡ 1 (mod 4)` is `≡ 1 (mod 4)`. -/
theorem mul_modEq_one_four {a b : ℕ} (ha : a ≡ 1 [MOD 4]) (hb : b ≡ 1 [MOD 4]) :
    a * b ≡ 1 [MOD 4] := by
  sorry

/-- **Every `n ≡ 3 (mod 4)` has a prime divisor `p ≡ 3 (mod 4)`.** -/
theorem exists_prime_dvd_three_mod_four {n : ℕ} (hn : n ≡ 3 [MOD 4]) :
    ∃ p, Prime p ∧ p ≡ 3 [MOD 4] ∧ p ∣ n := by
  sorry

/-- **There are infinitely many primes `≡ 3 (mod 4)`:** for every `n` there is such a prime
`p` with `n < p`. Hint: apply the previous theorem to the number `N` with
`N + 1 = 4 * n !`. (In the report: why not `4 * n ! + 3`?) -/
theorem exists_prime_three_mod_four_gt (n : ℕ) :
    ∃ p, Prime p ∧ p ≡ 3 [MOD 4] ∧ n < p := by
  sorry

#print axioms exists_prime_dvd
#print axioms dvd_factorial
#print axioms exists_prime_gt
#print axioms exists_prime_three_mod_four_gt

end MyNat
