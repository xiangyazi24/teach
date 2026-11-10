import FinalProject.Modulo.Divisibility

/-!
# Division with remainder

This file defines the remainder `a % n` and the quotient `a / n` on `ℕ`, and proves
the division algorithm and the rules of remainder arithmetic:

* `div_add_mod : n * (a / n) + a % n = a` (dividing `a` by `n`);
* `mod_lt : n ≠ 0 → a % n < n` (the remainder is smaller than the divisor);
* `div_mod_unique`: quotient and remainder are the *only* such pair;
* `mod_eq_of_lt`, `mod_self`, `mod_mod`, `add_mul_mod_self`, `add_mod`, `mul_mod`;
* `dvd_iff_mod_eq_zero : n ∣ a ↔ a % n = 0`, and a `Decidable (a ∣ b)` instance,
  so `decide` proves goals like `(5 : ℕ) ∣ 15`.

**Convention for `n = 0`:** `a % 0 = a` and `a / 0 = 0` (`mod_zero`, `div_zero`).
Then `div_add_mod` holds for every `n`, including `0`.

Try it:
```
#eval (17 : ℕ) % 5    -- 2
#eval (17 : ℕ) / 5    -- 3
#eval (17 : ℕ) % 0    -- 17
#eval (17 : ℕ) / 0    -- 0
```
(These are checked at the end of this file.)
-/

namespace MyNat

/-- The remainder of `a` on division by `n`, written `a % n`.
It is computed by counting up: `0 % n = 0`, and `succ a % n` is `succ (a % n)`,
except that it wraps around to `0` when it would reach `n`.
For `n = 0` it never wraps, so `a % 0 = a`. -/
def mod : ℕ → ℕ → ℕ
  | .zero, _ => 0
  | .succ a, n => if succ (mod a n) = n then 0 else succ (mod a n)

/-- The quotient of `a` on division by `n`, written `a / n`.
It is computed together with the remainder: `0 / n = 0`, and `succ a / n` is
one more than `a / n` exactly when the remainder wraps around to `0`.
For `n = 0`, `a / 0 = 0`. -/
def div : ℕ → ℕ → ℕ
  | .zero, _ => 0
  | .succ a, n => if succ (mod a n) = n then succ (div a n) else div a n

/-- The notation `a % n` for `mod a n`. -/
instance instMod : Mod MyNat := ⟨MyNat.mod⟩

/-- The notation `a / n` for `div a n`. -/
instance instDiv : Div MyNat := ⟨MyNat.div⟩

/-! ## The defining equations -/

/-- `0 % n = 0`. -/
theorem zero_mod (n : ℕ) : 0 % n = 0 := rfl

/-- `0 / n = 0`. -/
theorem zero_div (n : ℕ) : 0 / n = 0 := rfl

/-- `succ a % n = if succ (a % n) = n then 0 else succ (a % n)`. -/
theorem mod_succ (a n : ℕ) :
    succ a % n = if succ (a % n) = n then 0 else succ (a % n) := rfl

/-- `succ a / n = if succ (a % n) = n then succ (a / n) else a / n`. -/
theorem div_succ (a n : ℕ) :
    succ a / n = if succ (a % n) = n then succ (a / n) else a / n := rfl

/-- Convention: `a % 0 = a`. -/
theorem mod_zero (a : ℕ) : a % 0 = a := by
  induction a with
  | zero => rfl
  | succ a ih => rw [mod_succ, ih, ite_eq_right (succ_ne_zero a)]

/-- Convention: `a / 0 = 0`. -/
theorem div_zero (a : ℕ) : a / 0 = 0 := by
  induction a with
  | zero => rfl
  | succ a ih => rw [div_succ, mod_zero, ih, ite_eq_right (succ_ne_zero a)]

/-! ## The division algorithm -/

/-- **Division with remainder:** `n * (a / n) + a % n = a`. -/
theorem div_add_mod (a n : ℕ) : n * (a / n) + a % n = a := by
  induction a with
  | zero => rw [zero_div, zero_mod, mul_zero, add_zero]
  | succ a ih =>
    rw [div_succ, mod_succ]
    by_cases h : succ (a % n) = n
    · rw [ite_eq_left h, ite_eq_left h, mul_succ, add_zero]
      calc n * (a / n) + n = n * (a / n) + succ (a % n) := by rw [h]
        _ = succ a := by rw [add_succ, ih]
    · rw [ite_eq_right h, ite_eq_right h, add_succ, ih]

