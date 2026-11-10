import FinalProject.Modulo.DivMod

/-!
# Congruence modulo `n`

This file defines `a ≡ b [MOD n]` ("`a` is congruent to `b` modulo `n`") to mean that
`a` and `b` have the same remainder on division by `n`, and proves:

* it is an equivalence relation: `ModEq.refl`, `ModEq.symm`, `ModEq.trans`;
* it respects arithmetic: `ModEq.add`, `ModEq.mul`, `ModEq.pow`, and
  `ModEq.add_right_cancel` (cancel an added number from both sides);
* subtraction-free characterizations: `modEq_iff_exists`
  (`a ≤ b → (a ≡ b [MOD n] ↔ ∃ k, b = a + n * k)`), `modEq_add_iff_dvd`
  (`a ≡ a + c [MOD n] ↔ n ∣ c`), `modEq_zero_iff_dvd` (`a ≡ 0 [MOD n] ↔ n ∣ a`);
* `mod_modEq : a % n ≡ a [MOD n]`;
* decidability, so `decide` proves goals like `(17 : ℕ) ≡ 2 [MOD 5]`.

Since `a ≡ b [MOD n]` is *defined* as `a % n = b % n`, you can always switch to the
remainder form with `unfold ModEq` (or `show a % n = b % n`).
-/

namespace MyNat

/-- `ModEq n a b`, written `a ≡ b [MOD n]`, means `a % n = b % n`:
`a` and `b` leave the same remainder on division by `n`.
(For `n = 0` this just means `a = b`.) -/
def ModEq (n a b : ℕ) : Prop := a % n = b % n

@[inherit_doc]
notation:50 a " ≡ " b " [MOD " n "]" => MyNat.ModEq n a b

/-- Congruence is decidable (compare the two remainders). -/
instance instDecidableModEq (n a b : ℕ) : Decidable (a ≡ b [MOD n]) :=
  inferInstanceAs (Decidable (a % n = b % n))

example : (17 : ℕ) ≡ 2 [MOD 5] := by decide
example : ¬ (17 : ℕ) ≡ 3 [MOD 5] := by decide

namespace ModEq

/-- `a ≡ a [MOD n]`. -/
protected theorem refl (a : ℕ) {n : ℕ} : a ≡ a [MOD n] := rfl

/-- If `a ≡ b [MOD n]` then `b ≡ a [MOD n]`. -/
protected theorem symm {n a b : ℕ} (h : a ≡ b [MOD n]) : b ≡ a [MOD n] := Eq.symm h

/-- If `a ≡ b [MOD n]` and `b ≡ c [MOD n]` then `a ≡ c [MOD n]`. -/
protected theorem trans {n a b c : ℕ} (h1 : a ≡ b [MOD n]) (h2 : b ≡ c [MOD n]) :
    a ≡ c [MOD n] := by
  unfold ModEq at *
  rw [h1, h2]

/-- Congruences can be added: `a ≡ b`, `c ≡ d` give `a + c ≡ b + d [MOD n]`. -/
protected theorem add {n a b c d : ℕ} (h1 : a ≡ b [MOD n]) (h2 : c ≡ d [MOD n]) :
    a + c ≡ b + d [MOD n] := by
  unfold ModEq at *
  rw [add_mod, h1, h2, ← add_mod]

/-- Congruences can be multiplied: `a ≡ b`, `c ≡ d` give `a * c ≡ b * d [MOD n]`. -/
protected theorem mul {n a b c d : ℕ} (h1 : a ≡ b [MOD n]) (h2 : c ≡ d [MOD n]) :
    a * c ≡ b * d [MOD n] := by
  unfold ModEq at *
  rw [mul_mod, h1, h2, ← mul_mod]

