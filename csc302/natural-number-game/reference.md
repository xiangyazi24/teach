# Natural Number Game: definitions, axioms and theorems

Extracted from the [Natural Number Game](https://adam.math.hhu.de/#/g/leanprover-community/nng4) on 2026-09-08. See [source and usage notes](README.md).

## How to read this reference

The six definition cards and all 70 theorem cards below reproduce the live game's English documentation. The six arithmetic axioms are included among those 70 cards. The source notes distinguish `axiom` declarations from proved declarations; the game's general label ‘Theorem’ does not make every entry an axiom. Signatures are documentation excerpts, with their original hypotheses and generated binder names preserved.

## Foundations and Peano principles

The game uses the inductive type `MyNat`, written `ℕ`, rather than Lean's built-in `Nat`. Its constructors are zero and successor. Mathematical induction proves a property for every number by proving the zero case and proving the successor case from the induction hypothesis. See the [live induction documentation](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Tactic__induction.json).

The familiar Peano principles `succ_inj` (successor is injective) and `zero_ne_succ` (zero is not a successor) are proved theorems in the supplied source. They are not additional Lean `axiom` declarations. Their exact statements and source links appear in the Peano catalogue below.

The source defines `add`, `mul` and `pow` as opaque operations and declares two axioms for each. These are the recursive arithmetic rules supplied to the player:

| Axiom | Exact live signature | Source |
|---|---|---|
| `add_zero` | `add_zero (a : ℕ) : a + 0 = a` | [declaration](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/Addition.lean#L17) |
| `add_succ` | `add_succ (a d : ℕ) : a + MyNat.succ d = MyNat.succ (a + d)` | [declaration](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/Addition.lean#L24) |
| `mul_zero` | `mul_zero (a : ℕ) : a * 0 = 0` | [declaration](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/Multiplication.lean#L11) |
| `mul_succ` | `mul_succ (a b : ℕ) : a * MyNat.succ b = a * b + a` | [declaration](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/Multiplication.lean#L14) |
| `pow_zero` | `pow_zero (m : ℕ) : m ^ 0 = 1` | [declaration](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/Power.lean#L16) |
| `pow_succ` | `pow_succ (m n : ℕ) : m ^ MyNat.succ n = m ^ n * m` | [declaration](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/Power.lean#L19) |

### Source definitions and helpers

These additional excerpts preserve the upstream definitions. In particular, `pred 0 = 37` is intentional in this game; it is not the usual truncated predecessor. Only the successor equation is needed in Algorithm World. The following fragments omit their surrounding namespace and imports.

#### Natural numbers

```lean
inductive MyNat where
| zero : MyNat
| succ : MyNat → MyNat
```

[Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/Definition.lean#L4)

#### Numeral conversion

```lean
def ofNat (x : Nat) : MyNat :=
  match x with
  | Nat.zero   => MyNat.zero
  | Nat.succ b => MyNat.succ (ofNat b)
```

[Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/Definition.lean#L21)

#### One

```lean
def one : MyNat := MyNat.succ 0
```

[Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/Definition.lean#L41)

#### Addition operation

```lean
opaque add : MyNat → MyNat → MyNat
```

[Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/Addition.lean#L5)

#### Multiplication operation

```lean
opaque mul : MyNat → MyNat → MyNat
```

[Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/Multiplication.lean#L5)

#### Power operation

```lean
opaque pow : ℕ → ℕ → ℕ
```

[Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/Power.lean#L6)

#### Order

```lean
def le (a b : ℕ) :=  ∃ (c : ℕ), b = a + c
```

[Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/LE.lean#L5)

#### Predecessor helper

```lean
def pred : ℕ → ℕ
| 0 => 37
| succ n => n
```

[Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/PeanoAxioms.lean#L15)

#### Zero test

```lean
def is_zero : ℕ → Prop
| 0 => True
| succ _ => False
```

[Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/PeanoAxioms.lean#L24)

## Definition cards

### ℕ (MyNat)

`ℕ` is the natural numbers, just called \"numbers\" in this game. It's
defined via two rules:

* `0 : ℕ` (zero is a number)
* `succ (n : ℕ) : ℕ` (the successor of a number is a number)

##### Game Implementation

*The game uses its own copy of the natural numbers, called `MyNat` with notation `ℕ`.
It is distinct from the Lean natural numbers `Nat`, which should hopefully
never leak into the natural number game.*

[Live definition card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Definition__MyNat.json)

### + (Add)

`Add a b`, with notation `a + b`, is
the usual sum of natural numbers. Internally it is defined
via the following two hypotheses:

* `add_zero a : a + 0 = a`

* `add_succ a b : a + succ b = succ (a + b)`

Other theorems about naturals, such as `zero_add a : 0 + a = a`, are proved
by induction using these two basic theorems."

[Live definition card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Definition__Add.json)

### * (Mul)

`Mul a b`, with notation `a * b`, is the usual
  product of natural numbers. Internally it is
  via two axioms:

  * `mul_zero a : a * 0 = 0`

  * `mul_succ a b : a * succ b = a * b + a`

Other theorems about naturals, such as `zero_mul`,
are proved by induction from these two basic theorems.

[Live definition card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Definition__Mul.json)

### ^ (Pow)

`Pow a b`, with notation `a ^ b`, is the usual
  exponentiation of natural numbers. Internally it is
  defined via two axioms:

  * `pow_zero a : a ^ 0 = 1`

  * `pow_succ a b : a ^ succ b = a ^ b * a`

Note in particular that `0 ^ 0 = 1`.

[Live definition card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Definition__Pow.json)

### ≤ (LE)

`a ≤ b` is *notation* for `∃ c, b = a + c`.

Because this game doesn't have negative numbers, this definition
is mathematically valid.

This means that if you have a goal of the form `a ≤ b` you can
make progress with the `use` tactic, and if you have a hypothesis
`h : a ≤ b`, you can make progress with `cases h with c hc`.

[Live definition card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Definition__LE.json)

### ≠ (Ne)

`a ≠ b` is *notation* for `(a = b) → False`.

The reason this is mathematically
valid is that if `P` is a true-false statement then `P → False`
is the logical opposite of `P`. Indeed `True → False` is false,
and `False → False` is true!

The upshot of this is that you can treat `a ≠ b` in exactly
the same way as you treat any implication `P → Q`. For example,
if your *goal* is of the form `a ≠ b` then you can make progress
with `intro h`, and if you have a hypothesis `h` of the
form `a ≠ b` then you can `apply h at h1` if `h1` is a proof
of `a = b`.

[Live definition card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Definition__Ne.json)

## Theorem catalogue

Each card retains the live statement and explanatory text. “Exercise result” identifies the level that asks the player to prove it; other entries are supplied facts. This extraction does not independently rebuild or re-prove the upstream Lean project.

### Numerals

<a id="mynat-four-eq-succ-three"></a>

#### four_eq_succ_three

Source declaration: `theorem`. Supplied fact.

```lean
four_eq_succ_three : 4 = MyNat.succ 3
```

`four_eq_succ_three` is a proof of `4 = succ 3`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.four_eq_succ_three.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/TutorialLemmas.lean#L13)

<a id="mynat-one-eq-succ-zero"></a>

#### one_eq_succ_zero

Source declaration: `theorem`. Supplied fact.

```lean
one_eq_succ_zero : 1 = MyNat.succ 0
```

`one_eq_succ_zero` is a proof of `1 = succ 0`."

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.one_eq_succ_zero.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/TutorialLemmas.lean#L10)

<a id="mynat-one-ne-zero"></a>

#### one_ne_zero

Source declaration: `theorem`. Exercise result: `Implication/10`.

```lean
one_ne_zero : 1 ≠ 0
```

`one_ne_zero` is a proof that `1 ≠ 0`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.one_ne_zero.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Implication/L10one_ne_zero.lean#L43)

<a id="mynat-three-eq-succ-two"></a>

#### three_eq_succ_two

Source declaration: `theorem`. Supplied fact.

```lean
three_eq_succ_two : 3 = MyNat.succ 2
```

`three_eq_succ_two` is a proof of `3 = succ 2`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.three_eq_succ_two.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/TutorialLemmas.lean#L12)

<a id="mynat-two-eq-succ-one"></a>

#### two_eq_succ_one

Source declaration: `theorem`. Supplied fact.

```lean
two_eq_succ_one : 2 = MyNat.succ 1
```

`two_eq_succ_one` is a proof of `2 = succ 1`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.two_eq_succ_one.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/TutorialLemmas.lean#L11)

<a id="mynat-zero-ne-one"></a>

#### zero_ne_one

Source declaration: `theorem`. Exercise result: `Implication/9`.

```lean
zero_ne_one : 0 ≠ 1
```

`zero_ne_one` is a proof of `0 ≠ 1`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.zero_ne_one.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Implication/L09zero_ne_succ.lean#L33)

### Peano and helper facts

<a id="mynat-is-zero-succ"></a>

#### is_zero_succ

Source declaration: `lemma`. Supplied fact.

```lean
is_zero_succ (n : ℕ) : (MyNat.succ n).is_zero = False
```

`is_zero_succ a` is a proof of `is_zero (succ a) = False`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.is_zero_succ.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/PeanoAxioms.lean#L29)

<a id="mynat-is-zero-zero"></a>

#### is_zero_zero

Source declaration: `lemma`. Supplied fact.

```lean
is_zero_zero : MyNat.is_zero 0 = True
```

`is_zero_zero` is a proof of `is_zero 0 = True`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.is_zero_zero.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/PeanoAxioms.lean#L28)

<a id="mynat-pred-succ"></a>

#### pred_succ

Source declaration: `lemma`. Supplied fact.

```lean
pred_succ (n : ℕ) : (MyNat.succ n).pred = n
```

`pred_succ n` is a proof of `pred (succ n) = n`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.pred_succ.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/PeanoAxioms.lean#L19)

<a id="mynat-succ-inj"></a>

#### succ_inj

Source declaration: `theorem`. Supplied fact.

```lean
succ_inj (a b : ℕ) (h : MyNat.succ a = MyNat.succ b) : a = b
```

##### Statement

If $a$ and $b$ are numbers, then
`succ_inj a b` is the proof that
$ (\operatorname{succ}(a) = \operatorname{succ}(b)) \implies a=b$.

###### More technical details

There are other ways to think about `succ_inj`.

You can think about `succ_inj` itself as a function which takes two
numbers $$a$$ and $$b$$ as input, and outputs a proof of
$ ( \operatorname{succ}(a) = \operatorname{succ}(b)) \implies a=b$.

You can think of `succ_inj` itself as a proof; it is the proof
that `succ` is an injective function. In other words,
`succ_inj` is a proof of
$\forall a, b \in  \mathbb{N}, ( \operatorname{succ}(a) = \operatorname{succ}(b)) \implies a=b$.

`succ_inj` was postulated as an axiom by Peano, but
in Lean it can be proved using `pred`, a mathematically
pathological function.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.succ_inj.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/PeanoAxioms.lean#L21)

<a id="mynat-succ-ne-succ"></a>

#### succ_ne_succ

Source declaration: `theorem`. Exercise result: `Algorithm/7`.

```lean
succ_ne_succ (m n : ℕ) (h : m ≠ n) : MyNat.succ m ≠ MyNat.succ n
```

`succ_ne_succ m n` is the proof that `m ≠ n → succ m ≠ succ n`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.succ_ne_succ.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Algorithm/L07succ_ne_succ.lean#L62)

<a id="mynat-succ-ne-zero"></a>

#### succ_ne_zero

Source declaration: `theorem`. Exercise result: `Algorithm/6`.

```lean
succ_ne_zero (a : ℕ) : MyNat.succ a ≠ 0
```

`succ_ne_zero a` is a proof of `succ a ≠ 0`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.succ_ne_zero.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Algorithm/L06is_zero.lean#L52)

<a id="mynat-zero-ne-succ"></a>

#### zero_ne_succ

Source declaration: `theorem`. Supplied fact.

```lean
zero_ne_succ (a : ℕ) : 0 ≠ MyNat.succ a
```

`zero_ne_succ n` is the proof that `0 ≠ succ n`.

In Lean, `a ≠ b` is *defined to mean* `a = b → False`. Hence
`zero_ne_succ n` is really a proof of `0 = succ n → False`.
Here `False` is a generic false statement. This means that
you can `apply zero_ne_succ at h` if `h` is a proof of `0 = succ n`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.zero_ne_succ.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/PeanoAxioms.lean#L31)

### Addition

<a id="mynat-add-assoc"></a>

#### add_assoc

Source declaration: `theorem`. Exercise result: `Addition/4`.

```lean
add_assoc (a b c : ℕ) : a + b + c = a + (b + c)
```

`add_assoc a b c` is a proof
that `(a + b) + c = a + (b + c)`. Note that in Lean `(a + b) + c` prints
as `a + b + c`, because the notation for addition is defined to be left
associative.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.add_assoc.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Addition/L04add_assoc.lean#L33)

<a id="mynat-add-comm"></a>

#### add_comm

Source declaration: `theorem`. Exercise result: `Addition/3`.

```lean
add_comm (a b : ℕ) : a + b = b + a
```

`add_comm x y` is a proof of `x + y = y + x`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.add_comm.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Addition/L03add_comm.lean#L24)

<a id="mynat-add-left-cancel"></a>

#### add_left_cancel

Source declaration: `theorem`. Exercise result: `AdvAddition/2`.

```lean
add_left_cancel (a b n : ℕ) (a✝ : n + a = n + b) : a = b
```

`add_left_cancel a b n` is the theorem that $n+a=n+b \implies a=b.$

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.add_left_cancel.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvAddition/L02add_left_cancel.lean#L20)

<a id="mynat-add-left-comm"></a>

#### add_left_comm

Source declaration: `theorem`. Exercise result: `Algorithm/1`.

```lean
add_left_comm (a b c : ℕ) : a + (b + c) = b + (a + c)
```

`add_left_comm a b c` is a proof that `a + (b + c) = b + (a + c)`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.add_left_comm.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Algorithm/L01add_left_comm.lean#L25)

<a id="mynat-add-left-eq-self"></a>

#### add_left_eq_self

Source declaration: `theorem`. Exercise result: `AdvAddition/3`.

```lean
add_left_eq_self (x y : ℕ) (a✝ : x + y = y) : x = 0
```

`add_left_eq_self x y` is the theorem that $x + y = y \implies x=0.$

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.add_left_eq_self.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvAddition/L03add_left_eq_self.lean#L20)

<a id="mynat-add-left-eq-zero"></a>

#### add_left_eq_zero

Source declaration: `theorem`. Exercise result: `AdvAddition/6`.

```lean
add_left_eq_zero (a b : ℕ) (a✝ : a + b = 0) : b = 0
```

A proof that $a+b=0 \implies b=0$.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.add_left_eq_zero.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvAddition/L06add_left_eq_zero.lean#L20)

<a id="mynat-add-right-cancel"></a>

#### add_right_cancel

Source declaration: `theorem`. Exercise result: `AdvAddition/1`.

```lean
add_right_cancel (a b n : ℕ) (a✝ : a + n = b + n) : a = b
```

`add_right_cancel a b n` is the theorem that $a+n=b+n \implies a=b.$

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.add_right_cancel.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvAddition/L01add_right_cancel.lean#L22)

<a id="mynat-add-right-comm"></a>

#### add_right_comm

Source declaration: `theorem`. Exercise result: `Addition/5`.

```lean
add_right_comm (a b c : ℕ) : a + b + c = a + c + b
```

`add_right_comm a b c` is a proof that `(a + b) + c = (a + c) + b`

In Lean, `a + b + c` means `(a + b) + c`, so this result gets displayed
as `a + b + c = a + c + b`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.add_right_comm.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Addition/L05add_right_comm.lean#L35)

<a id="mynat-add-right-eq-self"></a>

#### add_right_eq_self

Source declaration: `theorem`. Exercise result: `AdvAddition/4`.

```lean
add_right_eq_self (x y : ℕ) (a✝ : x + y = x) : y = 0
```

`add_right_eq_self x y` is the theorem that $x + y = x \implies y=0.$

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.add_right_eq_self.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvAddition/L04add_right_eq_self.lean#L20)

<a id="mynat-add-right-eq-zero"></a>

#### add_right_eq_zero

Source declaration: `theorem`. Exercise result: `AdvAddition/5`.

```lean
add_right_eq_zero (a b : ℕ) (a✝ : a + b = 0) : a = 0
```

A proof that $a+b=0 \implies a=0$.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.add_right_eq_zero.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvAddition/L05add_right_eq_zero.lean#L78)

<a id="mynat-add-succ"></a>

#### add_succ

Source declaration: `axiom`. Supplied fact.

```lean
add_succ (a d : ℕ) : a + MyNat.succ d = MyNat.succ (a + d)
```

`add_succ a b` is the proof of `a + succ b = succ (a + b)`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.add_succ.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/Addition.lean#L24)

<a id="mynat-add-zero"></a>

#### add_zero

Source declaration: `axiom`. Supplied fact.

```lean
add_zero (a : ℕ) : a + 0 = a
```

`add_zero a` is a proof that `a + 0 = a`.

###### Summary

`add_zero` is really a function, which
eats a number, and returns a proof of a theorem
about that number. For example `add_zero 37` is
a proof that `37 + 0 = 37`.

The `rw` tactic will accept `rw [add_zero]`
and will try to figure out which number you omitted
to input.

###### Details

A mathematician sometimes thinks of `add_zero`
as \"one thing\", namely a proof of $\forall n ∈ ℕ, n + 0 = n$.
This is just another way of saying that it's a function which
can eat any number n and will return a proof that `n + 0 = n`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.add_zero.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/Addition.lean#L17)

<a id="mynat-succ-add"></a>

#### succ_add

Source declaration: `theorem`. Exercise result: `Addition/2`.

```lean
succ_add (a b : ℕ) : MyNat.succ a + b = MyNat.succ (a + b)
```

`succ_add a b` is a proof that `succ a + b = succ (a + b)`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.succ_add.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Addition/L02succ_add.lean#L28)

<a id="mynat-succ-eq-add-one"></a>

#### succ_eq_add_one

Source declaration: `theorem`. Exercise result: `Tutorial/7`.

```lean
succ_eq_add_one (n : ℕ) : MyNat.succ n = n + 1
```

`succ_eq_add_one n` is the proof that `succ n = n + 1`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.succ_eq_add_one.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Tutorial/L07add_succ.lean#L42)

<a id="mynat-zero-add"></a>

#### zero_add

Source declaration: `theorem`. Exercise result: `Addition/1`.

```lean
zero_add (n : ℕ) : 0 + n = n
```

`zero_add x` is the proof of `0 + x = x`.

`zero_add` is a `simp` lemma, because replacing `0 + x` by `x`
is almost always what you want to do if you're simplifying an expression.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.zero_add.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Addition/L01zero_add.lean#L45)

### Multiplication

<a id="mynat-add-mul"></a>

#### add_mul

Source declaration: `theorem`. Exercise result: `Multiplication/8`.

```lean
add_mul (a b c : ℕ) : (a + b) * c = a * c + b * c
```

`add_mul a b c` is a proof that $(a+b)c=ac+bc$.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.add_mul.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Multiplication/L08add_mul.lean#L23)

<a id="mynat-mul-add"></a>

#### mul_add

Source declaration: `theorem`. Exercise result: `Multiplication/7`.

```lean
mul_add (a b c : ℕ) : a * (b + c) = a * b + a * c
```

Multiplication distributes
over addition on the left.

`mul_add a b c` is the proof that `a * (b + c) = a * b + a * c`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.mul_add.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Multiplication/L07mul_add.lean#L31)

<a id="mynat-mul-assoc"></a>

#### mul_assoc

Source declaration: `theorem`. Exercise result: `Multiplication/9`.

```lean
mul_assoc (a b c : ℕ) : a * b * c = a * (b * c)
```

`mul_assoc a b c` is a proof that `(a * b) * c = a * (b * c)`.

Note that when Lean says `a * b * c` it means `(a * b) * c`.

Note that `(a * b) * c = a * (b * c)` cannot be proved by \"pure thought\":
for example subtraction is not associative, as `(6 - 2) - 1` is not
equal to `6 - (2 - 1)`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.mul_assoc.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Multiplication/L09mul_assoc.lean#L30)

<a id="mynat-mul-comm"></a>

#### mul_comm

Source declaration: `theorem`. Exercise result: `Multiplication/4`.

```lean
mul_comm (a b : ℕ) : a * b = b * a
```

`mul_comm` is the proof that multiplication is commutative. More precisely,
`mul_comm a b` is the proof that `a * b = b * a`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.mul_comm.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Multiplication/L04mul_comm.lean#L27)

<a id="mynat-mul-eq-zero"></a>

#### mul_eq_zero

Source declaration: `theorem`. Exercise result: `AdvMultiplication/8`.

```lean
mul_eq_zero (a b : ℕ) (h : a * b = 0) : a = 0 ∨ b = 0
```

`mul_eq_zero a b` is a proof that if `a * b = 0` then `a = 0` or `b = 0`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.mul_eq_zero.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L08mul_eq_zero.lean#L20)

<a id="mynat-mul-le-mul-right"></a>

#### mul_le_mul_right

Source declaration: `theorem`. Exercise result: `AdvMultiplication/1`.

```lean
mul_le_mul_right (a b t : ℕ) (h : a ≤ b) : a * t ≤ b * t
```

`mul_le_mul_right a b t` is a proof that `a ≤ b → a * t ≤ b * t`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.mul_le_mul_right.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L01mul_le_mul_right.lean#L18)

<a id="mynat-mul-left-cancel"></a>

#### mul_left_cancel

Source declaration: `theorem`. Exercise result: `AdvMultiplication/9`.

```lean
mul_left_cancel (a b c : ℕ) (ha : a ≠ 0) (h : a * b = a * c) : b = c
```

`mul_left_cancel a b c` is a proof that if `a ≠ 0` and `a * b = a * c` then `b = c`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.mul_left_cancel.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L09mul_left_cancel.lean#L30)

<a id="mynat-mul-left-ne-zero"></a>

#### mul_left_ne_zero

Source declaration: `theorem`. Exercise result: `AdvMultiplication/2`.

```lean
mul_left_ne_zero (a b : ℕ) (h : a * b ≠ 0) : b ≠ 0
```

`mul_left_ne_zero a b` is a proof that `a * b ≠ 0 → b ≠ 0`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.mul_left_ne_zero.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L02mul_left_ne_zero.lean#L18)

<a id="mynat-mul-ne-zero"></a>

#### mul_ne_zero

Source declaration: `theorem`. Exercise result: `AdvMultiplication/7`.

```lean
mul_ne_zero (a b : ℕ) (ha : a ≠ 0) (hb : b ≠ 0) : a * b ≠ 0
```

`mul_ne_zero a b` is a proof that if `a ≠ 0` and `b ≠ 0` then `a * b ≠ 0`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.mul_ne_zero.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L07mul_ne_zero.lean#L21)

<a id="mynat-mul-one"></a>

#### mul_one

Source declaration: `theorem`. Exercise result: `Multiplication/1`.

```lean
mul_one (m : ℕ) : m * 1 = m
```

`mul_one m` is the proof that `m * 1 = m`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.mul_one.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Multiplication/L01mul_one.lean#L49)

<a id="mynat-mul-right-eq-one"></a>

#### mul_right_eq_one

Source declaration: `theorem`. Exercise result: `AdvMultiplication/6`.

```lean
mul_right_eq_one (x y : ℕ) (h : x * y = 1) : x = 1
```

`mul_right_eq_one a b` is a proof that `a * b = 1 → a = 1`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.mul_right_eq_one.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L06mul_right_eq_one.lean#L66)

<a id="mynat-mul-right-eq-self"></a>

#### mul_right_eq_self

Source declaration: `theorem`. Exercise result: `AdvMultiplication/10`.

```lean
mul_right_eq_self (a b : ℕ) (ha : a ≠ 0) (h : a * b = a) : b = 1
```

`mul_right_eq_self a b` is a proof that if `a ≠ 0` and `a * b = a` then `b = 1`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.mul_right_eq_self.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L10mul_right_eq_self.lean#L19)

<a id="mynat-mul-succ"></a>

#### mul_succ

Source declaration: `axiom`. Supplied fact.

```lean
mul_succ (a b : ℕ) : a * MyNat.succ b = a * b + a
```

`mul_succ a b` is the proof that `a * succ b = a * b + a`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.mul_succ.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/Multiplication.lean#L14)

<a id="mynat-mul-zero"></a>

#### mul_zero

Source declaration: `axiom`. Supplied fact.

```lean
mul_zero (a : ℕ) : a * 0 = 0
```

`mul_zero m` is the proof that `m * 0 = 0`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.mul_zero.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/Multiplication.lean#L11)

<a id="mynat-one-mul"></a>

#### one_mul

Source declaration: `theorem`. Exercise result: `Multiplication/5`.

```lean
one_mul (m : ℕ) : 1 * m = m
```

`one_mul m` is the proof `1 * m = m`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.one_mul.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Multiplication/L05one_mul.lean#L20)

<a id="mynat-succ-mul"></a>

#### succ_mul

Source declaration: `theorem`. Exercise result: `Multiplication/3`.

```lean
succ_mul (a b : ℕ) : MyNat.succ a * b = a * b + b
```

`succ_mul a b` is the proof that `succ a * b = a * b + b`.

It could be deduced from `mul_succ` and `mul_comm`, however this argument
would be circular because the proof of `mul_comm` uses `mul_succ`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.succ_mul.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Multiplication/L03succ_mul.lean#L32)

<a id="mynat-two-mul"></a>

#### two_mul

Source declaration: `theorem`. Exercise result: `Multiplication/6`.

```lean
two_mul (m : ℕ) : 2 * m = m + m
```

`two_mul m` is the proof that `2 * m = m + m`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.two_mul.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Multiplication/L06two_mul.lean#L21)

<a id="mynat-zero-mul"></a>

#### zero_mul

Source declaration: `theorem`. Exercise result: `Multiplication/2`.

```lean
zero_mul (m : ℕ) : 0 * m = 0
```

`zero_mul x` is the proof that `0 * x = 0`.

Note: `zero_mul` is a `simp` lemma.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.zero_mul.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Multiplication/L02zero_mul.lean#L26)

### Powers

<a id="mynat-add-sq"></a>

#### add_sq

Source declaration: `theorem`. Exercise result: `Power/9`.

```lean
add_sq (a b : ℕ) : (a + b) ^ 2 = a ^ 2 + b ^ 2 + 2 * a * b
```

`add_sq a b` is the statement that $(a+b)^2=a^2+b^2+2ab.$

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.add_sq.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Power/L09add_sq.lean#L21)

<a id="mynat-mul-pow"></a>

#### mul_pow

Source declaration: `theorem`. Exercise result: `Power/7`.

```lean
mul_pow (a b n : ℕ) : (a * b) ^ n = a ^ n * b ^ n
```

`mul_pow a b n` is a proof that $(ab)^n=a^nb^n.$

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.mul_pow.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Power/L07mul_pow.lean#L23)

<a id="mynat-one-pow"></a>

#### one_pow

Source declaration: `theorem`. Exercise result: `Power/4`.

```lean
one_pow (m : ℕ) : 1 ^ m = 1
```

`one_pow n` is a proof that $1^n=1$.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.one_pow.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Power/L04one_pow.lean#L13)

<a id="mynat-pow-add"></a>

#### pow_add

Source declaration: `theorem`. Exercise result: `Power/6`.

```lean
pow_add (a m n : ℕ) : a ^ (m + n) = a ^ m * a ^ n
```

`pow_add a m n` is a proof that $a^{m+n}=a^ma^n.$

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.pow_add.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Power/L06pow_add.lean#L16)

<a id="mynat-pow-one"></a>

#### pow_one

Source declaration: `theorem`. Exercise result: `Power/3`.

```lean
pow_one (a : ℕ) : a ^ 1 = a
```

`pow_one a` says that `a ^ 1 = a`.

Note that this is not quite true by definition: `a ^ 1` is
defined to be `a ^ 0 * a` so it's `1 * a`, and to prove
that this is equal to `a` you need to use induction somewhere.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.pow_one.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Power/L03pow_one.lean#L18)

<a id="mynat-pow-pow"></a>

#### pow_pow

Source declaration: `theorem`. Exercise result: `Power/8`.

```lean
pow_pow (a m n : ℕ) : (a ^ m) ^ n = a ^ (m * n)
```

`pow_pow a m n` is a proof that $(a^m)^n=a^{mn}.$

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.pow_pow.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Power/L08pow_pow.lean#L20)

<a id="mynat-pow-succ"></a>

#### pow_succ

Source declaration: `axiom`. Supplied fact.

```lean
pow_succ (m n : ℕ) : m ^ MyNat.succ n = m ^ n * m
```

`pow_succ a b : a ^ (succ b) = a ^ b * a` is one of the
two axioms defining exponentiation in this game.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.pow_succ.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/Power.lean#L19)

<a id="mynat-pow-two"></a>

#### pow_two

Source declaration: `theorem`. Exercise result: `Power/5`.

```lean
pow_two (a : ℕ) : a ^ 2 = a * a
```

`pow_two a` says that `a ^ 2 = a * a`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.pow_two.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Power/L05pow_two.lean#L15)

<a id="mynat-pow-zero"></a>

#### pow_zero

Source declaration: `axiom`. Supplied fact.

```lean
pow_zero (m : ℕ) : m ^ 0 = 1
```

`pow_zero a : a ^ 0 = 1` is one of the two axioms
defining exponentiation in this game.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.pow_zero.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/MyNat/Power.lean#L16)

<a id="mynat-zero-pow-succ"></a>

#### zero_pow_succ

Source declaration: `theorem`. Exercise result: `Power/2`.

```lean
zero_pow_succ (m : ℕ) : 0 ^ MyNat.succ m = 0
```

Although $0^0=1$ in this game, $0^n=0$ if $n>0$, i.e., if
$n$ is a successor.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.zero_pow_succ.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Power/L02zero_pow_succ.lean#L26)

<a id="mynat-zero-pow-zero"></a>

#### zero_pow_zero

Source declaration: `theorem`. Exercise result: `Power/1`.

```lean
zero_pow_zero : 0 ^ 0 = 1
```

Mathematicians sometimes argue that `0 ^ 0 = 0` is also
a good convention. But it is not a good convention in this
game; all the later levels come out beautifully with the
convention that `0 ^ 0 = 1`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.zero_pow_zero.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Power/L01zero_pow_zero.lean#L50)

### Order

<a id="mynat-eq-succ-of-ne-zero"></a>

#### eq_succ_of_ne_zero

Source declaration: `theorem`. Exercise result: `AdvMultiplication/3`.

```lean
eq_succ_of_ne_zero (a : ℕ) (ha : a ≠ 0) : ∃ n, a = MyNat.succ n
```

`eq_succ_of_ne_zero a` is a proof that `a ≠ 0 → ∃ n, a = succ n`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.eq_succ_of_ne_zero.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L03eq_succ_of_ne_zero.lean#L73)

<a id="mynat-le-antisymm"></a>

#### le_antisymm

Source declaration: `theorem`. Exercise result: `LessOrEqual/6`.

```lean
le_antisymm (x y : ℕ) (hxy : x ≤ y) (hyx : y ≤ x) : x = y
```

`le_antisymm x y` is a proof that if `x ≤ y` and `y ≤ x` then `x = y`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.le_antisymm.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L06le_antisymm.lean#L19)

<a id="mynat-le-mul-right"></a>

#### le_mul_right

Source declaration: `theorem`. Exercise result: `AdvMultiplication/5`.

```lean
le_mul_right (a b : ℕ) (h : a * b ≠ 0) : a ≤ a * b
```

`le_mul_right a b` is a proof that `a * b ≠ 0 → a ≤ a * b`.

It's one way of saying that a divisor of a positive number
has to be at most that number.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.le_mul_right.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L05le_mul_right.lean#L30)

<a id="mynat-le-one"></a>

#### le_one

Source declaration: `theorem`. Exercise result: `LessOrEqual/10`.

```lean
le_one (x : ℕ) (hx : x ≤ 1) : x = 0 ∨ x = 1
```

`le_one x` is a proof that if `x ≤ 1` then `x = 0` or `x = 1`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.le_one.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L10le_one.lean#L19)

<a id="mynat-le-refl"></a>

#### le_refl

Source declaration: `theorem`. Exercise result: `LessOrEqual/1`.

```lean
le_refl (x : ℕ) : x ≤ x
```

`le_refl x` is a proof of `x ≤ x`.

The reason for the name is that this lemma is "reflexivity of $\le$"

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.le_refl.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L01le_refl.lean#L66)

<a id="mynat-le-succ-self"></a>

#### le_succ_self

Source declaration: `theorem`. Exercise result: `LessOrEqual/3`.

```lean
le_succ_self (x : ℕ) : x ≤ MyNat.succ x
```

`le_succ_self x` is a proof that `x ≤ succ x`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.le_succ_self.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L03le_succ_self.lean#L16)

<a id="mynat-le-total"></a>

#### le_total

Source declaration: `theorem`. Exercise result: `LessOrEqual/8`.

```lean
le_total (x y : ℕ) : x ≤ y ∨ y ≤ x
```

`le_total x y` is a proof that `x ≤ y` or `y ≤ x`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.le_total.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L08le_total.lean#L23)

<a id="mynat-le-trans"></a>

#### le_trans

Source declaration: `theorem`. Exercise result: `LessOrEqual/4`.

```lean
le_trans (x y z : ℕ) (hxy : x ≤ y) (hyz : y ≤ z) : x ≤ z
```

`le_trans x y z` is a proof that if `x ≤ y` and `y ≤ z` then `x ≤ z`.
More precisely, it is a proof that `x ≤ y → (y ≤ z → x ≤ z)`. In words,
If $x \le y$ then (pause) if $y \le z$ then $x \le z$.

###### A note on associativity

In Lean, `a + b + c` means `(a + b) + c`, because `+` is left associative. However
`→` is right associative. This means that `x ≤ y → y ≤ z → x ≤ z` in Lean means
exactly that `≤` is transitive. This is different to how mathematicians use
$P \implies Q \implies R$; for them, this usually means that $P \implies Q$
and $Q \implies R$.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.le_trans.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L04le_trans.lean#L32)

<a id="mynat-le-two"></a>

#### le_two

Source declaration: `theorem`. Exercise result: `LessOrEqual/11`.

```lean
le_two (x : ℕ) (hx : x ≤ 2) : x = 0 ∨ x = 1 ∨ x = 2
```

`le_two x` is a proof that if `x ≤ 2` then `x = 0` or `x = 1` or `x = 2`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.le_two.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L11le_two.lean#L22)

<a id="mynat-le-zero"></a>

#### le_zero

Source declaration: `theorem`. Exercise result: `LessOrEqual/5`.

```lean
le_zero (x : ℕ) (hx : x ≤ 0) : x = 0
```

`le_zero x` is a proof of `x ≤ 0 → x = 0`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.le_zero.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L05le_zero.lean#L24)

<a id="mynat-one-le-of-ne-zero"></a>

#### one_le_of_ne_zero

Source declaration: `theorem`. Exercise result: `AdvMultiplication/4`.

```lean
one_le_of_ne_zero (a : ℕ) (ha : a ≠ 0) : 1 ≤ a
```

`one_le_of_ne_zero a` is a proof that `a ≠ 0 → 1 ≤ a`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.one_le_of_ne_zero.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L04one_le_of_ne_zero.lean#L18)

<a id="mynat-succ-le-succ"></a>

#### succ_le_succ

Source declaration: `theorem`. Exercise result: `LessOrEqual/9`.

```lean
succ_le_succ (x y : ℕ) (hx : MyNat.succ x ≤ MyNat.succ y) : x ≤ y
```

`succ_le_succ x y` is a proof that if `succ x ≤ succ y` then `x ≤ y`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.succ_le_succ.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L09succ_le_succ.lean#L21)

<a id="mynat-zero-le"></a>

#### zero_le

Source declaration: `theorem`. Exercise result: `LessOrEqual/2`.

```lean
zero_le (x : ℕ) : 0 ≤ x
```

`zero_le x` is a proof that `0 ≤ x`.

[Live card](https://adam.math.hhu.de/data/g/leanprover-community/nng4/doc__Theorem__MyNat.zero_le.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L02zero_le.lean#L18)
