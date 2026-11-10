import FinalProject.NNG.Multiplication

/-!
# Powers (Power World)

This file defines `a ^ n` on `ℕ` and proves the theorems of the game's Power World:
`zero_pow_zero`, `zero_pow_succ`, `pow_one`, `one_pow`, `pow_two`, `pow_add`,
`mul_pow`, `pow_pow`, `add_sq`.

In the game, `pow_zero` and `pow_succ` are axioms; here they hold by definition.
Note that `0 ^ 0 = 1`.
-/

namespace MyNat

/-- Exponentiation, by recursion on the exponent:
`m ^ 0 = 1` and `m ^ succ n = m ^ n * m`. -/
def pow : ℕ → ℕ → ℕ
  | _, .zero => 1
  | m, .succ n => pow m n * m

/-- The notation `a ^ n` for `pow a n`. Marked as a default instance so that in
`a ^ 2` with `a : ℕ` the exponent `2` is also read as our `ℕ`
(otherwise Lean would read it as one of its built-in natural numbers). -/
@[default_instance high] instance instPow : Pow MyNat MyNat where
  pow := MyNat.pow

/-- `pow_zero a : a ^ 0 = 1`. (An axiom in the game; true by definition here.) -/
theorem pow_zero (m : ℕ) : m ^ 0 = 1 := rfl

/-- `pow_succ a b : a ^ succ b = a ^ b * a`. (An axiom in the game; true by definition here.) -/
theorem pow_succ (m n : ℕ) : m ^ succ n = m ^ n * m := rfl

/-- `zero_pow_zero` is the proof that `0 ^ 0 = 1`. -/
theorem zero_pow_zero : (0 : ℕ) ^ 0 = 1 := by
  rw [pow_zero]

/-- `zero_pow_succ m` is the proof that `0 ^ succ m = 0`. -/
theorem zero_pow_succ (m : ℕ) : (0 : ℕ) ^ succ m = 0 := by
  rw [pow_succ, mul_zero]

/-- `pow_one a` says that `a ^ 1 = a`. -/
theorem pow_one (a : ℕ) : a ^ 1 = a := by
  rw [one_eq_succ_zero, pow_succ, pow_zero, one_mul]

/-- `one_pow n` is a proof that `1 ^ n = 1`. -/
theorem one_pow (m : ℕ) : (1 : ℕ) ^ m = 1 := by
  induction m with
  | zero => rw [pow_zero]
  | succ t ih => rw [pow_succ, ih, mul_one]

/-- `pow_two a` says that `a ^ 2 = a * a`. -/
theorem pow_two (a : ℕ) : a ^ 2 = a * a := by
  rw [two_eq_succ_one, pow_succ, pow_one]

/-- `pow_add a m n` is a proof that `a ^ (m + n) = a ^ m * a ^ n`. -/
theorem pow_add (a m n : ℕ) : a ^ (m + n) = a ^ m * a ^ n := by
  induction n with
  | zero => rw [add_zero, pow_zero, mul_one]
  | succ n ih => rw [add_succ, pow_succ, pow_succ, ih, mul_assoc]

/-- `mul_pow a b n` is a proof that `(a * b) ^ n = a ^ n * b ^ n`. -/
theorem mul_pow (a b n : ℕ) : (a * b) ^ n = a ^ n * b ^ n := by
  induction n with
  | zero => rw [pow_zero, pow_zero, pow_zero, mul_one]
  | succ n ih =>
    rw [pow_succ, pow_succ, pow_succ, ih]
    -- goal: a ^ n * b ^ n * (a * b) = a ^ n * a * (b ^ n * b)
    rw [mul_assoc, mul_assoc, ← mul_assoc (b ^ n) a b, mul_comm (b ^ n) a, mul_assoc a (b ^ n) b]

/-- `pow_pow a m n` is a proof that `(a ^ m) ^ n = a ^ (m * n)`. -/
theorem pow_pow (a m n : ℕ) : (a ^ m) ^ n = a ^ (m * n) := by
  induction n with
  | zero => rw [mul_zero, pow_zero, pow_zero]
  | succ n ih => rw [pow_succ, ih, ← pow_add, mul_succ]

/-- `add_sq a b` is the statement that `(a + b) ^ 2 = a ^ 2 + b ^ 2 + 2 * a * b`. -/
theorem add_sq (a b : ℕ) : (a + b) ^ 2 = a ^ 2 + b ^ 2 + 2 * a * b := by
  rw [pow_two, pow_two, pow_two, add_mul, mul_add, mul_add]
  rw [two_mul, add_mul, mul_comm b a]
  -- goal: a * a + a * b + (a * b + b * b) = a * a + b * b + (a * b + a * b)
  rw [add_assoc, add_assoc, ← add_assoc (a * b) (a * b) (b * b),
    add_comm (a * b + a * b) (b * b)]

end MyNat
