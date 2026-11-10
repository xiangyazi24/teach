import FinalProject.Modulo.Order

/-!
# Divisibility

This file defines `a ∣ b` ("`a` divides `b`", typed `\mid`) to mean `∃ c, b = a * c`,
in the same style as the game's `a ≤ b` (which means `∃ c, b = a + c`), and proves:

`dvd_refl`, `dvd_trans`, `dvd_zero`, `one_dvd`, `zero_dvd_iff`, `dvd_mul_right`,
`dvd_mul_left`, `dvd_mul_of_dvd_left`, `dvd_mul_of_dvd_right`, `dvd_add`,
`dvd_add_right`, `le_of_dvd`, `dvd_antisymm`, `dvd_one`, `eq_one_of_dvd_one`.

To prove `a ∣ b`, write `use c` and prove `b = a * c`.
To use `h : a ∣ b`, write `obtain ⟨c, hc⟩ := h` to get `hc : b = a * c`.
-/

namespace MyNat

/-- `a ∣ b` (typed `\mid`) means `∃ c, b = a * c`: `b` is a multiple of `a`.
Note that every number divides `0`, and `0` divides only `0`. -/
instance instDvd : Dvd MyNat := ⟨fun a b => ∃ c, b = a * c⟩

/-- `a ∣ b` is *by definition* `∃ c, b = a * c`. -/
theorem dvd_iff_exists_mul (a b : ℕ) : a ∣ b ↔ ∃ c, b = a * c := Iff.rfl

/-- Every number divides itself. -/
theorem dvd_refl (a : ℕ) : a ∣ a := by
  use 1
  rw [mul_one]

/-- If `a ∣ b` and `b ∣ c` then `a ∣ c`. -/
theorem dvd_trans {a b c : ℕ} (h1 : a ∣ b) (h2 : b ∣ c) : a ∣ c := by
  obtain ⟨d, hd⟩ := h1
  obtain ⟨e, he⟩ := h2
  use d * e
  rw [he, hd, mul_assoc]

/-- Every number divides `0`. -/
theorem dvd_zero (a : ℕ) : a ∣ 0 := by
  use 0

/-- `1` divides every number. -/
theorem one_dvd (a : ℕ) : 1 ∣ a := by
  use a
  rw [one_mul]

/-- `0` divides `a` exactly when `a = 0`. -/
theorem zero_dvd_iff {a : ℕ} : 0 ∣ a ↔ a = 0 := by
  constructor
  · intro h
    obtain ⟨c, hc⟩ := h
    rw [hc, zero_mul]
  · intro h
    rw [h]
    exact dvd_zero 0

/-- `a ∣ a * b`. -/
theorem dvd_mul_right (a b : ℕ) : a ∣ a * b := by
  use b

/-- `a ∣ b * a`. -/
theorem dvd_mul_left (a b : ℕ) : a ∣ b * a := by
  use b
  rw [mul_comm]

/-- If `a ∣ b` then `a ∣ b * c`. -/
theorem dvd_mul_of_dvd_left {a b : ℕ} (h : a ∣ b) (c : ℕ) : a ∣ b * c := by
  obtain ⟨d, hd⟩ := h
  use d * c
  rw [hd, mul_assoc]

/-- If `a ∣ b` then `a ∣ c * b`. -/
theorem dvd_mul_of_dvd_right {a b : ℕ} (h : a ∣ b) (c : ℕ) : a ∣ c * b := by
  rw [mul_comm]
  exact dvd_mul_of_dvd_left h c

/-- If `a ∣ b` and `a ∣ c` then `a ∣ b + c`. -/
theorem dvd_add {a b c : ℕ} (h1 : a ∣ b) (h2 : a ∣ c) : a ∣ b + c := by
  obtain ⟨d, hd⟩ := h1
  obtain ⟨e, he⟩ := h2
  use d + e
  rw [hd, he, mul_add]

/-- If `a ∣ b`, then `a ∣ b + c` exactly when `a ∣ c`.
(This replaces the usual "`a ∣ b` and `a ∣ b + c` imply `a ∣ (b + c) - b`".) -/
theorem dvd_add_right {a b c : ℕ} (h : a ∣ b) : a ∣ b + c ↔ a ∣ c := by
  constructor
  · intro h2
    obtain ⟨x, hx⟩ := h
    obtain ⟨y, hy⟩ := h2
    by_cases ha : a = 0
    · -- `a = 0`: then `b = 0`, so `c = b + c = 0`.
      rw [ha, zero_mul] at hx hy
      rw [hx, zero_add] at hy
      rw [ha, hy]
      exact dvd_zero 0
    · -- `a ≠ 0`: from `a * x ≤ a * y` we get `x ≤ y`, i.e. `y = x + k`; then `c = a * k`.
      have hle : a * x ≤ a * y := by
        rw [← hx, ← hy]
        exact le_add_right b c
      obtain ⟨k, hk⟩ := le_of_mul_le_mul_left hle ha
      use k
      rw [hk, mul_add, ← hx] at hy
      exact add_left_cancel c (a * k) b hy
  · intro h2
    exact dvd_add h h2

/-- A divisor of a positive number is at most that number: `0 < b → a ∣ b → a ≤ b`. -/
theorem le_of_dvd {a b : ℕ} (hb : 0 < b) (h : a ∣ b) : a ≤ b := by
  obtain ⟨c, hc⟩ := h
  have hne : a * c ≠ 0 := by
    rw [← hc]
    exact pos_iff_ne_zero.mp hb
  rw [hc]
  exact le_mul_right a c hne

/-- If `a ∣ b` and `b ∣ a` then `a = b`. -/
theorem dvd_antisymm {a b : ℕ} (h1 : a ∣ b) (h2 : b ∣ a) : a = b := by
  by_cases ha : a = 0
  · rw [ha] at h1 ⊢
    exact (zero_dvd_iff.mp h1).symm
  · by_cases hb : b = 0
    · rw [hb] at h2 ⊢
      exact zero_dvd_iff.mp h2
    · exact le_antisymm a b (le_of_dvd (pos_iff_ne_zero.mpr hb) h1)
        (le_of_dvd (pos_iff_ne_zero.mpr ha) h2)

/-- If `a ∣ 1` then `a = 1`. -/
theorem eq_one_of_dvd_one {a : ℕ} (h : a ∣ 1) : a = 1 := by
  obtain ⟨c, hc⟩ := h
  exact mul_right_eq_one a c hc.symm

/-- `a ∣ 1` exactly when `a = 1`. -/
theorem dvd_one {a : ℕ} : a ∣ 1 ↔ a = 1 := by
  constructor
  · exact eq_one_of_dvd_one
  · intro h
    rw [h]
    exact dvd_refl 1

end MyNat
