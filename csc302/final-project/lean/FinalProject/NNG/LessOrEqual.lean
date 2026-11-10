import FinalProject.NNG.AdvAddition

/-!
# Less than or equal (`≤` World)

This file defines `a ≤ b` to mean `∃ c, b = a + c`, exactly as in the game,
and proves the theorems of the game's `≤` World:
`le_refl`, `zero_le`, `le_succ_self`, `le_trans`, `le_zero`, `le_antisymm`,
`le_total`, `succ_le_succ`, `le_one`, `le_two`.

To prove a goal `a ≤ b`, use `use c` (then prove `b = a + c`).
To use a hypothesis `h : a ≤ b`, write `obtain ⟨c, hc⟩ := h` to get `hc : b = a + c`.
-/

namespace MyNat

/-- `le a b`, with notation `a ≤ b`, means `∃ c, b = a + c`:
"`b` is `a` plus something". There are no negative numbers, so this is a
correct definition of "less than or equal". -/
def le (a b : ℕ) : Prop := ∃ (c : ℕ), b = a + c

/-- The notation `a ≤ b` for `le a b`. -/
instance instLE : LE MyNat := ⟨MyNat.le⟩

/-- `le_iff_exists_add a b` says that `a ≤ b` is *by definition* `∃ c, b = a + c`.
You rarely need it: `use` and `obtain` see through the definition. -/
theorem le_iff_exists_add (a b : ℕ) : a ≤ b ↔ ∃ (c : ℕ), b = a + c := Iff.rfl

/-- `le_refl x` is a proof of `x ≤ x`. -/
theorem le_refl (x : ℕ) : x ≤ x := by
  use 0

/-- `zero_le x` is a proof that `0 ≤ x`. -/
theorem zero_le (x : ℕ) : 0 ≤ x := by
  use x
  rw [zero_add]

/-- `le_succ_self x` is a proof that `x ≤ succ x`. -/
theorem le_succ_self (x : ℕ) : x ≤ succ x := by
  use 1
  -- `use` closed the goal `succ x = x + 1` by `rfl`: both sides compute to the same number.

/-- `le_trans x y z` is a proof that if `x ≤ y` and `y ≤ z` then `x ≤ z`. -/
theorem le_trans (x y z : ℕ) (hxy : x ≤ y) (hyz : y ≤ z) : x ≤ z := by
  obtain ⟨a, ha⟩ := hxy
  obtain ⟨b, hb⟩ := hyz
  use a + b
  rw [hb, ha, add_assoc]

/-- `le_zero x` is a proof of `x ≤ 0 → x = 0`. -/
theorem le_zero (x : ℕ) (hx : x ≤ 0) : x = 0 := by
  obtain ⟨c, hc⟩ := hx
  exact add_right_eq_zero x c hc.symm

/-- `le_antisymm x y` is a proof that if `x ≤ y` and `y ≤ x` then `x = y`. -/
theorem le_antisymm (x y : ℕ) (hxy : x ≤ y) (hyx : y ≤ x) : x = y := by
  obtain ⟨c, hc⟩ := hxy
  obtain ⟨d, hd⟩ := hyx
  rw [hc, add_assoc] at hd
  have h : c + d = 0 := add_right_eq_self x (c + d) hd.symm
  have hc0 : c = 0 := add_right_eq_zero c d h
  rw [hc, hc0, add_zero]

/-- `le_total x y` is a proof that `x ≤ y` or `y ≤ x`. -/
theorem le_total (x y : ℕ) : x ≤ y ∨ y ≤ x := by
  induction y with
  | zero =>
    right
    exact zero_le x
  | succ d ih =>
    cases ih with
    | inl h =>
      left
      obtain ⟨e, he⟩ := h
      use e + 1
      rw [succ_eq_add_one, he, add_assoc]
    | inr h =>
      obtain ⟨e, he⟩ := h
      cases e with
      | zero =>
        left
        rw [he, add_zero]
        exact le_succ_self d
      | succ a =>
        right
        use a
        rw [he, add_succ, succ_add]

/-- `succ_le_succ x y` is a proof that if `succ x ≤ succ y` then `x ≤ y`. -/
theorem succ_le_succ (x y : ℕ) (hx : succ x ≤ succ y) : x ≤ y := by
  obtain ⟨d, hd⟩ := hx
  use d
  rw [succ_add] at hd
  exact succ_inj y (x + d) hd

/-- `le_one x` is a proof that if `x ≤ 1` then `x = 0` or `x = 1`. -/
theorem le_one (x : ℕ) (hx : x ≤ 1) : x = 0 ∨ x = 1 := by
  cases x with
  | zero =>
    left
    rfl
  | succ n =>
    rw [one_eq_succ_zero] at hx
    have h0 : n = 0 := le_zero n (succ_le_succ n 0 hx)
    right
    rw [h0, one_eq_succ_zero]

/-- `le_two x` is a proof that if `x ≤ 2` then `x = 0` or `x = 1` or `x = 2`. -/
theorem le_two (x : ℕ) (hx : x ≤ 2) : x = 0 ∨ x = 1 ∨ x = 2 := by
  cases x with
  | zero =>
    left
    rfl
  | succ n =>
    rw [two_eq_succ_one] at hx
    have h1 := le_one n (succ_le_succ n 1 hx)
    right
    cases h1 with
    | inl h0 =>
      left
      rw [h0, one_eq_succ_zero]
    | inr h1 =>
      right
      rw [h1, two_eq_succ_one]

end MyNat
