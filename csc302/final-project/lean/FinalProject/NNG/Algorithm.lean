import FinalProject.NNG.AdvMultiplication

/-!
# Algorithm World

This file proves the theorems of the game's Algorithm World:
`add_left_comm` and `succ_ne_succ`. (The Peano facts `pred_succ`, `is_zero_zero`,
`is_zero_succ`, `succ_ne_zero` used in that world are in `Implication.lean`,
and the decision procedure for `=` is the `DecidableEq` instance in `Definition.lean`,
so `decide` proves goals such as `(20 : ℕ) + 20 = 40` or `(2 : ℕ) + 2 ≠ 5`.)
-/

namespace MyNat

/-- `add_left_comm a b c` is a proof that `a + (b + c) = b + (a + c)`. -/
theorem add_left_comm (a b c : ℕ) : a + (b + c) = b + (a + c) := by
  rw [← add_assoc, add_comm a b, add_assoc]

/-- `succ_ne_succ m n` is the proof that `m ≠ n → succ m ≠ succ n`. -/
theorem succ_ne_succ (m n : ℕ) (h : m ≠ n) : succ m ≠ succ n := by
  intro h2
  apply h
  exact succ_inj m n h2

example : (20 : ℕ) + 20 = 40 := by decide
example : (2 : ℕ) + 2 ≠ 5 := by decide

end MyNat