/-- **The remainder is smaller than the divisor:** if `n ≠ 0` then `a % n < n`. -/
theorem mod_lt (a : ℕ) {n : ℕ} (hn : n ≠ 0) : a % n < n := by
  induction a with
  | zero => exact pos_iff_ne_zero.mpr hn
  | succ a ih =>
    rw [mod_succ]
    by_cases h : succ (a % n) = n
    · rw [ite_eq_left h]
      exact pos_iff_ne_zero.mpr hn
    · rw [ite_eq_right h]
      exact lt_of_le_of_ne ih h

/-- Quotient and remainder are unique: if `n * q + r = n * q' + r'`
with `r < n` and `r' < n`, then `q = q'` and `r = r'`. -/
theorem quot_rem_unique {n q r q' r' : ℕ} (h : n * q + r = n * q' + r')
    (hr : r < n) (hr' : r' < n) : q = q' ∧ r = r' := by
  -- First: `q < q'` is impossible (and symmetrically `q' < q`).
  have key : ∀ q q' r r' : ℕ, n * q + r = n * q' + r' → r < n → q < q' → False := by
    intro q q' r r' h hr hq
    obtain ⟨k, hk⟩ := hq
    have h2 : n * q + r = n * q + (n + (n * k + r')) := by
      rw [h, hk, mul_add, mul_add, mul_one, add_assoc, add_assoc]
    have h3 : r = n + (n * k + r') := add_left_cancel r _ (n * q) h2
    have h4 : n ≤ r := by
      use n * k + r'
      exact h3
    exact lt_irrefl r (lt_of_lt_of_le hr h4)
  have hq : q = q' := by
    cases lt_or_ge q q' with
    | inl hlt => exact (key q q' r r' h hr hlt).elim
    | inr hge =>
      cases le_iff_lt_or_eq.mp hge with
      | inl hlt => exact (key q' q r' r h.symm hr' hlt).elim
      | inr heq => exact heq.symm
  constructor
  · exact hq
  · rw [hq] at h
    exact add_left_cancel r r' (n * q') h

/-- **Uniqueness of quotient and remainder:** if `a = n * q + r` with `r < n`,
then `q` is the quotient `a / n` and `r` is the remainder `a % n`. -/
theorem div_mod_unique {a n q r : ℕ} (h : a = n * q + r) (hr : r < n) :
    q = a / n ∧ r = a % n := by
  have hn : n ≠ 0 := by
    intro hn
    rw [hn] at hr
    exact not_lt_zero r hr
  rw [h] at *
  apply quot_rem_unique _ hr (mod_lt _ hn)
  rw [div_add_mod]

/-! ## Rules for remainders -/

/-- If `a < n` then `a % n = a`. -/
theorem mod_eq_of_lt {a n : ℕ} (h : a < n) : a % n = a := by
  have hu := div_mod_unique (q := 0) (r := a) (show a = n * 0 + a by rw [mul_zero, zero_add]) h
  exact hu.2.symm

/-- `n % n = 0`. -/
theorem mod_self (n : ℕ) : n % n = 0 := by
  by_cases hn : n = 0
  · rw [hn]
    rfl
  · have hu := div_mod_unique (q := 1) (r := 0) (show n = n * 1 + 0 by rw [mul_one, add_zero])
      (pos_iff_ne_zero.mpr hn)
    exact hu.2.symm

/-- Adding a multiple of `n` does not change the remainder: `(a + n * k) % n = a % n`. -/
theorem add_mul_mod_self (a n k : ℕ) : (a + n * k) % n = a % n := by
  by_cases hn : n = 0
  · rw [hn, zero_mul, add_zero]
  · have hd := div_add_mod a n
    have h : a + n * k = n * (a / n + k) + a % n := by
      rw [mul_add, add_right_comm, hd]
    exact (div_mod_unique h (mod_lt a hn)).2.symm

/-- Taking the remainder twice is the same as once: `a % n % n = a % n`. -/
theorem mod_mod (a n : ℕ) : a % n % n = a % n := by
  by_cases hn : n = 0
  · rw [hn, mod_zero, mod_zero]
  · exact mod_eq_of_lt (mod_lt a hn)

/-- `(a % n + b) % n = (a + b) % n`. -/
theorem mod_add_mod (a b n : ℕ) : (a % n + b) % n = (a + b) % n := by
  have hd := div_add_mod a n
  have h : a + b = a % n + b + n * (a / n) := by
    rw [add_right_comm, add_comm (a % n) (n * (a / n)), hd]
  rw [h, add_mul_mod_self]

/-- The remainder of a sum: `(a + b) % n = (a % n + b % n) % n`. -/
theorem add_mod (a b n : ℕ) : (a + b) % n = (a % n + b % n) % n := by
  rw [mod_add_mod, add_comm a (b % n), mod_add_mod, add_comm b a]

/-- `(a % n * b) % n = (a * b) % n`. -/
theorem mod_mul_mod (a b n : ℕ) : (a % n * b) % n = (a * b) % n := by
  have hd := div_add_mod a n
  have h : a * b = a % n * b + n * (a / n * b) := by
    rw [← mul_assoc, ← add_mul, add_comm, hd]
  rw [h, add_mul_mod_self]

/-- The remainder of a product: `(a * b) % n = ((a % n) * (b % n)) % n`. -/
theorem mul_mod (a b n : ℕ) : (a * b) % n = ((a % n) * (b % n)) % n := by
  rw [mod_mul_mod, mul_comm a (b % n), mod_mul_mod, mul_comm b a]

/-! ## Divisibility and remainders -/

/-- `n ∣ a` exactly when the remainder of `a` on division by `n` is `0`. -/
theorem dvd_iff_mod_eq_zero {n a : ℕ} : n ∣ a ↔ a % n = 0 := by
  constructor
  · intro h
    obtain ⟨c, hc⟩ := h
    have h2 := add_mul_mod_self 0 n c
    rw [zero_add] at h2
    rw [hc, h2, zero_mod]
  · intro h
    use a / n
    have h2 := div_add_mod a n
    rw [h, add_zero] at h2
    exact h2.symm

/-- Everything leaves remainder `0` on division by `1`. -/
theorem mod_one (a : ℕ) : a % 1 = 0 :=
  dvd_iff_mod_eq_zero.1 (one_dvd a)

/-- A common divisor of `a` and `b` divides the remainder `b % a`.
(Write `b = a * q + r` with `r = b % a`.) -/
theorem dvd_mod {a b d : ℕ} (ha : d ∣ a) (hb : d ∣ b) : d ∣ b % a := by
  have h := div_add_mod b a
  rw [← h] at hb
  exact (dvd_add_right (dvd_mul_of_dvd_left ha _)).1 hb

/-- Reducing modulo a multiple `N` of `n` first does not change the remainder modulo `n`:
if `n ∣ N` then `x % N % n = x % n`. -/
theorem mod_mod_of_dvd {n N : ℕ} (h : n ∣ N) (x : ℕ) : x % N % n = x % n := by
  have h3 : x % n = (N * (x / N) + x % N) % n := by rw [div_add_mod]
  obtain ⟨c, hc⟩ := h
  have key : N * (x / N) = n * (c * (x / N)) := by rw [← mul_assoc, ← hc]
  rw [h3, key, add_comm, add_mul_mod_self]

/-- Divisibility is decidable: to decide `a ∣ b`, Lean computes `b % a` and compares with `0`.
This lets `decide` prove goals like `(5 : ℕ) ∣ 15` or `¬ (4 : ℕ) ∣ 10`. -/
instance instDecidableDvd (a b : ℕ) : Decidable (a ∣ b) :=
  decidable_of_iff (b % a = 0) dvd_iff_mod_eq_zero.symm

/-! ## Examples -/

example : (17 : ℕ) % 5 = 2 := by decide
example : (17 : ℕ) / 5 = 3 := by decide
example : (17 : ℕ) % 0 = 17 := by decide
example : (5 : ℕ) ∣ 15 := by decide
example : ¬ (4 : ℕ) ∣ 10 := by decide

/-- info: 2 -/
#guard_msgs in
#eval (17 : ℕ) % 5

/-- info: 3 -/
#guard_msgs in
#eval (17 : ℕ) / 5

/-- info: 17 -/
#guard_msgs in
#eval (17 : ℕ) % 0

/-- info: 0 -/
#guard_msgs in
#eval (17 : ℕ) / 0

end MyNat
