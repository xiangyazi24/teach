# ≤ World

World ID: `LessOrEqual` · Levels: 11 · Prerequisites: AdvAddition.

[Index](../README.md) · [Mathematical reference](../reference.md)

## World introduction

In this world we define `a ≤ b` and prove standard facts
about it, such as "if `a ≤ b` and `b ≤ c` then `a ≤ c`."

The definition of `a ≤ b` is "there exists a number `c`
such that `b = a + c`. " So we're going to have to learn
a tactic to prove "exists" theorems, and another one
to use "exists" hypotheses.

Click on "Start" to proceed.

<a id="level-1"></a>

## Level 1: The `use` tactic

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/LessOrEqual/level/1) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__LessOrEqual__1.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L01le_refl.lean#L66)

### Original instructions

`a ≤ b` is *notation* for `∃ c, b = a + c`. This "backwards E"
means "there exists". So `a ≤ b` means that there exists
a number `c` such that `b = a + c`. This definition works
because there are no negative numbers in this game.

To *prove* an "exists" statement, use the `use` tactic.
Let's see an example.

### Exercise

If $x$ is a number, then $x \le x$.

```lean
theorem le_refl (x : ℕ) : x ≤ x
```

**Available tactics:** `apply`, `cases`, `exact`, `induction`, `intro`, `rfl`, `rw`, `symm`, `use`.

**New tactics:** `use`.

**New definitions:** `LE`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-2"></a>

## Level 2: 0 ≤ x

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/LessOrEqual/level/2) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__LessOrEqual__2.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L02zero_le.lean#L18)

### Original instructions

To solve this level, you need to `use` a number `c` such that `x = 0 + c`.

### Exercise

If $x$ is a number, then $0 \le x$.

```lean
theorem zero_le (x : ℕ) : 0 ≤ x
```

**Available tactics:** `apply`, `cases`, `exact`, `induction`, `intro`, `rfl`, `rw`, `symm`, `use`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_refl](../reference.md#mynat-le-refl), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-3"></a>

## Level 3: x ≤ succ x

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/LessOrEqual/level/3) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__LessOrEqual__3.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L03le_succ_self.lean#L16)

### Original instructions

If you `use` the wrong number, you get stuck with a goal you can't prove.
What number will you `use` here?

### Exercise

If $x$ is a number, then $x \le \operatorname{succ}(x)$.

```lean
theorem le_succ_self (x : ℕ) : x ≤ succ x
```

**Available tactics:** `apply`, `cases`, `exact`, `induction`, `intro`, `rfl`, `rw`, `symm`, `use`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_refl](../reference.md#mynat-le-refl), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_le](../reference.md#mynat-zero-le), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-4"></a>

## Level 4: x ≤ y and y ≤ z implies x ≤ z

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/LessOrEqual/level/4) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__LessOrEqual__4.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L04le_trans.lean#L32)

### Original instructions

In this level, we see inequalities as *hypotheses*. We have not seen this before.
The `cases` tactic can be used to take `hxy` apart.

### Exercise

If $x \leq y$ and $y \leq z$, then $x \leq z$.

```lean
theorem le_trans (x y z : ℕ) (hxy : x ≤ y) (hyz : y ≤ z) : x ≤ z
```

**Available tactics:** `apply`, `cases`, `exact`, `induction`, `intro`, `rfl`, `rw`, `symm`, `use`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_refl](../reference.md#mynat-le-refl), [le_succ_self](../reference.md#mynat-le-succ-self), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_le](../reference.md#mynat-zero-le), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-5"></a>

## Level 5: x ≤ 0 → x = 0

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/LessOrEqual/level/5) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__LessOrEqual__5.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L05le_zero.lean#L24)

### Original instructions

It's "intuitively obvious" that there are no numbers less than zero,
but to prove it you will need a result which you showed in advanced
addition world.

### Exercise

If $x \leq 0$, then $x=0$.

