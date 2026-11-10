import FinalProject.NNG
import FinalProject.Tactic.Ring

/-!
# Strict order `<`, decidability, and strong induction

This file provides:
* `a < b`, defined as `a + 1 ≤ b` (so `a < b` and `succ a ≤ b` are the same statement:
  `lt_iff_succ_le`), and its basic API: `lt_irrefl`, `lt_trans`, `lt_succ_iff`,
  `lt_or_ge`, `le_or_lt`, `not_lt`, `not_le`, `le_iff_lt_or_eq`, ...;
* monotonicity of `+` and `*` (`add_le_add_left`, `mul_lt_mul_left`, ...)
  and cancellation (`le_of_add_le_add_right`, `le_of_mul_le_mul_left`);
* `Decidable` instances for `a ≤ b` and `a < b`, so `decide` proves goals like
  `(3 : ℕ) < 5`, and you can write `if a < b then ... else ...`;
  also for bounded statements `∀ m, m < n → P m`;
* **strong induction** (`strong_induction`, `strong_induction_on`);
* a `WellFoundedRelation` on `ℕ` given by `<`, so that recursive definitions
  can be justified with `termination_by` / `decreasing_by` (see `lt_wf`).
-/

namespace MyNat

/-! ## The definition of `<` -/

/-- `lt a b`, with notation `a < b`, means `a + 1 ≤ b`. -/
def lt (a b : ℕ) : Prop := a + 1 ≤ b

/-- The notation `a < b` for `lt a b`. -/
instance instLT : LT MyNat := ⟨MyNat.lt⟩

/-- `a < b` is *by definition* `succ a ≤ b` (both mean `∃ c, b = succ a + c`).
So to prove `a < b` you may `use c` and prove `b = a + 1 + c`. -/
theorem lt_iff_succ_le (a b : ℕ) : a < b ↔ succ a ≤ b := Iff.rfl

/-! ## Facts about `≤` that the game did not need -/

