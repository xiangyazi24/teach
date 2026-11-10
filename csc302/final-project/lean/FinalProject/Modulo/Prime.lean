import FinalProject.Modulo.Congruence

/-!
# Prime numbers

This file contains only the shared *definition* of a prime number and a few basic facts:
`Prime.two_le`, `Prime.one_lt`, `Prime.ne_zero`, `prime_two`, `prime_three`,
and a `Decidable (Prime p)` instance, so that `decide` can check that a specific
small number is (or is not) prime.

Greatest common divisors, coprimality, and theorems about primes are left for
the projects.
-/

namespace MyNat

/-- `Prime p` means: `p ≥ 2`, and the only divisors of `p` are `1` and `p`. -/
def Prime (p : ℕ) : Prop := 2 ≤ p ∧ ∀ d, d ∣ p → d = 1 ∨ d = p

/-- A prime is at least `2`. -/
theorem Prime.two_le {p : ℕ} (hp : Prime p) : 2 ≤ p := hp.1

/-- A prime is greater than `1`. (`1 < p` and `2 ≤ p` are the same statement.) -/
theorem Prime.one_lt {p : ℕ} (hp : Prime p) : 1 < p := hp.1

/-- If `2 ≤ p` then `p ≠ 0`. -/
theorem ne_zero_of_two_le {p : ℕ} (h : 2 ≤ p) : p ≠ 0 := by
  intro hp
  rw [hp] at h
  have h2 : (2 : ℕ) = 0 := le_zero 2 h
  rw [two_eq_succ_one] at h2
  exact succ_ne_zero 1 h2

/-- A prime is not `0`. -/
theorem Prime.ne_zero {p : ℕ} (hp : Prime p) : p ≠ 0 :=
  ne_zero_of_two_le hp.1

/-- A prime is not `1`. -/
theorem Prime.ne_one {p : ℕ} (hp : Prime p) : p ≠ 1 := by
  intro h
  have h2 := hp.one_lt
  rw [h] at h2
  exact lt_irrefl 1 h2

/-- To check that `p` is prime it is enough to look at the divisors `d ≤ p`
(every divisor of a nonzero number is at most that number). -/
theorem prime_iff_bounded {p : ℕ} :
    Prime p ↔ 2 ≤ p ∧ ∀ d, d < succ p → (d ∣ p → d = 1 ∨ d = p) := by
  constructor
  · intro hp
    constructor
    · exact hp.1
    · intro d _ hd
      exact hp.2 d hd
  · intro h
    constructor
    · exact h.1
    · intro d hd
      have hpos : 0 < p := pos_iff_ne_zero.mpr (ne_zero_of_two_le h.1)
      exact h.2 d (lt_succ_iff.mpr (le_of_dvd hpos hd)) hd

/-- Being prime is decidable: Lean checks every `d ≤ p`.
This is slow for big numbers, but fine for small ones. -/
instance instDecidablePrime (p : ℕ) : Decidable (Prime p) :=
  decidable_of_iff _ prime_iff_bounded.symm

/-- `2` is prime. -/
theorem prime_two : Prime 2 := by decide

/-- `3` is prime. -/
theorem prime_three : Prime 3 := by decide

example : Prime 7 := by decide
example : ¬ Prime 9 := by decide
example : ¬ Prime 1 := by decide

end MyNat
