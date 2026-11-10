import FinalProject

/-!
# B2. Euclid's lemma and unique factorization  (★★★)

Euclid's lemma: if `p` is prime and `p ∣ a * b`, then `p ∣ a` or `p ∣ b`. With the product
of a list, `prod : List ℕ → ℕ`: every `n ≥ 1` is the product of a list of primes
(existence), and two lists of primes with the same product are permutations of each other
(uniqueness, with Lean's `List.Perm`).
Useful lemmas from Lean's list library: `List.append_of_mem`, `List.perm_middle`,
`List.Perm.cons`, `List.Perm.trans`, `List.mem_cons`.

Needs: `gcd`, `gcd_dvd_left`, `gcd_dvd_right` and Bézout from A1 (prove them as the first
part of this file; the size below includes them).

Size: about 300–400 lines, comments included (guideline: 323 lines measured).

Rules for the submitted file:
* It compiles with `scripts/check.sh`, with no `sorry`, `admit`, `axiom` or `native_decide`.
* It ends with `#print axioms` for the main theorem (only `propext`, `Classical.choice`,
  `Quot.sound` may appear).
* `grind` only to close an equation between polynomial expressions; never for
  inequalities, divisibility or logic.
* Import only `FinalProject`. No Mathlib, no Lean `Nat` theorems, no `omega`.

The statements that mention `gcd` are in a comment block, because you define `gcd` yourself
(part A1). Once your definition compiles, remove the comment markers and prove them; do not
weaken them.
-/

namespace MyNat

/-! ## Part A1: `gcd` and Bézout

-- TODO: define `gcd` by Euclid's recursion (`gcd 0 b = b`, `gcd a b = gcd (b % a) a`
-- for `a ≠ 0`) and prove:

/-- `gcd a b ∣ a`. -/
theorem gcd_dvd_left (a b : ℕ) : gcd a b ∣ a := by
  sorry

/-- `gcd a b ∣ b`. -/
theorem gcd_dvd_right (a b : ℕ) : gcd a b ∣ b := by
  sorry

/-- Bézout without negative numbers: if `a ≠ 0`, then `a * x = b * y + gcd a b` for some `x, y`. -/
theorem bezout (a b : ℕ) (ha : a ≠ 0) : ∃ x y, a * x = b * y + gcd a b := by
  sorry
-/

/-! ## Euclid's lemma -/

/-- **Euclid's lemma:** if `p` is prime and `p ∣ a * b`, then `p ∣ a` or `p ∣ b`. -/
theorem euclid_lemma {p a b : ℕ} (hp : Prime p) (h : p ∣ a * b) : p ∣ a ∨ p ∣ b := by
  sorry

/-! ## Products of lists -/

/-- The product of a list: `prod [] = 1`, `prod (a :: l) = a * prod l`. -/
def prod : List ℕ → ℕ
  | [] => 1
  | a :: l => a * prod l

/-- `prod [] = 1`. -/
theorem prod_nil : prod [] = 1 := rfl

/-- `prod (a :: l) = a * prod l`. -/
theorem prod_cons (a : ℕ) (l : List ℕ) : prod (a :: l) = a * prod l := rfl

/-- `AllPrime l`: every entry of the list `l` is prime. -/
def AllPrime (l : List ℕ) : Prop := ∀ q, q ∈ l → Prime q

/-! ## Existence -/

/-- **Existence of a prime factorization:** every `n ≥ 1` is the product of a list of primes
(for `n = 1`, the empty list). -/
theorem exists_prime_factorization (n : ℕ) (hn : 1 ≤ n) :
    ∃ l, AllPrime l ∧ prod l = n := by
  sorry

/-! ## Uniqueness -/

/-- **Uniqueness of the prime factorization:** two lists of primes with the same product
are permutations of each other. -/
theorem prime_factorization_unique (l₁ l₂ : List ℕ) (h₁ : AllPrime l₁) (h₂ : AllPrime l₂)
    (h : prod l₁ = prod l₂) : l₁.Perm l₂ := by
  sorry

#print axioms euclid_lemma
#print axioms exists_prime_factorization
#print axioms prime_factorization_unique

end MyNat
