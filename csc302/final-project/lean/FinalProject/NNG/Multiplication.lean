import FinalProject.NNG.Addition

/-!
# Multiplication (Multiplication World)

This file defines multiplication on `ℕ` and proves the theorems of the game's
Multiplication World: `mul_one`, `zero_mul`, `succ_mul`, `mul_comm`, `one_mul`,
`two_mul`, `mul_add`, `add_mul`, `mul_assoc`.

In the game, `mul_zero` and `mul_succ` are axioms; here they hold by definition.
-/

namespace MyNat

/-- Multiplication, by recursion on the second number:
`a * 0 = 0` and `a * succ b = a * b + a`. -/
def mul : ℕ → ℕ → ℕ
  | _, .zero => 0
  | a, .succ b => mul a b + a

/-- The notation `a * b` for `mul a b`. -/
instance instMul : Mul MyNat where
  mul := MyNat.mul

/-- `mul_zero m` is the proof that `m * 0 = 0`. (An axiom in the game; true by definition here.) -/
theorem mul_zero (a : ℕ) : a * 0 = 0 := rfl

/-- `mul_succ a b` is the proof that `a * succ b = a * b + a`.
(An axiom in the game; true by definition here.) -/
theorem mul_succ (a b : ℕ) : a * succ b = a * b + a := rfl

/-- `mul_one m` is the proof that `m * 1 = m`. -/
theorem mul_one (m : ℕ) : m * 1 = m := by
  rw [one_eq_succ_zero, mul_succ, mul_zero, zero_add]

/-- `zero_mul x` is the proof that `0 * x = 0`. -/
theorem zero_mul (m : ℕ) : 0 * m = 0 := by
  induction m with
  | zero => rw [mul_zero]
  | succ n ih => rw [mul_succ, ih, add_zero]

/-- `succ_mul a b` is the proof that `succ a * b = a * b + b`. -/
theorem succ_mul (a b : ℕ) : succ a * b = a * b + b := by
  induction b with
  | zero => rw [mul_zero, mul_zero, add_zero]
  | succ d ih =>
    rw [mul_succ, mul_succ, ih, add_succ, add_succ, add_right_comm]

/-- `mul_comm a b` is the proof that `a * b = b * a`. -/
theorem mul_comm (a b : ℕ) : a * b = b * a := by
  induction b with
  | zero => rw [zero_mul, mul_zero]
  | succ d ih => rw [succ_mul, ← ih, mul_succ]

/-- `one_mul m` is the proof `1 * m = m`. -/
theorem one_mul (m : ℕ) : 1 * m = m := by
  rw [mul_comm, mul_one]

/-- `two_mul m` is the proof that `2 * m = m + m`. -/
theorem two_mul (m : ℕ) : 2 * m = m + m := by
  rw [two_eq_succ_one, succ_mul, one_mul]

/-- `mul_add a b c` is the proof that `a * (b + c) = a * b + a * c`:
multiplication distributes over addition on the left. -/
theorem mul_add (a b c : ℕ) : a * (b + c) = a * b + a * c := by
  induction c with
  | zero => rw [add_zero, mul_zero, add_zero]
  | succ n ih => rw [add_succ, mul_succ, ih, mul_succ, add_assoc]

/-- `add_mul a b c` is a proof that `(a + b) * c = a * c + b * c`. -/
theorem add_mul (a b c : ℕ) : (a + b) * c = a * c + b * c := by
  rw [mul_comm, mul_add, mul_comm c a, mul_comm c b]

/-- `mul_assoc a b c` is a proof that `(a * b) * c = a * (b * c)`.
Lean prints `(a * b) * c` as `a * b * c`. -/
theorem mul_assoc (a b c : ℕ) : a * b * c = a * (b * c) := by
  induction c with
  | zero => rw [mul_zero, mul_zero, mul_zero]
  | succ n ih => rw [mul_succ, mul_succ, ih, mul_add]

end MyNat