```lean
theorem le_zero (x : ℕ) (hx : x ≤ 0) : x = 0
```

**Available tactics:** `apply`, `cases`, `exact`, `induction`, `intro`, `rfl`, `rw`, `symm`, `use`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_refl](../reference.md#mynat-le-refl), [le_succ_self](../reference.md#mynat-le-succ-self), [le_trans](../reference.md#mynat-le-trans), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_le](../reference.md#mynat-zero-le), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-6"></a>

## Level 6: x ≤ y and y ≤ x implies x = y

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/LessOrEqual/level/6) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__LessOrEqual__6.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L06le_antisymm.lean#L19)

### Original instructions

This level asks you to prove *antisymmetry* of $\leq$.
In other words, if $x \leq y$ and $y \leq x$ then $x = y$.
It's the trickiest one so far. Good luck!

### Exercise

If $x \leq y$ and $y \leq x$, then $x = y$.

```lean
theorem le_antisymm (x y : ℕ) (hxy : x ≤ y) (hyx : y ≤ x) : x = y
```

**Available tactics:** `apply`, `cases`, `exact`, `induction`, `intro`, `rfl`, `rw`, `symm`, `use`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_refl](../reference.md#mynat-le-refl), [le_succ_self](../reference.md#mynat-le-succ-self), [le_trans](../reference.md#mynat-le-trans), [le_zero](../reference.md#mynat-le-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_le](../reference.md#mynat-zero-le), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-7"></a>

## Level 7: Dealing with `or`

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/LessOrEqual/level/7) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__LessOrEqual__7.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L07or_symm.lean#L60)

### Original instructions

Totality of `≤` is the boss level of this world, and it's coming up next. It says that
if `a` and `b` are naturals then either `a ≤ b` or `b ≤ a`.
But we haven't talked about `or` at all. Here's a run-through.

1) The notation for "or" is `∨`. You won't need to type it, but you can
type it with `\or`.

2) If you have an "or" statement in the *goal*, then two tactics make
progress: `left` and `right`. But don't choose a direction unless your
hypotheses guarantee that it's the correct one.

3) If you have an "or" statement as a *hypothesis* `h`, then
`cases h with h1 h2` will create two goals, one where you went left,
and the other where you went right.

### Exercise

If $x=37$ or $y=42$, then $y=42$ or $x=37$.

```lean
example (x y : ℕ) (h : x = 37 ∨ y = 42) : y = 42 ∨ x = 37
```

**Available tactics:** `apply`, `cases`, `exact`, `induction`, `intro`, `left`, `rfl`, `right`, `rw`, `symm`, `use`.

**New tactics:** `left`, `right`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_antisymm](../reference.md#mynat-le-antisymm), [le_refl](../reference.md#mynat-le-refl), [le_succ_self](../reference.md#mynat-le-succ-self), [le_trans](../reference.md#mynat-le-trans), [le_zero](../reference.md#mynat-le-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_le](../reference.md#mynat-zero-le), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-8"></a>

## Level 8: x ≤ y or y ≤ x

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/LessOrEqual/level/8) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__LessOrEqual__8.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L08le_total.lean#L23)

### Original instructions

This is I think the toughest level yet. Tips: if `a` is a number
then `cases a with b` will split into cases `a = 0` and `a = succ b`.
And don't go left or right until your hypotheses guarantee that
you can prove the resulting goal!

I've left hidden hints; if you need them, retry from the beginning
and click on "Show more help!"

### Exercise

If $x$ and $y$ are numbers, then either $x \leq y$ or $y \leq x$.

```lean
theorem le_total (x y : ℕ) : x ≤ y ∨ y ≤ x
```

