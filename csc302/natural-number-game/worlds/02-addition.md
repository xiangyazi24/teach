# Addition World

World ID: `Addition` · Levels: 5 · Prerequisites: Tutorial.

[Index](../README.md) · [Mathematical reference](../reference.md)

## World introduction

Welcome to Addition World! In this world we'll learn the `induction` tactic.
This will enable us to defeat the boss level of this world, namely `x + y = y + x`.

The tactics `rw`, `rfl` and `induction` are the only tactics you'll need to
beat all the levels in Addition World, Multiplication World, and Power World.
Power World contains the final boss of the game.

There are plenty more tactics in this game, but you'll only need to know them if you
want to explore the game further (for example if you decide to 100%
the game).

<a id="level-1"></a>

## Level 1: zero_add

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Addition/level/1) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Addition__1.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Addition/L01zero_add.lean#L45)

### Original instructions

In this level we're going to prove that $0+n=n$, where $n$ is a secret natural number.

Wait, don't we already know that? No! We know that $n+0=n$, but that's `add_zero`.
This is `zero_add`, which is different.

The difficulty with proving `0 + n = n` is that we do not have a *formula* for
`0 + n` in general, we can only use `add_zero` and `add_succ` once
we know whether `n` is `0` or a successor. The `induction` tactic splits into these two cases.

The base case will require us to prove `0 + 0 = 0`, and the inductive step
will ask us to show that if `0 + d = d` then `0 + succ d = succ d`. Because
`0` and successor are the only way to make numbers, this will cover all the cases.

See if you can do your first induction proof in Lean.

(By the way, if you are still in the "Editor mode" from the last world, you can swap
back to "Typewriter mode" by clicking the `>_` button in the top right.)

### Exercise

For all natural numbers $n$, we have $0 + n = n$.

```lean
theorem zero_add (n : ℕ) : 0 + n = n
```

**Available tactics:** `induction`, `rfl`, `rw`.

**New tactics:** `induction`.

<details>
<summary>Available facts at this level</summary>

[add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one)

</details>

<a id="level-2"></a>

## Level 2: succ_add

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Addition/level/2) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Addition__2.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Addition/L02succ_add.lean#L28)

### Original instructions

Oh no! On the way to `add_comm`, a wild `succ_add` appears. `succ_add a b`
is the proof that `(succ a) + b = succ (a + b)` for `a` and `b` numbers.
This result is what's standing in the way of `x + y = y + x`. Again
we have the problem that we are adding `b` to things, so we need
to use induction to split into the cases where `b = 0` and `b` is a successor.

### Exercise

For all natural numbers $a, b$, we have
$ \operatorname{succ}(a) + b = \operatorname{succ}(a + b)$.

```lean
theorem succ_add (a b : ℕ) : succ a + b = succ (a + b)
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add)

</details>

<a id="level-3"></a>

## Level 3: add_comm (level boss)

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Addition/level/3) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Addition__3.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Addition/L03add_comm.lean#L24)

### Original instructions

[boss battle music]

Look in your inventory to see the proofs you have available.
These should be enough.

### Exercise

On the set of natural numbers, addition is commutative.
In other words, if `a` and `b` are arbitrary natural numbers, then
$a + b = b + a$.

```lean
theorem add_comm (a b : ℕ) : a + b = b + a
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add)

</details>

<a id="level-4"></a>

## Level 4: add_assoc (associativity of addition)

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Addition/level/4) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Addition__4.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Addition/L04add_assoc.lean#L33)

### Original instructions

We've been adding up two numbers; in this level we will add up three.

  What does $x+y+z$ *mean*? It could either mean $(x+y)+z$, or it
  could mean $x+(y+z)$. In Lean, $x+y+z$ means $(x+y)+z$.

  But why do we care which one it means; $(x+y)+z$ and $x+(y+z)$ are *equal*!

  That's true, but we didn't prove it yet. Let's prove it now by induction.

### Exercise

On the set of natural numbers, addition is associative.
In other words, if $a, b$ and $c$ are arbitrary natural numbers, we have
$ (a + b) + c = a + (b + c). $

```lean
theorem add_assoc (a b c : ℕ) : a + b + c = a + (b + c)
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_comm](../reference.md#mynat-add-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add)

</details>

<a id="level-5"></a>

## Level 5: add_right_comm

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Addition/level/5) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Addition__5.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Addition/L05add_right_comm.lean#L35)

### Original instructions

`add_comm b c` is a proof that `b + c = c + b`. But if your goal
is `a + b + c = a + c + b` then `rw [add_comm b c]` will not
work! Because the goal means `(a + b) + c = (a + c) + b` so there
is no `b + c` term *directly* in the goal.

Use associativity and commutativity to prove `add_right_comm`.
You don't need induction. `add_assoc` moves brackets around,
and `add_comm` moves variables around.

Remember that you can do more targetted rewrites by
adding explicit variables as inputs to theorems. For example `rw [add_comm b]`
will only do rewrites of the form `b + ? = ? + b`, and `rw [add_comm b c]`
will only do rewrites of the form `b + c = c + b`.

### Exercise

If $a, b$ and $c$ are arbitrary natural numbers, we have
$(a + b) + c = (a + c) + b$.

```lean
theorem add_right_comm (a b c : ℕ) : a + b + c = a + c + b
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add)

</details>
