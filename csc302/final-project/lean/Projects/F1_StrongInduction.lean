import FinalProject.NNG

/-!
# F1. Strong induction and the well-ordering principle  (★★)

Ordinary induction steps from `n` to `n + 1`; strong induction may use *all* smaller cases.
Starting from the Natural Number Game alone, define `a < b` as `a + 1 ≤ b`, prove strong
induction from ordinary induction, then the well-ordering principle and the principle of no
infinite descent. Apply them: every `n ≥ 2` has a prime divisor, namely its least divisor
`d ≥ 2`. The extension proves that the three principles are equivalent.

Size: about 300–400 lines, comments included (guideline: about 350 lines; 260 measured
without the extension). Do the extension.

Rules for the submitted file:
* It compiles with `scripts/check.sh`, with no `sorry`, `admit`, `axiom` or `native_decide`.
* It ends with `#print axioms` for the main theorem (only `propext`, `Classical.choice`,
  `Quot.sound` may appear).
* `grind` only to close an equation between polynomial expressions; never for
  inequalities, divisibility or logic.
* Track F: import only `FinalProject.NNG`. No Mathlib, no Lean `Nat` theorems, no `omega`.

Everything lives in the namespace `F1`, so the names do not clash with the library's
`FinalProject.Modulo.*` (which you may read, but not import or copy).
-/

open MyNat

namespace F1

/-! ## The definition of `<` -/

/-- `lt a b`, written `a < b`, means `a + 1 ≤ b`. -/
def lt (a b : ℕ) : Prop := a + 1 ≤ b

/-- The notation `a < b` for `lt a b`. -/
instance : LT MyNat := ⟨F1.lt⟩

/-- `a < b` is by definition `a + 1 ≤ b`. -/
theorem lt_iff_add_one_le (a b : ℕ) : a < b ↔ a + 1 ≤ b := Iff.rfl

/-! ## Facts about `<`

Prove the facts you need. Some you will probably want (add more as you go): -/

/-- No number is less than `0`. -/
theorem not_lt_zero (a : ℕ) : ¬ a < 0 := by
  sorry

/-- `m < n + 1` means `m < n` or `m = n`. -/
theorem lt_succ_iff_lt_or_eq {m n : ℕ} : m < succ n ↔ m < n ∨ m = n := by
  sorry

/-- Trichotomy in a convenient form: `a < b` or `b ≤ a`. -/
theorem lt_or_ge (a b : ℕ) : a < b ∨ b ≤ a := by
  sorry

/-! ## Strong induction -/

/-- **Strong induction.** To prove `P n` for every `n`, it is enough to prove `P n`
assuming `P m` for every `m < n`.
Hint: prove `∀ n, ∀ m, m < n → P m` by ordinary induction on `n`. -/
theorem strong_induction {P : ℕ → Prop} (h : ∀ n, (∀ m, m < n → P m) → P n) :
    ∀ n, P n := by
  sorry

/-! ## Well-ordering and no infinite descent -/

/-- **Well-ordering principle.** If `P n` holds for some `n`, then there is an `n` with
`P n` such that `n ≤ m` for every `m` with `P m` (a least element). -/
theorem well_ordering {P : ℕ → Prop} (h : ∃ n, P n) :
    ∃ n, P n ∧ ∀ m, P m → n ≤ m := by
  sorry

/-- **No infinite descent.** If every `n` with `P n` has some `m < n` with `P m`,
then `P` never holds. -/
theorem no_infinite_descent {P : ℕ → Prop} (h : ∀ n, P n → ∃ m, m < n ∧ P m) :
    ∀ n, ¬ P n := by
  sorry

/-! ## Application: every `n ≥ 2` has a prime divisor -/

/-- `a ∣ b` ("`a` divides `b`") means `b = a * c` for some `c`. -/
instance : Dvd MyNat := ⟨fun a b => ∃ c, b = a * c⟩

/-- `a ∣ b` is by definition `∃ c, b = a * c`. -/
theorem dvd_iff_exists_mul (a b : ℕ) : a ∣ b ↔ ∃ c, b = a * c := Iff.rfl

/-- `Prime p`: `p ≥ 2` and the only divisors of `p` are `1` and `p`
(the same definition as the library's `MyNat.Prime`). -/
def Prime (p : ℕ) : Prop := 2 ≤ p ∧ ∀ d, d ∣ p → d = 1 ∨ d = p

/-- **Least divisor.** Every `n ≥ 2` has a least divisor `d ≥ 2`: `d ∣ n`, and `d ≤ e`
for every divisor `e ≥ 2` of `n`. (Use well-ordering; `n` itself is such a divisor.) -/
theorem exists_least_divisor (n : ℕ) (hn : 2 ≤ n) :
    ∃ d, 2 ≤ d ∧ d ∣ n ∧ ∀ e, 2 ≤ e → e ∣ n → d ≤ e := by
  sorry

/-- **The least divisor is prime.** If `d ≥ 2` divides `n` and every divisor `e ≥ 2` of `n`
satisfies `d ≤ e`, then `d` is prime. -/
theorem least_divisor_prime {n d : ℕ} (hd : 2 ≤ d) (hdn : d ∣ n)
    (hmin : ∀ e, 2 ≤ e → e ∣ n → d ≤ e) : Prime d := by
  sorry

/-- **Every `n ≥ 2` has a prime divisor.** -/
theorem exists_prime_dvd (n : ℕ) (hn : 2 ≤ n) : ∃ p, Prime p ∧ p ∣ n := by
  sorry

/-! ## Extension: the three principles are equivalent

The three principles, as statements about *every* predicate `P`. In this section, do not
use the theorems `strong_induction`, `well_ordering`, `no_infinite_descent` above: prove
each implication from its hypothesis, using only ordinary induction (and the facts about
`<`) in between. Three of the six follow from the other three by composition. -/

/-- The principle of strong induction. -/
def StrongInduction : Prop :=
  ∀ P : ℕ → Prop, (∀ n, (∀ m, m < n → P m) → P n) → ∀ n, P n

/-- The well-ordering principle. -/
def WellOrdering : Prop :=
  ∀ P : ℕ → Prop, (∃ n, P n) → ∃ n, P n ∧ ∀ m, P m → n ≤ m

/-- The principle of no infinite descent. -/
def NoInfiniteDescent : Prop :=
  ∀ P : ℕ → Prop, (∀ n, P n → ∃ m, m < n ∧ P m) → ∀ n, ¬ P n

/-- Strong induction implies well-ordering. -/
theorem wellOrdering_of_strongInduction (h : StrongInduction) : WellOrdering := by
  sorry

/-- Strong induction implies no infinite descent. -/
theorem noInfiniteDescent_of_strongInduction (h : StrongInduction) : NoInfiniteDescent := by
  sorry

/-- Well-ordering implies strong induction. -/
theorem strongInduction_of_wellOrdering (h : WellOrdering) : StrongInduction := by
  sorry

/-- Well-ordering implies no infinite descent. -/
theorem noInfiniteDescent_of_wellOrdering (h : WellOrdering) : NoInfiniteDescent := by
  sorry

/-- No infinite descent implies strong induction. -/
theorem strongInduction_of_noInfiniteDescent (h : NoInfiniteDescent) : StrongInduction := by
  sorry

/-- No infinite descent implies well-ordering. -/
theorem wellOrdering_of_noInfiniteDescent (h : NoInfiniteDescent) : WellOrdering := by
  sorry

#print axioms strong_induction
#print axioms well_ordering
#print axioms no_infinite_descent
#print axioms exists_prime_dvd

end F1
