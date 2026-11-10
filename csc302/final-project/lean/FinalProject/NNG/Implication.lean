import FinalProject.NNG.Power

/-!
# Peano's axioms (Implication World)

Peano took two facts about `ℕ` as axioms:
* `succ_inj`: if `succ a = succ b` then `a = b`;
* `zero_ne_succ`: `0 ≠ succ a`.

In Lean (and in the game) both are *theorems*: they are proved with the helper
functions `pred` and `is_zero`. This file also proves `succ_ne_zero`,
`zero_ne_one` and `one_ne_zero`.
-/

namespace MyNat

/-- The predecessor function. `pred (succ n) = n`. In the game `pred 0 = 37`:
the value at `0` is deliberately silly; it is never used. -/
def pred : ℕ → ℕ
  | .zero => 37
  | .succ n => n

/-- `pred_succ n` is a proof of `pred (succ n) = n`. -/
theorem pred_succ (n : ℕ) : pred (succ n) = n := rfl

/-- `succ_inj a b` is the proof that `succ a = succ b → a = b`:
the successor function is injective. Peano postulated this as an axiom;
here it is proved using `pred`. -/
theorem succ_inj (a b : ℕ) (h : succ a = succ b) : a = b := by
  rw [← pred_succ a, h, pred_succ]

/-- `is_zero n` is the true-false statement "`n` is zero":
`is_zero 0 = True` and `is_zero (succ n) = False`. -/
def is_zero : ℕ → Prop
  | .zero => True
  | .succ _ => False

/-- `is_zero_zero` is a proof of `is_zero 0 = True`. -/
theorem is_zero_zero : is_zero 0 = True := rfl

/-- `is_zero_succ a` is a proof of `is_zero (succ a) = False`. -/
theorem is_zero_succ (n : ℕ) : is_zero (succ n) = False := rfl

/-- `zero_ne_succ n` is the proof that `0 ≠ succ n`.
Recall that `a ≠ b` means `a = b → False`. -/
theorem zero_ne_succ (a : ℕ) : 0 ≠ succ a := by
  intro h
  rw [← is_zero_succ a, ← h, is_zero_zero]
  trivial

/-- `succ_ne_zero a` is a proof of `succ a ≠ 0`. -/
theorem succ_ne_zero (a : ℕ) : succ a ≠ 0 := by
  intro h
  rw [← is_zero_succ a, h, is_zero_zero]
  trivial

/-- `zero_ne_one` is a proof of `0 ≠ 1`. -/
theorem zero_ne_one : (0 : ℕ) ≠ 1 := by
  rw [one_eq_succ_zero]
  exact zero_ne_succ 0

/-- `one_ne_zero` is a proof that `1 ≠ 0`. -/
theorem one_ne_zero : (1 : ℕ) ≠ 0 := by
  intro h
  exact zero_ne_one h.symm

end MyNat
