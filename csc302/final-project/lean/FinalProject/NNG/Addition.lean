import FinalProject.NNG.Definition

/-!
# Addition (Tutorial World and Addition World)

This file defines addition on `ℕ` and proves the theorems of the game's
Tutorial World (`succ_eq_add_one`) and Addition World
(`zero_add`, `succ_add`, `add_comm`, `add_assoc`, `add_right_comm`).

In the online game, `add_zero` and `add_succ` are axioms. Here addition is
*defined* by recursion on the second number, and these two facts are theorems
that hold by definition (`rfl`). Their names and statements are the game's.
-/

namespace MyNat

/-- Addition, by recursion on the second number:
`a + 0 = a` and `a + succ b = succ (a + b)`. -/
def add : ℕ → ℕ → ℕ
  | a, .zero => a
  | a, .succ b => succ (add a b)

/-- The notation `a + b` for `add a b`. -/
instance instAdd : Add MyNat where
  add := MyNat.add

/-- `add_zero a` is a proof that `a + 0 = a`. (An axiom in the game; true by definition here.) -/
theorem add_zero (a : ℕ) : a + 0 = a := rfl

/-- `add_succ a d` is the proof of `a + succ d = succ (a + d)`.
(An axiom in the game; true by definition here.) -/
theorem add_succ (a d : ℕ) : a + succ d = succ (a + d) := rfl

/-- `succ_eq_add_one n` is the proof that `succ n = n + 1`. -/
theorem succ_eq_add_one (n : ℕ) : succ n = n + 1 := by
  rw [one_eq_succ_zero, add_succ, add_zero]

/-- `zero_add x` is the proof of `0 + x = x`. -/
theorem zero_add (n : ℕ) : 0 + n = n := by
  induction n with
  | zero => rw [add_zero]
  | succ n ih => rw [add_succ, ih]

/-- `succ_add a b` is a proof that `succ a + b = succ (a + b)`. -/
theorem succ_add (a b : ℕ) : succ a + b = succ (a + b) := by
  induction b with
  | zero => rw [add_zero, add_zero]
  | succ d ih => rw [add_succ, ih, add_succ]

/-- `add_comm x y` is a proof of `x + y = y + x`. -/
theorem add_comm (a b : ℕ) : a + b = b + a := by
  induction b with
  | zero => rw [add_zero, zero_add]
  | succ d ih => rw [add_succ, ih, succ_add]

/-- `add_assoc a b c` is a proof that `(a + b) + c = a + (b + c)`.
Lean prints `(a + b) + c` as `a + b + c`, since `+` associates to the left. -/
theorem add_assoc (a b c : ℕ) : a + b + c = a + (b + c) := by
  induction c with
  | zero => rw [add_zero, add_zero]
  | succ n ih => rw [add_succ, add_succ, ih, add_succ]

/-- `add_right_comm a b c` is a proof that `(a + b) + c = (a + c) + b`. -/
theorem add_right_comm (a b c : ℕ) : a + b + c = a + c + b := by
  rw [add_assoc, add_comm b c, ← add_assoc]

end MyNat
