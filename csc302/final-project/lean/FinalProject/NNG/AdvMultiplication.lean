import FinalProject.NNG.LessOrEqual

/-!
# Cancellation and zero for multiplication (Advanced Multiplication World)

This file proves the theorems of the game's Advanced Multiplication World:
`mul_le_mul_right`, `mul_left_ne_zero`, `eq_succ_of_ne_zero`, `one_le_of_ne_zero`,
`le_mul_right`, `mul_right_eq_one`, `mul_ne_zero`, `mul_eq_zero`,
`mul_left_cancel`, `mul_right_eq_self`.
-/

namespace MyNat

/-- `mul_le_mul_right a b t` is a proof that `a ≤ b → a * t ≤ b * t`. -/
theorem mul_le_mul_right (a b t : ℕ) (h : a ≤ b) : a * t ≤ b * t := by
  obtain ⟨d, hd⟩ := h
  use d * t
  rw [hd, add_mul]

/-- `mul_left_ne_zero a b` is a proof that `a * b ≠ 0 → b ≠ 0`. -/
theorem mul_left_ne_zero (a b : ℕ) (h : a * b ≠ 0) : b ≠ 0 := by
  intro hb
  apply h
  rw [hb, mul_zero]

/-- `eq_succ_of_ne_zero a` is a proof that `a ≠ 0 → ∃ n, a = succ n`. -/
theorem eq_succ_of_ne_zero (a : ℕ) (ha : a ≠ 0) : ∃ n, a = succ n := by
  cases a with
  | zero =>
    exfalso
    exact ha rfl
  | succ n =>
    use n

/-- `one_le_of_ne_zero a` is a proof that `a ≠ 0 → 1 ≤ a`. -/
theorem one_le_of_ne_zero (a : ℕ) (ha : a ≠ 0) : 1 ≤ a := by
  obtain ⟨n, hn⟩ := eq_succ_of_ne_zero a ha
  use n
  rw [hn, succ_eq_add_one, add_comm]

/-- `le_mul_right a b` is a proof that `a * b ≠ 0 → a ≤ a * b`.
It's one way of saying that a divisor of a positive number
has to be at most that number. -/
theorem le_mul_right (a b : ℕ) (h : a * b ≠ 0) : a ≤ a * b := by
  have hb : b ≠ 0 := mul_left_ne_zero a b h
  have h1 : 1 ≤ b := one_le_of_ne_zero b hb
  have h2 : 1 * a ≤ b * a := mul_le_mul_right 1 b a h1
  rw [one_mul, mul_comm] at h2
  exact h2

/-- `mul_right_eq_one a b` is a proof that `a * b = 1 → a = 1`. -/
theorem mul_right_eq_one (x y : ℕ) (h : x * y = 1) : x = 1 := by
  have h2 : x * y ≠ 0 := by
    rw [h]
    exact one_ne_zero
  have h3 : x ≤ x * y := le_mul_right x y h2
  rw [h] at h3
  cases le_one x h3 with
  | inl h0 =>
    rw [h0, zero_mul] at h
    exfalso
    exact zero_ne_one h
  | inr h1 => exact h1

/-- `mul_ne_zero a b` is a proof that if `a ≠ 0` and `b ≠ 0` then `a * b ≠ 0`. -/
theorem mul_ne_zero (a b : ℕ) (ha : a ≠ 0) (hb : b ≠ 0) : a * b ≠ 0 := by
  obtain ⟨n, hn⟩ := eq_succ_of_ne_zero a ha
  obtain ⟨m, hm⟩ := eq_succ_of_ne_zero b hb
  rw [hn, hm, mul_succ, add_succ]
  exact succ_ne_zero _

/-- `mul_eq_zero a b` is a proof that if `a * b = 0` then `a = 0` or `b = 0`. -/
theorem mul_eq_zero (a b : ℕ) (h : a * b = 0) : a = 0 ∨ b = 0 := by
  cases a with
  | zero =>
    left
    rfl
  | succ n =>
    right
    cases b with
    | zero => rfl
    | succ m =>
      exfalso
      exact mul_ne_zero (succ n) (succ m) (succ_ne_zero n) (succ_ne_zero m) h

/-- `mul_left_cancel a b c` is a proof that if `a ≠ 0` and `a * b = a * c` then `b = c`. -/
theorem mul_left_cancel (a b c : ℕ) (ha : a ≠ 0) (h : a * b = a * c) : b = c := by
  induction b generalizing c with
  | zero =>
    rw [mul_zero] at h
    cases mul_eq_zero a c h.symm with
    | inl h0 =>
      exfalso
      exact ha h0
    | inr h0 => rw [h0]
  | succ d ih =>
    cases c with
    | zero =>
      rw [mul_zero] at h
      cases mul_eq_zero a (succ d) h with
      | inl h0 =>
        exfalso
        exact ha h0
      | inr h0 =>
        exfalso
        exact succ_ne_zero d h0
    | succ e =>
      rw [mul_succ, mul_succ] at h
      have h2 : a * d = a * e := add_right_cancel (a * d) (a * e) a h
      rw [ih e h2]

/-- `mul_right_eq_self a b` is a proof that if `a ≠ 0` and `a * b = a` then `b = 1`. -/
theorem mul_right_eq_self (a b : ℕ) (ha : a ≠ 0) (h : a * b = a) : b = 1 := by
  apply mul_left_cancel a b 1 ha
  rw [mul_one]
  exact h

end MyNat
