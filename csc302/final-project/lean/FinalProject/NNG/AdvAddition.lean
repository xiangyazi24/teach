import FinalProject.NNG.Implication

/-!
# Cancellation for addition (Advanced Addition World)

This file proves the theorems of the game's Advanced Addition World:
`add_right_cancel`, `add_left_cancel`, `add_left_eq_self`, `add_right_eq_self`,
`add_right_eq_zero`, `add_left_eq_zero`.
-/

namespace MyNat

/-- `add_right_cancel a b n` is the theorem that `a + n = b + n → a = b`. -/
theorem add_right_cancel (a b n : ℕ) : a + n = b + n → a = b := by
  induction n with
  | zero =>
    intro h
    rw [add_zero, add_zero] at h
    exact h
  | succ d ih =>
    intro h
    rw [add_succ, add_succ] at h
    apply ih
    exact succ_inj (a + d) (b + d) h

/-- `add_left_cancel a b n` is the theorem that `n + a = n + b → a = b`. -/
theorem add_left_cancel (a b n : ℕ) : n + a = n + b → a = b := by
  rw [add_comm n a, add_comm n b]
  exact add_right_cancel a b n

/-- `add_left_eq_self x y` is the theorem that `x + y = y → x = 0`. -/
theorem add_left_eq_self (x y : ℕ) : x + y = y → x = 0 := by
  intro h
  have h2 : x + y = 0 + y := by
    rw [zero_add]
    exact h
  exact add_right_cancel x 0 y h2

/-- `add_right_eq_self x y` is the theorem that `x + y = x → y = 0`. -/
theorem add_right_eq_self (x y : ℕ) : x + y = x → y = 0 := by
  rw [add_comm]
  exact add_left_eq_self y x

/-- `add_right_eq_zero a b` is a proof that `a + b = 0 → a = 0`. -/
theorem add_right_eq_zero (a b : ℕ) : a + b = 0 → a = 0 := by
  intro h
  cases b with
  | zero =>
    rw [add_zero] at h
    exact h
  | succ d =>
    rw [add_succ] at h
    exfalso
    exact succ_ne_zero (a + d) h

/-- `add_left_eq_zero a b` is a proof that `a + b = 0 → b = 0`. -/
theorem add_left_eq_zero (a b : ℕ) : a + b = 0 → b = 0 := by
  rw [add_comm]
  exact add_right_eq_zero b a

end MyNat
