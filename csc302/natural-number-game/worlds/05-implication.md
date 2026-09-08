# Implication World

World ID: `Implication` · Levels: 11 · Prerequisites: Addition.

[Index](../README.md) · [Mathematical reference](../reference.md)

## World introduction

We've proved that $2+2=4$; in Implication World we'll learn
how to prove $2+2\neq 5$.

In Addition World we proved *equalities* like $x + y = y + x$.
In this second tutorial world we'll learn some new tactics,
enabling us to prove *implications*
like $x+1=4 \implies x=3.$

We'll also learn two new fundamental facts about
natural numbers, which Peano introduced as axioms.

Click on "Start" to proceed.

<a id="level-1"></a>

## Level 1: The `exact` tactic

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Implication/level/1) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Implication__1.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Implication/L01exact.lean#L51)

### Original instructions

In this world we'll learn how to prove theorems of the form $P\implies Q$.
In other words, how to prove theorems of the form "if $P$ is true, then $Q$ is true."
To do that we need to learn some more tactics.

The `exact` tactic can be used to close a goal which is exactly one of
the hypotheses. It takes the name of the hypothesis as argument: `exact h`.

### Exercise

Assuming $x+y=37$ and $3x+z=42$, we have $x+y=37$.

```lean
example (x y z : ℕ) (h1 : x + y = 37) (h2 : 3 * x + z = 42) : x + y = 37
```

**Available tactics:** `exact`, `induction`, `rfl`, `rw`.

**New tactics:** `exact`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add)

</details>

<a id="level-2"></a>

## Level 2: `exact` practice.

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Implication/level/2) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Implication__2.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Implication/L02exact2.lean#L13)

### Original instructions

If the goal is not *exactly* a hypothesis, we can sometimes
use rewrites to fix things up.

### Exercise

Assuming $0+x=(0+y)+2$, we have $x=y+2$.

```lean
example (x y : ℕ) (h : 0 + x = 0 + y + 2) : x = y + 2
```

**Available tactics:** `exact`, `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add)

</details>

<a id="level-3"></a>

## Level 3: The `apply` tactic.

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Implication/level/3) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Implication__3.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Implication/L03apply.lean#L50)

### Original instructions

In this level, the hypotheses `h2` is an *implication*. It says
that *if* `x = 37` *then* `y = 42`. We can use this
hypothesis with the `apply` tactic. Remember you can click on
`apply` or any other tactic on the right to see a detailed explanation
of what it does, with examples.

### Exercise

If $x=37$ and we know that $x=37\implies y=42$ then we can deduce $y=42$.

```lean
example (x y : ℕ) (h1 : x = 37) (h2 : x = 37 → y = 42) : y = 42
```

**Available tactics:** `apply`, `exact`, `induction`, `rfl`, `rw`.

**New tactics:** `apply`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add)

</details>

<a id="level-4"></a>

## Level 4: succ_inj : the successor function is injective

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Implication/level/4) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Implication__4.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Implication/L04succ_inj.lean#L53)

### Original instructions

If `a` and `b` are numbers, then `succ_inj a b` is a proof
that `succ a = succ b` implies `a = b`. Click on this theorem in the *Peano*
tab for more information.

Peano had this theorem as an axiom, but in Algorithm World
we will show how to prove it in Lean. Right now let's just assume it,
and let's prove $x+1=4 \implies x=3$ using it. Again, we will proceed
by manipulating our hypothesis until it becomes the goal. I will
walk you through this level.

### Exercise

If $x+1=4$ then $x=3$.

```lean
example (x : ℕ) (h : x + 1 = 4) : x = 3
```

**Available tactics:** `apply`, `exact`, `induction`, `rfl`, `rw`.

**New supplied facts:** `succ_inj`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add)

</details>

<a id="level-5"></a>

## Level 5: Arguing backwards

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Implication/level/5) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Implication__5.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Implication/L05succ_inj2.lean#L22)

### Original instructions

In the last level, we manipulated the hypothesis `x + 1 = 4`
  until it became the goal `x = 3`. In this level we'll manipulate
  the goal until it becomes our hypothesis! In other words, we
  will "argue backwards". The `apply` tactic can do this too.
  Again I will walk you through this one (assuming you're in
  command line mode).

### Exercise

If $x+1=4$ then $x=3$.

```lean
example (x : ℕ) (h : x + 1 = 4) : x = 3
```

**Available tactics:** `apply`, `exact`, `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add)

</details>

<a id="level-6"></a>

## Level 6: intro

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Implication/level/6) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Implication__6.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Implication/L06intro.lean#L35)