/-- Congruences can be raised to a power: `a ≡ b [MOD n]` gives `a ^ k ≡ b ^ k [MOD n]`. -/
protected theorem pow {n a b : ℕ} (k : ℕ) (h : a ≡ b [MOD n]) : a ^ k ≡ b ^ k [MOD n] := by
  induction k with
  | zero =>
    rw [pow_zero, pow_zero]
    exact ModEq.refl 1
  | succ k ih =>
    rw [pow_succ, pow_succ]
    exact ModEq.mul ih h

end ModEq

/-- **Subtraction-free form of "`n` divides `b - a`".**
If `a ≤ b`, then `a ≡ b [MOD n]` exactly when `b = a + n * k` for some `k`. -/
theorem modEq_iff_exists {n a b : ℕ} (hab : a ≤ b) : a ≡ b [MOD n] ↔ ∃ k, b = a + n * k := by
  constructor
  · intro h
    unfold ModEq at h
    by_cases hn : n = 0
    · rw [hn, mod_zero, mod_zero] at h
      use 0
      rw [h, mul_zero, add_zero]
    · have ha := div_add_mod a n
      have hb := div_add_mod b n
      -- From `a ≤ b` and equal remainders, the quotients satisfy `a / n ≤ b / n`.
      have h1 : n * (a / n) + a % n ≤ n * (b / n) + a % n := by
        rw [ha, h, hb]
        exact hab
      obtain ⟨k, hk⟩ := le_of_mul_le_mul_left (le_of_add_le_add_right h1) hn
      use k
      rw [← hb, hk, ← h, mul_add, add_right_comm, ha]
  · intro h
    obtain ⟨k, hk⟩ := h
    unfold ModEq
    rw [hk, add_mul_mod_self]

/-- `a ≡ a + c [MOD n]` exactly when `n ∣ c`. -/
theorem modEq_add_iff_dvd {n a c : ℕ} : a ≡ a + c [MOD n] ↔ n ∣ c := by
  rw [modEq_iff_exists (le_add_right a c)]
  constructor
  · intro h
    obtain ⟨k, hk⟩ := h
    use k
    exact add_left_cancel c (n * k) a hk
  · intro h
    obtain ⟨k, hk⟩ := h
    use k
    rw [hk]

/-- An added number can be cancelled: `a + c ≡ b + c [MOD n]` gives `a ≡ b [MOD n]`. -/
protected theorem ModEq.add_right_cancel {n a b c : ℕ} (h : a + c ≡ b + c [MOD n]) :
    a ≡ b [MOD n] := by
  -- The case `a ≤ b`; the other case follows by symmetry.
  have key : ∀ x y : ℕ, x ≤ y → x + c ≡ y + c [MOD n] → x ≡ y [MOD n] := by
    intro x y hxy hc
    obtain ⟨k, hk⟩ := (modEq_iff_exists (add_le_add_right hxy c)).mp hc
    rw [add_right_comm] at hk
    apply (modEq_iff_exists hxy).mpr
    use k
    exact add_right_cancel y (x + n * k) c hk
  cases le_total a b with
  | inl hab => exact key a b hab h
  | inr hba => exact (key b a hba h.symm).symm

/-- `a ≡ 0 [MOD n]` exactly when `n ∣ a`. -/
theorem modEq_zero_iff_dvd {n a : ℕ} : a ≡ 0 [MOD n] ↔ n ∣ a := by
  unfold ModEq
  rw [zero_mod]
  exact dvd_iff_mod_eq_zero.symm

/-- A number is congruent to its remainder: `a % n ≡ a [MOD n]`. -/
theorem mod_modEq (a n : ℕ) : a % n ≡ a [MOD n] :=
  mod_mod a n

/-- Example: `10 ≡ 1 [MOD 9]`, hence `10 ^ k ≡ 1 [MOD 9]` for every `k`. -/
example (k : ℕ) : 10 ^ k ≡ 1 [MOD 9] := by
  have h : (10 : ℕ) ≡ 1 [MOD 9] := by decide
  have h2 := ModEq.pow k h
  rw [one_pow] at h2
  exact h2

end MyNat
