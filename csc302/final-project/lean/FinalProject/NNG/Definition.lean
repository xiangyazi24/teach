/-!
# The natural numbers `ℕ` (Natural Number Game style)

This file defines our own copy of the natural numbers, `MyNat`, written `ℕ`,
exactly as in the Natural Number Game (NNG). It provides:

* the type `MyNat` with constructors `zero` and `succ`, and the notation `ℕ`;
* numerals: you can write `0`, `1`, `37 : ℕ` (via `ofNat`);
* `toNat`, `ToString` and `Repr`, so that `#eval` prints numbers;
* `one`, the number one;
* `MyNat.rec'`, the induction principle used by the `induction` and `cases` tactics,
  stated with `0` instead of `MyNat.zero` so that goals look like the game's;
* the `use` tactic from the game;
* a `DecidableEq` instance, so `decide` can check equalities of concrete numbers;
* the numeral lemmas `one_eq_succ_zero`, ..., `four_eq_succ_three`.

Unlike the online game, the arithmetic operations in this library are *defined*
(by recursion), not postulated. This means `#eval (2 + 2 : ℕ)` really computes `4`,
and the library uses no axioms beyond Lean's own.
-/

/-- Our copy of the natural numbers, called `MyNat`, with notation `ℕ`.
It is built from two rules:
* `zero : ℕ` (zero is a number);
* `succ (n : ℕ) : ℕ` (the successor of a number is a number). -/
inductive MyNat where
  | zero : MyNat
  | succ : MyNat → MyNat

attribute [pp_nodot] MyNat.succ

@[inherit_doc]
notation (name := MyNatNotation) (priority := 1000000) "ℕ" => MyNat

namespace MyNat

/-- The default number is `0`. -/
instance : Inhabited MyNat where
  default := MyNat.zero

/-- `ofNat x` turns a Lean numeral `x` into our `ℕ`: `ofNat 3 = succ (succ (succ zero))`.
This is what makes `(3 : ℕ)` mean something. -/
def ofNat (x : Nat) : MyNat :=
  match x with
  | Nat.zero   => MyNat.zero
  | Nat.succ b => MyNat.succ (ofNat b)

/-- `toNat x` converts our number `x` back to Lean's built-in natural numbers.
It is only used for printing. -/
def toNat (x : MyNat) : Nat :=
  match x with
  | MyNat.zero   => Nat.zero
  | MyNat.succ b => Nat.succ (toNat b)

/-- Numerals: `(37 : ℕ)` means `ofNat 37`. -/
instance instOfNat {n : Nat} : OfNat MyNat n where
  ofNat := ofNat n

/-- Print a number in decimal (via `toNat`). -/
instance : ToString MyNat where
  toString p := toString (toNat p)

/-- `#eval` shows a number in decimal (via `toNat`). -/
instance : Repr MyNat where
  reprPrec p _ := repr (toNat p)

/-- `zero_eq_0` says that the constructor `MyNat.zero` is the numeral `0`. -/
theorem zero_eq_0 : MyNat.zero = 0 := rfl

/-- The number one, defined as `succ 0`. -/
def one : MyNat := MyNat.succ 0

/-- Induction on `ℕ`, stated with `0` (rather than `MyNat.zero`).

Lean uses this principle whenever you write
```
induction n with
| zero => ...
| succ n ih => ...
```
so the base case shows the goal for `0` and the step case the goal for `succ n`,
with the induction hypothesis `ih` for `n`. -/
@[elab_as_elim, induction_eliminator]
def rec' {motive : ℕ → Sort u} (zero : motive 0)
    (succ : (n : ℕ) → motive n → motive (succ n)) : (t : ℕ) → motive t
  | .zero => zero
  | .succ n => succ n (rec' zero succ n)

/-- Case analysis on `ℕ`, stated with `0`: every number is `0` or `succ n`.
Lean uses this when you write `cases n with | zero => ... | succ n => ...`. -/
@[elab_as_elim, cases_eliminator]
def casesOn' {motive : ℕ → Sort u} (zero : motive 0)
    (succ : (n : ℕ) → motive (succ n)) : (t : ℕ) → motive t
  | .zero => zero
  | .succ n => succ n

/-- `use e` proves a goal of the form `∃ x, P x` by supplying the witness `e`;
the goal becomes `P e`. (If that goal is true by `rfl`, it is closed at once.)
Since `a ≤ b` means `∃ c, b = a + c`, `use c` also works on `≤` goals. -/
macro "use " e:term : tactic => `(tactic| (refine ⟨$e, ?_⟩; try rfl))

/-- Equality of numbers is decidable: Lean can compute whether `a = b`.
This is what lets the `decide` tactic prove goals like `(2 : ℕ) + 2 = 4`
and lets you write `if a = b then ... else ...`. -/
instance instDecidableEq : DecidableEq MyNat
  | .zero, .zero => isTrue rfl
  | .succ _, .zero => isFalse MyNat.noConfusion
  | .zero, .succ _ => isFalse MyNat.noConfusion
  | .succ m, .succ n =>
    match instDecidableEq m n with
    | isTrue h => isTrue (by rw [h])
    | isFalse h => isFalse (fun h2 => h (MyNat.succ.inj h2))

/-! ## Numerals -/

/-- `one_eq_succ_zero` is a proof of `1 = succ 0`. -/
theorem one_eq_succ_zero : 1 = succ 0 := by rfl
/-- `two_eq_succ_one` is a proof of `2 = succ 1`. -/
theorem two_eq_succ_one : 2 = succ 1 := by rfl
/-- `three_eq_succ_two` is a proof of `3 = succ 2`. -/
theorem three_eq_succ_two : 3 = succ 2 := by rfl
/-- `four_eq_succ_three` is a proof of `4 = succ 3`. -/
theorem four_eq_succ_three : 4 = succ 3 := by rfl

end MyNat