### Original instructions

We have seen how to `apply` theorems and assumptions
of the form `P → Q`. But what if our *goal* is of the form `P → Q`?
To prove this goal, we need to know how to say "let's assume `P` and deduce `Q`"
in Lean. We do this with the `intro` tactic.

### Exercise

$x=37\implies x=37$.

```lean
example (x : ℕ) : x = 37 → x = 37
```

**Available tactics:** `apply`, `exact`, `induction`, `intro`, `rfl`, `rw`.

**New tactics:** `intro`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add)

</details>

<a id="level-7"></a>

## Level 7: intro practice

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Implication/level/7) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Implication__7.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Implication/L07intro2.lean#L15)

### Original instructions

Let's see if you can use the tactics we've learnt to prove $x+1=y+1\implies x=y$.
Try this one by yourself; if you need help then click on "Show more help!".

### Exercise

$x+1=y+1 \implies x=y$.

```lean
example (x y : ℕ) : x + 1 = y + 1 → x = y
```

**Available tactics:** `apply`, `exact`, `induction`, `intro`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add)

</details>

<a id="level-8"></a>

## Level 8: ≠

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Implication/level/8) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Implication__8.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Implication/L08ne.lean#L28)

### Original instructions

We still can't prove `2 + 2 ≠ 5` because we have not talked about the
definition of `≠`. In Lean, `a ≠ b` is *notation* for `a = b → False`.
Here `False` is a generic false proposition, and `→` is Lean's notation
for "implies". In logic we learn
that `True → False` is false, but `False → False` is true. Hence
`X → False` is the logical opposite of `X`.

Even though `a ≠ b` does not look like an implication,
you should treat it as an implication. The next two levels will show you how.

`False` is a goal which you cannot deduce from a consistent set of assumptions!
So if your goal is `False` then you had better hope that your hypotheses
are contradictory, which they are in this level.

### Exercise

If $x=y$ and $x \neq y$ then we can deduce a contradiction.

```lean
example (x y : ℕ) (h1 : x = y) (h2 : x ≠ y) : False
```

**Available tactics:** `apply`, `exact`, `induction`, `intro`, `rfl`, `rw`.

**New definitions:** `Ne`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add)

</details>

<a id="level-9"></a>

## Level 9: zero_ne_succ

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Implication/level/9) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Implication__9.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Implication/L09zero_ne_succ.lean#L33)

### Original instructions

As warm-up for `2 + 2 ≠ 5` let's prove `0 ≠ 1`. To do this we need to
introduce Peano's last axiom `zero_ne_succ n`, a proof that `0 ≠ succ n`.
To learn about this result, click on it in the list of lemmas on the right.

### Exercise

$0\neq1$.

```lean
theorem zero_ne_one : (0 : ℕ) ≠ 1
```

**Available tactics:** `apply`, `exact`, `induction`, `intro`, `rfl`, `rw`.

**New supplied facts:** `zero_ne_succ`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-10"></a>

## Level 10: 1 ≠ 0

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Implication/level/10) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Implication__10.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Implication/L10one_ne_zero.lean#L43)

### Original instructions

We know `zero_ne_succ n` is a proof of `0 = succ n → False` -- but what
if we have a hypothesis `succ n = 0`? It's the wrong way around!

The `symm` tactic changes a goal `x = y` to `y = x`, and a goal `x ≠ y`
to `y ≠ x`. And `symm at h`
does the same for a hypothesis `h`. We've proved $0 \neq 1$ and called
the proof `zero_ne_one`; now try proving $1 \neq 0$.

### Exercise

$1\neq0$.

```lean
theorem one_ne_zero : (1 : ℕ) ≠ 0
```

**Available tactics:** `apply`, `exact`, `induction`, `intro`, `rfl`, `rw`, `symm`.

**New tactics:** `symm`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-11"></a>

## Level 11: 2 + 2 ≠ 5

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Implication/level/11) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Implication__11.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Implication/L11two_add_two_ne_five.lean#L18)

### Original instructions

2 + 2 ≠ 5 is boring to prove in full, given only the tools we have currently.
To make it a bit less painful, I have unfolded all of the numerals for you.
See if you can use `zero_ne_succ` and `succ_inj` to prove this.

### Exercise

$2+2≠5$.

```lean
example : succ (succ 0) + succ (succ 0) ≠ succ (succ (succ (succ (succ 0))))
```

**Available tactics:** `apply`, `exact`, `induction`, `intro`, `rfl`, `rw`, `symm`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>
