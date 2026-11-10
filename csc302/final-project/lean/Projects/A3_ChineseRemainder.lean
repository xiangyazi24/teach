import FinalProject

/-!
# A3. The Chinese remainder theorem  (★★★)

If `gcd m n = 1`, then for all `a, b` there is `x` with `x ≡ a (mod m)` and
`x ≡ b (mod n)`, and two such solutions are congruent modulo `m * n`. Write a function
that computes such an `x` and `#eval` it on Sunzi's problem:
`x ≡ 2 (mod 3)`, `x ≡ 3 (mod 5)`, `x ≡ 2 (mod 7)`.
Key lemma for uniqueness: if `m ∣ k`, `n ∣ k` and `gcd m n = 1`, then `m * n ∣ k`.

Needs: topic A1 (`gcd`, its properties, Bézout; prove them as the first part of this
file; the size below includes them).

Size: about 300–400 lines, comments included (guideline: 308 lines measured).

Rules for the submitted file:
* It compiles with `scripts/check.sh`, with no `sorry`, `admit`, `axiom` or `native_decide`.
* It ends with `#print axioms` for the main theorem (only `propext`, `Classical.choice`,
  `Quot.sound` may appear).
* `grind` only to close an equation between polynomial expressions; never for
  inequalities, divisibility or logic.
* Import only `FinalProject`. No Mathlib, no Lean `Nat` theorems, no `omega`.

The statements that mention `gcd` or your CRT function are in comment blocks, because you
define these yourself. Once your definitions compile, remove the comment markers and prove
the statements; do not weaken them.
-/

namespace MyNat

/-! ## Part A1: `gcd` and Bézout

-- TODO: define `gcd` by Euclid's recursion (`gcd 0 b = b`, `gcd a b = gcd (b % a) a`
-- for `a ≠ 0`), and if you like the extended algorithm, and prove what you need from
-- topic A1, at least:

/-- `gcd a b ∣ a`. -/
theorem gcd_dvd_left (a b : ℕ) : gcd a b ∣ a := by
  sorry

/-- `gcd a b ∣ b`. -/
theorem gcd_dvd_right (a b : ℕ) : gcd a b ∣ b := by
  sorry

/-- Every common divisor of `a` and `b` divides `gcd a b`. -/
theorem dvd_gcd {d a b : ℕ} (ha : d ∣ a) (hb : d ∣ b) : d ∣ gcd a b := by
  sorry

/-- Bézout without negative numbers: if `a ≠ 0`, then `a * x = b * y + gcd a b` for some `x, y`. -/
theorem bezout (a b : ℕ) (ha : a ≠ 0) : ∃ x y, a * x = b * y + gcd a b := by
  sorry
-/

/-! ## Existence

-- TODO: define
--   def crt (a b m n : ℕ) : ℕ := ...
-- computing a solution of `x ≡ a (mod m)`, `x ≡ b (mod n)` when `gcd m n = 1`
-- (for example from the Bézout coefficients of `m` and `n`).

Required statements (after defining `gcd` and `crt`):

/-- Your function is correct: if `gcd m n = 1`, then `crt a b m n ≡ a (mod m)` and
`crt a b m n ≡ b (mod n)`. -/
theorem crt_spec {m n : ℕ} (h : gcd m n = 1) (a b : ℕ) :
    crt a b m n ≡ a [MOD m] ∧ crt a b m n ≡ b [MOD n] := by
  sorry

/-- **Chinese remainder theorem, existence.** If `gcd m n = 1`, then for all `a, b` there
is `x` with `x ≡ a (mod m)` and `x ≡ b (mod n)`. -/
theorem crt_exists {m n : ℕ} (h : gcd m n = 1) (a b : ℕ) :
    ∃ x, x ≡ a [MOD m] ∧ x ≡ b [MOD n] := by
  sorry

-- Sunzi's problem: solve the first two congruences, then combine with the third.
#eval crt (crt 2 3 3 5) 2 15 7    -- should print a solution, e.g. 23
-/

/-! ## Uniqueness

Required statements (after defining `gcd`):

/-- **Key lemma.** If `gcd m n = 1`, `m ∣ k` and `n ∣ k`, then `m * n ∣ k`. -/
theorem mul_dvd_of_coprime {m n k : ℕ} (h : gcd m n = 1) (hm : m ∣ k) (hn : n ∣ k) :
    m * n ∣ k := by
  sorry

/-- **Chinese remainder theorem, uniqueness.** If `gcd m n = 1` and both `x` and `y` satisfy
`· ≡ a (mod m)` and `· ≡ b (mod n)`, then `x ≡ y (mod m * n)`. -/
theorem crt_unique {m n : ℕ} (h : gcd m n = 1) {a b x y : ℕ}
    (hxa : x ≡ a [MOD m]) (hxb : x ≡ b [MOD n])
    (hya : y ≡ a [MOD m]) (hyb : y ≡ b [MOD n]) : x ≡ y [MOD m * n] := by
  sorry

#print axioms crt_spec
#print axioms crt_exists
#print axioms crt_unique
-/

/-- Sunzi's problem has the solution `23`: `23 ≡ 2 (mod 3)`, `23 ≡ 3 (mod 5)`,
`23 ≡ 2 (mod 7)`. (Check your `crt` against this.) -/
theorem sunzi : (23 : ℕ) ≡ 2 [MOD 3] ∧ (23 : ℕ) ≡ 3 [MOD 5] ∧ (23 : ℕ) ≡ 2 [MOD 7] := by
  sorry

#print axioms sunzi

end MyNat
