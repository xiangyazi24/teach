import FinalProject.NNG

/-!
# F2. The division algorithm  (★★)

The theorem behind `%`: for `n ≠ 0` and any `a` there are `q, r` with `a = n * q + r` and
`r < n`, and they are unique. Starting from the Natural Number Game alone, prove existence
and uniqueness, define `div` and `mod` as functions, prove that they return exactly this
`q` and `r`, and check examples with `#eval`. The extension proves the rules of remainder
arithmetic for sums and products.

Size: about 300–400 lines, comments included (guideline estimate: 300–350 lines).

Rules for the submitted file:
* It compiles with `scripts/check.sh`, with no `sorry`, `admit`, `axiom` or `native_decide`.
* It ends with `#print axioms` for the main theorem (only `propext`, `Classical.choice`,
  `Quot.sound` may appear).
* `grind` only to close an equation between polynomial expressions; never for
  inequalities, divisibility or logic.
* Track F: import only `FinalProject.NNG`. No Mathlib, no Lean `Nat` theorems, no `omega`.

Everything lives in the namespace `F2`, so the names do not clash with the library's
`FinalProject.Modulo.*` (which you may read, but not import or copy).
-/

open MyNat

namespace F2

/-! ## The definition of `<` -/

/-- `lt a b`, written `a < b`, means `a + 1 ≤ b`. -/
def lt (a b : ℕ) : Prop := a + 1 ≤ b

/-- The notation `a < b` for `lt a b`. -/
instance : LT MyNat := ⟨F2.lt⟩

/-- `a < b` is by definition `a + 1 ≤ b`. -/
theorem lt_iff_add_one_le (a b : ℕ) : a < b ↔ a + 1 ≤ b := Iff.rfl

-- Prove the facts about `<` that you need here.

/-! ## The division theorem -/

/-- **Existence.** For `n ≠ 0` and any `a` there are `q, r` with `a = n * q + r` and `r < n`. -/
theorem div_exists (a : ℕ) {n : ℕ} (hn : n ≠ 0) : ∃ q r, a = n * q + r ∧ r < n := by
  sorry

/-- **Uniqueness.** If `n * q + r = n * q' + r'` with `r < n` and `r' < n`,
then `q = q'` and `r = r'`. -/
theorem div_unique {n q r q' r' : ℕ} (hr : r < n) (hr' : r' < n)
    (h : n * q + r = n * q' + r') : q = q' ∧ r = r' := by
  sorry

/-! ## The functions `div` and `mod`

Defining them is part of the exercise.

-- TODO: define
--   def div (a n : ℕ) : ℕ := ...     -- the quotient of `a` by `n`
--   def mod (a n : ℕ) : ℕ := ...     -- the remainder of `a` by `n`
-- They must compute (`#eval mod 17 5` prints `2`). You choose the values for `n = 0`.
-- Hint: recursion on `a` (structural, like the library's `MyNat.mod`) avoids
-- well-founded recursion; recursion that subtracts `n` needs `termination_by`.

Once they are defined, turn these statements into theorems (remove the comment markers):

/-- `n * div a n + mod a n = a` for `n ≠ 0`. -/
theorem div_add_mod (a : ℕ) {n : ℕ} (hn : n ≠ 0) : n * div a n + mod a n = a := by
  sorry

/-- The remainder is smaller than `n`, for `n ≠ 0`. -/
theorem mod_lt (a : ℕ) {n : ℕ} (hn : n ≠ 0) : mod a n < n := by
  sorry

/-- **`div` and `mod` return exactly the `q` and `r` of the division theorem:**
if `a = n * q + r` and `r < n`, then `div a n = q` and `mod a n = r`. -/
theorem div_mod_eq {a n q r : ℕ} (h : a = n * q + r) (hr : r < n) :
    div a n = q ∧ mod a n = r := by
  sorry

-- Examples, e.g.:
#eval div 17 5   -- 3
#eval mod 17 5   -- 2
example : mod 17 5 = 2 := by decide   -- works if `mod` is structurally recursive

/-! ## Extension: remainder arithmetic -/

/-- `(a + b) mod n = ((a mod n) + (b mod n)) mod n`, for `n ≠ 0`. -/
theorem mod_add (a b : ℕ) {n : ℕ} (hn : n ≠ 0) :
    mod (a + b) n = mod (mod a n + mod b n) n := by
  sorry

/-- `(a * b) mod n = ((a mod n) * (b mod n)) mod n`, for `n ≠ 0`. -/
theorem mod_mul (a b : ℕ) {n : ℕ} (hn : n ≠ 0) :
    mod (a * b) n = mod (mod a n * mod b n) n := by
  sorry

#print axioms div_mod_eq
-/

#print axioms div_exists
#print axioms div_unique

end F2