**Available tactics:** `apply`, `cases`, `exact`, `induction`, `intro`, `left`, `rfl`, `right`, `rw`, `symm`, `use`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_antisymm](../reference.md#mynat-le-antisymm), [le_refl](../reference.md#mynat-le-refl), [le_succ_self](../reference.md#mynat-le-succ-self), [le_trans](../reference.md#mynat-le-trans), [le_zero](../reference.md#mynat-le-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_le](../reference.md#mynat-zero-le), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-9"></a>

## Level 9: succ x ≤ succ y → x ≤ y

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/LessOrEqual/level/9) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__LessOrEqual__9.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L09succ_le_succ.lean#L21)

### Original instructions

We've proved that `x ≤ 0` implies `x = 0`. The last two levels
in this world will prove which numbers are `≤ 1` and `≤ 2`.
This lemma will be helpful for them.

### Exercise

If $\operatorname{succ}(x) \leq \operatorname{succ}(y)$ then $x \leq y$.

```lean
theorem succ_le_succ (x y : ℕ) (hx : succ x ≤ succ y) : x ≤ y
```

**Available tactics:** `apply`, `cases`, `exact`, `induction`, `intro`, `left`, `rfl`, `right`, `rw`, `symm`, `use`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_antisymm](../reference.md#mynat-le-antisymm), [le_refl](../reference.md#mynat-le-refl), [le_succ_self](../reference.md#mynat-le-succ-self), [le_total](../reference.md#mynat-le-total), [le_trans](../reference.md#mynat-le-trans), [le_zero](../reference.md#mynat-le-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_le](../reference.md#mynat-zero-le), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-10"></a>

## Level 10: x ≤ 1

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/LessOrEqual/level/10) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__LessOrEqual__10.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L10le_one.lean#L19)

### Original instructions

We've seen `le_zero`, the proof that if `x ≤ 0` then `x = 0`.
Now we'll prove that if `x ≤ 1` then `x = 0` or `x = 1`.

### Exercise

If $x \leq 1$ then either $x = 0$ or $x = 1$.

```lean
theorem le_one (x : ℕ) (hx : x ≤ 1) : x = 0 ∨ x = 1
```

**Available tactics:** `apply`, `cases`, `exact`, `induction`, `intro`, `left`, `rfl`, `right`, `rw`, `symm`, `use`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_antisymm](../reference.md#mynat-le-antisymm), [le_refl](../reference.md#mynat-le-refl), [le_succ_self](../reference.md#mynat-le-succ-self), [le_total](../reference.md#mynat-le-total), [le_trans](../reference.md#mynat-le-trans), [le_zero](../reference.md#mynat-le-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [succ_le_succ](../reference.md#mynat-succ-le-succ), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_le](../reference.md#mynat-zero-le), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-11"></a>

## Level 11: le_two

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/LessOrEqual/level/11) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__LessOrEqual__11.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/LessOrEqual/L11le_two.lean#L22)

### Original instructions

We'll need this lemma to prove that two is prime!

You'll need to know that `∨` is right associative. This means that
`x = 0 ∨ x = 1 ∨ x = 2` actually means `x = 0 ∨ (x = 1 ∨ x = 2)`.
This affects how `left` and `right` work.

### Exercise

If $x \leq 2$ then $x = 0$ or $1$ or $2$.

```lean
theorem le_two (x : ℕ) (hx : x ≤ 2) : x = 0 ∨ x = 1 ∨ x = 2
```

**Available tactics:** `apply`, `cases`, `exact`, `induction`, `intro`, `left`, `rfl`, `right`, `rw`, `symm`, `use`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_antisymm](../reference.md#mynat-le-antisymm), [le_one](../reference.md#mynat-le-one), [le_refl](../reference.md#mynat-le-refl), [le_succ_self](../reference.md#mynat-le-succ-self), [le_total](../reference.md#mynat-le-total), [le_trans](../reference.md#mynat-le-trans), [le_zero](../reference.md#mynat-le-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [succ_le_succ](../reference.md#mynat-succ-le-succ), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_le](../reference.md#mynat-zero-le), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>
