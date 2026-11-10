import FinalProject.NNG

/-!
# F5. The pigeonhole principle  (★★★)

If `n + 1` numbers `f 0, …, f n` all lie below `n`, two of them are equal. Apply it: among
any `n + 1` numbers, two are congruent modulo `n` (for `n ≥ 1`); and for every `n ≥ 1`, one
of the numbers `1, 11, 111, …` (with at most `n + 1` ones) leaves the same remainder modulo
`n` as an earlier one.

Size: about 300–400 lines, comments included (guideline estimate: about 300 lines).

Rules for the submitted file:
* It compiles with `scripts/check.sh`, with no `sorry`, `admit`, `axiom` or `native_decide`.
* It ends with `#print axioms` for the main theorem (only `propext`, `Classical.choice`,
  `Quot.sound` may appear).
* `grind` only to close an equation between polynomial expressions; never for
  inequalities, divisibility or logic.
* Track F: import only `FinalProject.NNG`. No Mathlib, no Lean `Nat` theorems, no `omega`.

Everything lives in the namespace `F5`. Track F has no `%`: "`a` and `b` leave the same
remainder modulo `n`" is expressed as "`a` and `b` differ by a multiple of `n`" (`ModEq`
below). For the applications you need that every number has a remainder `r < n`, i.e.
`a = n * q + r`; prove it (it is the existence half of topic F2).
-/

open MyNat

namespace F5

/-! ## The definition of `<` -/

/-- `lt a b`, written `a < b`, means `a + 1 ≤ b`. -/
def lt (a b : ℕ) : Prop := a + 1 ≤ b

/-- The notation `a < b` for `lt a b`. -/
instance : LT MyNat := ⟨F5.lt⟩

/-- `a < b` is by definition `a + 1 ≤ b`. -/
theorem lt_iff_add_one_le (a b : ℕ) : a < b ↔ a + 1 ≤ b := Iff.rfl

-- Prove the facts about `<` that you need here.

/-! ## The pigeonhole principle -/

/-- **Pigeonhole principle.** If `f 0, f 1, …, f n` (that is, `n + 1` values) all lie
below `n`, then two of them are equal: `f i = f j` for some `i < j ≤ n`. -/
theorem pigeonhole (n : ℕ) (f : ℕ → ℕ) (hf : ∀ i, i ≤ n → f i < n) :
    ∃ i j, i < j ∧ j ≤ n ∧ f i = f j := by
  sorry

/-! ## Application 1: two of `n + 1` numbers are congruent modulo `n` -/

/-- `ModEq n a b`: `a` and `b` differ by a multiple of `n`
(equivalently, they leave the same remainder modulo `n`). -/
def ModEq (n a b : ℕ) : Prop := ∃ k, b = a + n * k ∨ a = b + n * k

/-- **Every number has a remainder modulo `n ≠ 0`:** `a = n * q + r` with `r < n`. -/
theorem exists_rem (a : ℕ) {n : ℕ} (hn : n ≠ 0) : ∃ q r, a = n * q + r ∧ r < n := by
  sorry

/-- **Among any `n + 1` numbers `x 0, …, x n`, two are congruent modulo `n`**, for `n ≠ 0`. -/
theorem exists_modEq (n : ℕ) (hn : n ≠ 0) (x : ℕ → ℕ) :
    ∃ i j, i < j ∧ j ≤ n ∧ ModEq n (x i) (x j) := by
  sorry

/-! ## Application 2: repunits -/

/-- `rep k = 11…1` (`k` ones): `rep 0 = 0`, `rep (k + 1) = 10 * rep k + 1`. -/
def rep : ℕ → ℕ
  | .zero => 0
  | .succ k => 10 * rep k + 1

/-- **Repunits modulo `n`.** For `n ≥ 1`, among `1, 11, 111, …` with at most `n + 1` ones,
one leaves the same remainder modulo `n` as an earlier one:
`rep i ≡ rep j (mod n)` for some `1 ≤ i < j ≤ n + 1`. -/
theorem exists_rep_modEq (n : ℕ) (hn : n ≠ 0) :
    ∃ i j, 1 ≤ i ∧ i < j ∧ j ≤ succ n ∧ ModEq n (rep i) (rep j) := by
  sorry

#print axioms pigeonhole
#print axioms exists_modEq
#print axioms exists_rep_modEq

end F5
