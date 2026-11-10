import FinalProject

/-!
# Checks (not part of the library)

Compiled by `scripts/check.sh` after the library. It prints the axioms used by the main
theorems (they must not include any custom axiom, nor `sorryAx`) and tests that the
`induction` tactic displays goals with `0` and `succ n`, as in the game.
-/

open MyNat

#print axioms MyNat.add_comm
#print axioms MyNat.mul_comm
#print axioms MyNat.pow_add
#print axioms MyNat.mul_left_cancel
#print axioms MyNat.strong_induction
#print axioms MyNat.div_add_mod
#print axioms MyNat.mod_lt
#print axioms MyNat.dvd_mod
#print axioms MyNat.mod_mod_of_dvd
#print axioms MyNat.ModEq.mul
#print axioms MyNat.ModEq.pow

/--
trace: case zero
⊢ 0 + 0 = 0
---
trace: case succ
n : ℕ
ih : 0 + n = n
⊢ 0 + succ n = succ n
-/
#guard_msgs in
example (n : ℕ) : 0 + n = n := by
  induction n with
  | zero =>
    trace_state
    rw [add_zero]
  | succ n ih =>
    trace_state
    rw [add_succ, ih]

/--
trace: case zero
⊢ 0 = 0
---
trace: case succ
m : ℕ
⊢ succ m = succ m
-/
#guard_msgs in
example (n : ℕ) : n = n := by
  cases n with
  | zero =>
    trace_state
    rfl
  | succ m =>
    trace_state
    rfl