/-- If `a ≤ b` then `succ a ≤ succ b` (the converse of the game's `succ_le_succ`). -/
theorem succ_le_succ_of_le {a b : ℕ} (h : a ≤ b) : succ a ≤ succ b := by
  obtain ⟨c, hc⟩ := h
  use c
  rw [hc, succ_add]

/-- `succ a ≤ 0` is impossible. -/
theorem not_succ_le_zero (a : ℕ) : ¬ succ a ≤ 0 := by
  intro h
  exact succ_ne_zero a (le_zero (succ a) h)

/-- `a ≤ a + b`. -/
theorem le_add_right (a b : ℕ) : a ≤ a + b := by
  use b

/-- `a ≤ b + a`. -/
theorem le_add_left (a b : ℕ) : a ≤ b + a := by
  use b
  rw [add_comm]

/-! ## Basic facts about `<` -/

/-- `a < b` implies `a ≤ b`. -/
theorem le_of_lt {a b : ℕ} (h : a < b) : a ≤ b :=
  le_trans a (succ a) b (le_succ_self a) h

/-- No number is less than itself. -/
theorem lt_irrefl (a : ℕ) : ¬ a < a := by
  intro h
  obtain ⟨c, hc⟩ := h
  rw [add_assoc] at hc
  have h1 : 1 + c = 0 := add_right_eq_self a (1 + c) hc.symm
  exact one_ne_zero (add_right_eq_zero 1 c h1)

/-- No number is less than `0`. -/
theorem not_lt_zero (a : ℕ) : ¬ a < 0 :=
  not_succ_le_zero a

/-- `a < succ a`. -/
theorem lt_succ_self (a : ℕ) : a < succ a :=
  le_refl (succ a)

/-- `a < succ b` exactly when `a ≤ b`. -/
theorem lt_succ_iff {a b : ℕ} : a < succ b ↔ a ≤ b :=
  ⟨succ_le_succ a b, succ_le_succ_of_le⟩

/-- `a < b`, `b ≤ c` give `a < c`. -/
theorem lt_of_lt_of_le {a b c : ℕ} (h1 : a < b) (h2 : b ≤ c) : a < c :=
  le_trans (succ a) b c h1 h2

/-- `a ≤ b`, `b < c` give `a < c`. -/
theorem lt_of_le_of_lt {a b c : ℕ} (h1 : a ≤ b) (h2 : b < c) : a < c :=
  le_trans (succ a) (succ b) c (succ_le_succ_of_le h1) h2

/-- `<` is transitive. -/
theorem lt_trans {a b c : ℕ} (h1 : a < b) (h2 : b < c) : a < c :=
  lt_of_le_of_lt (le_of_lt h1) h2

/-- `a ≤ b` means `a < b` or `a = b`. -/
theorem le_iff_lt_or_eq {a b : ℕ} : a ≤ b ↔ a < b ∨ a = b := by
  constructor
  · intro h
    obtain ⟨c, hc⟩ := h
    cases c with
    | zero =>
      right
      rw [hc, add_zero]
    | succ c =>
      left
      use c
      rw [hc, add_succ, ← succ_eq_add_one, succ_add]
  · intro h
    cases h with
    | inl hlt => exact le_of_lt hlt
    | inr heq =>
      rw [heq]
      exact le_refl b

/-- `m < succ n` means `m < n` or `m = n`. -/
theorem lt_succ_iff_lt_or_eq {m n : ℕ} : m < succ n ↔ m < n ∨ m = n := by
  constructor
  · intro h
    exact le_iff_lt_or_eq.mp (lt_succ_iff.mp h)
  · intro h
    exact lt_succ_iff.mpr (le_iff_lt_or_eq.mpr h)

/-- If `a ≤ b` and `a ≠ b` then `a < b`. -/
theorem lt_of_le_of_ne {a b : ℕ} (h1 : a ≤ b) (h2 : a ≠ b) : a < b := by
  cases le_iff_lt_or_eq.mp h1 with
  | inl h => exact h
  | inr h =>
    exfalso
    exact h2 h

/-- `0 < a` exactly when `a ≠ 0`. -/
theorem pos_iff_ne_zero {a : ℕ} : 0 < a ↔ a ≠ 0 := by
  constructor
  · intro h ha
    rw [ha] at h
    exact lt_irrefl 0 h
  · intro h
    exact one_le_of_ne_zero a h

/-- Trichotomy, form 1: `a < b` or `b ≤ a`. -/
theorem lt_or_ge (a b : ℕ) : a < b ∨ b ≤ a := by
  cases le_total a b with
  | inl h =>
    cases le_iff_lt_or_eq.mp h with
    | inl hlt => exact Or.inl hlt
    | inr heq =>
      right
      rw [heq]
      exact le_refl b
  | inr h => exact Or.inr h

/-- Trichotomy, form 2: `a ≤ b` or `b < a`. -/
theorem le_or_lt (a b : ℕ) : a ≤ b ∨ b < a := by
  cases lt_or_ge b a with
  | inl h => exact Or.inr h
  | inr h => exact Or.inl h

/-- `¬ (a < b)` is the same as `b ≤ a`. -/
theorem not_lt {a b : ℕ} : ¬ a < b ↔ b ≤ a := by
  constructor
  · intro h
    cases lt_or_ge a b with
    | inl hlt =>
      exfalso
      exact h hlt
    | inr hge => exact hge
  · intro h hlt
    exact lt_irrefl b (lt_of_le_of_lt h hlt)

/-- `¬ (a ≤ b)` is the same as `b < a`. -/
theorem not_le {a b : ℕ} : ¬ a ≤ b ↔ b < a := by
  constructor
  · intro h
    cases le_or_lt a b with
    | inl hle =>
      exfalso
      exact h hle
    | inr hlt => exact hlt
  · intro h hle
    exact lt_irrefl a (lt_of_le_of_lt hle h)

/-- `pred n < n` when `n ≠ 0`. -/
theorem pred_lt {n : ℕ} (h : n ≠ 0) : pred n < n := by
  obtain ⟨k, hk⟩ := eq_succ_of_ne_zero n h
  rw [hk, pred_succ]
  exact lt_succ_self k

/-! ## Monotonicity and cancellation -/

/-- Adding on the right preserves `≤`. -/
theorem add_le_add_right {a b : ℕ} (h : a ≤ b) (c : ℕ) : a + c ≤ b + c := by
  obtain ⟨d, hd⟩ := h
  use d
  rw [hd, add_right_comm]

/-- Adding on the left preserves `≤`. -/
theorem add_le_add_left {a b : ℕ} (h : a ≤ b) (c : ℕ) : c + a ≤ c + b := by
  obtain ⟨d, hd⟩ := h
  use d
  rw [hd, add_assoc]

/-- Adding on the right preserves `<`. -/
theorem add_lt_add_right {a b : ℕ} (h : a < b) (c : ℕ) : a + c < b + c := by
  have h1 : a + 1 + c ≤ b + c := add_le_add_right h c
  rw [add_right_comm] at h1
  exact h1

/-- Adding on the left preserves `<`. -/
theorem add_lt_add_left {a b : ℕ} (h : a < b) (c : ℕ) : c + a < c + b := by
  rw [add_comm c a, add_comm c b]
  exact add_lt_add_right h c

/-- `≤` can be cancelled from `a + c ≤ b + c`. -/
theorem le_of_add_le_add_right {a b c : ℕ} (h : a + c ≤ b + c) : a ≤ b := by
  obtain ⟨d, hd⟩ := h
  use d
  rw [add_right_comm] at hd
  exact add_right_cancel b (a + d) c hd

/-- `≤` can be cancelled from `c + a ≤ c + b`. -/
theorem le_of_add_le_add_left {a b c : ℕ} (h : c + a ≤ c + b) : a ≤ b := by
  rw [add_comm c a, add_comm c b] at h
  exact le_of_add_le_add_right h

/-- Multiplying on the left preserves `≤`. -/
theorem mul_le_mul_left {a b : ℕ} (h : a ≤ b) (c : ℕ) : c * a ≤ c * b := by
  obtain ⟨d, hd⟩ := h
  use c * d
  rw [hd, mul_add]

/-- Multiplying on the left by a nonzero number preserves `<`. -/
theorem mul_lt_mul_left {a b c : ℕ} (hc : c ≠ 0) (h : a < b) : c * a < c * b := by
  have h1 : c * (a + 1) ≤ c * b := mul_le_mul_left h c
  rw [mul_add, mul_one] at h1
  have h2 : c * a + 1 ≤ c * a + c := add_le_add_left (one_le_of_ne_zero c hc) (c * a)
  exact le_trans (c * a + 1) (c * a + c) (c * b) h2 h1

/-- A nonzero factor can be cancelled from `c * a ≤ c * b`. -/
theorem le_of_mul_le_mul_left {a b c : ℕ} (h : c * a ≤ c * b) (hc : c ≠ 0) : a ≤ b := by
  cases le_or_lt a b with
  | inl hle => exact hle
  | inr hlt =>
    exfalso
    exact lt_irrefl (c * a) (lt_of_le_of_lt h (mul_lt_mul_left hc hlt))

/-- A number that is neither `0` nor `1` is at least `2`. -/
theorem two_le_of_ne_zero_of_ne_one {d : ℕ} (h0 : d ≠ 0) (h1 : d ≠ 1) : 2 ≤ d :=
  lt_of_le_of_ne (one_le_of_ne_zero d h0) (Ne.symm h1)

/-- Multiplying by a nonzero number does not make a number smaller: `a ≤ d * a`. -/
theorem le_mul_of_ne_zero (a : ℕ) {d : ℕ} (hd : d ≠ 0) : a ≤ d * a := by
  cases d with
  | zero => exact absurd rfl hd
  | succ k =>
    rw [succ_mul]
    exact le_add_left _ _

/-- Multiplying a nonzero number by some `d > 1` makes it strictly bigger: `e < d * e`. -/
theorem lt_mul_of_one_lt {d e : ℕ} (hd : 1 < d) (he : e ≠ 0) : e < d * e := by
  cases d with
  | zero => exact absurd hd (not_lt_zero 1)
  | succ k =>
    have hk : k ≠ 0 := by
      intro h
      rw [h] at hd
      exact lt_irrefl 1 hd
    rw [succ_mul]
    have h1 : 1 + e ≤ k * e + e :=
      add_le_add_right (le_trans _ _ _ (one_le_of_ne_zero e he) (le_mul_of_ne_zero e hk)) e
    rw [add_comm 1 e] at h1
    exact h1

/-! ## Decidability -/

/-- `a ≤ b` is decidable: Lean can compute whether it holds.
This lets `decide` prove goals like `(3 : ℕ) ≤ 5`. -/
instance instDecidableLe : (a b : ℕ) → Decidable (a ≤ b)
  | .zero, b => isTrue (zero_le b)
  | .succ a, .zero => isFalse (not_succ_le_zero a)
  | .succ a, .succ b =>
    match instDecidableLe a b with
    | isTrue h => isTrue (succ_le_succ_of_le h)
    | isFalse h => isFalse (fun h2 => h (succ_le_succ a b h2))

/-- `a < b` is decidable (it is `a + 1 ≤ b`). -/
instance instDecidableLt (a b : ℕ) : Decidable (a < b) :=
  inferInstanceAs (Decidable (a + 1 ≤ b))

/-- A statement `∀ m, m < n → P m` about the finitely many numbers below `n` is decidable
if `P` is: Lean checks `P 0`, `P 1`, ..., `P (n-1)` one by one. -/
instance instDecidableForallLt (n : ℕ) (P : ℕ → Prop) [DecidablePred P] :
    Decidable (∀ m, m < n → P m) :=
  match n with
  | .zero => isTrue (fun m hm => absurd hm (not_lt_zero m))
  | .succ n =>
    match instDecidableForallLt n P with
    | isFalse h => isFalse (fun h2 => h (fun m hm => h2 m (lt_trans hm (lt_succ_self n))))
    | isTrue h =>
      if hn : P n then
        isTrue (fun m hm => by
          cases lt_succ_iff_lt_or_eq.mp hm with
          | inl hlt => exact h m hlt
          | inr heq =>
            rw [heq]
            exact hn)
      else isFalse (fun h2 => hn (h2 n (lt_succ_self n)))

example : (3 : ℕ) < 5 := by decide
example : ¬ (5 : ℕ) ≤ 3 := by decide
example : ∀ m, m < (4 : ℕ) → m * m < 10 := by decide

/-! ## Strong induction -/

/-- **Strong induction.** To prove `P n` for every `n`, it is enough to prove `P n`
assuming `P m` for *all* `m < n` (not just for `m = n - 1`).

Usage: `apply strong_induction` and then `intro n ih`, where
`ih : ∀ m, m < n → P m`. -/
theorem strong_induction {P : ℕ → Prop} (h : ∀ n, (∀ m, m < n → P m) → P n) :
    ∀ n, P n := by
  have key : ∀ n, ∀ m, m < n → P m := by
    intro n
    induction n with
    | zero =>
      intro m hm
      exfalso
      exact not_lt_zero m hm
    | succ n ih =>
      intro m hm
      cases lt_succ_iff_lt_or_eq.mp hm with
      | inl hlt => exact ih m hlt
      | inr heq =>
        rw [heq]
        exact h n ih
  intro n
  exact h n (key n)

/-- Strong induction, in the form used by the `induction ... using` tactic:
```
induction n using strong_induction_on with
| step n ih => ...   -- ih : ∀ m, m < n → P m
```
-/
theorem strong_induction_on {P : ℕ → Prop} (n : ℕ)
    (step : ∀ n, (∀ m, m < n → P m) → P n) : P n :=
  strong_induction step n

/-- Every number is at least `0`: a tiny test of `induction ... using strong_induction_on`. -/
example (n : ℕ) : 0 ≤ n := by
  induction n using strong_induction_on with
  | step n ih => exact zero_le n

/-! ## Well-founded recursion -/

/-- `<` is well-founded: there is no infinite descending chain `a₀ > a₁ > a₂ > ...`.
(Proof: strong induction.) -/
theorem lt_wf : WellFounded (fun a b : ℕ => a < b) :=
  WellFounded.intro (strong_induction (fun n ih => Acc.intro n (fun m hm => ih m hm)))

/-- Recursion on `ℕ` along `<`. With this instance you can define functions whose
recursive calls are on *smaller* numbers (not only on the predecessor),
justifying the definition with `termination_by` and `decreasing_by`:
```
def double (n : ℕ) : ℕ :=
  if n = 0 then 0 else double (pred n) + 2
termination_by n
decreasing_by exact pred_lt ‹_›
```
The goal after `decreasing_by` is `pred n < n`; the hypothesis `¬ n = 0` from the `if` is found by `‹_›`.
(This example is checked below.) Functions defined by well-founded recursion compute
with `#eval`, but `decide` and `rfl` cannot unfold them; in proofs use the equation
lemma (`rw [double]`).
Without `decreasing_by`, Lean tries to prove the goal automatically, which usually
fails for `MyNat`; always give the proof yourself. -/
instance instWellFoundedRelation : WellFoundedRelation MyNat :=
  ⟨fun a b => a < b, lt_wf⟩

/-- Twice `n`, defined by well-founded recursion (the example from `instWellFoundedRelation`). -/
def double (n : ℕ) : ℕ :=
  if n = 0 then 0 else double (pred n) + 2
termination_by n
decreasing_by exact pred_lt ‹_›

/-
`#eval` runs the compiled code. Note: a function defined by well-founded recursion
does not unfold by computation inside proofs, so `decide` cannot evaluate `double 3`;
in proofs, unfold it with `rw [double]` as below.
-/
/-- info: 6 -/
#guard_msgs in
#eval double 3

example (n : ℕ) (h : n ≠ 0) : double n = double (pred n) + 2 := by
  rw [double]
  split
  · contradiction
  · rfl

end MyNat
