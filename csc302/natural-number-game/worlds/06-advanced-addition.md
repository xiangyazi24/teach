# Advanced Addition World

World ID: `AdvAddition` · Levels: 6 · Prerequisites: Implication.

[Index](../README.md) · [Mathematical reference](../reference.md)

## World introduction

In Advanced Addition World we will prove some basic
addition facts such as $x+y=x\implies y=0$. The theorems
proved in this world will be used to build
a theory of inequalities in `≤` World.

Click on "Start" to proceed.

<a id="level-1"></a>

## Level 1: add_right_cancel

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/AdvAddition/level/1) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__AdvAddition__1.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvAddition/L01add_right_cancel.lean#L22)

### Original instructions

In this world I will mostly leave you on your own.

`add_right_cancel a b n` is the theorem that $a+n=b+n\implies a=b$.

### Exercise

$a+n=b+n\implies a=b$.

```lean
theorem add_right_cancel (a b n : ℕ) : a + n = b + n → a = b
```

**Available tactics:** `apply`, `exact`, `induction`, `intro`, `rfl`, `rw`, `symm`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-2"></a>

## Level 2: add_left_cancel

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/AdvAddition/level/2) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__AdvAddition__2.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvAddition/L02add_left_cancel.lean#L20)

### Original instructions

`add_left_cancel a b n` is the theorem that $n+a=n+b\implies a=b$.
You can prove it by induction on `n` or you can deduce it from `add_right_cancel`.

### Exercise

$n+a=n+b\implies a=b$.

```lean
theorem add_left_cancel (a b n : ℕ) : n + a = n + b → a = b
```

**Available tactics:** `apply`, `exact`, `induction`, `intro`, `rfl`, `rw`, `symm`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-3"></a>

## Level 3: add_left_eq_self

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/AdvAddition/level/3) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__AdvAddition__3.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvAddition/L03add_left_eq_self.lean#L20)

### Original instructions

`add_left_eq_self x y` is the theorem that $x + y = y\implies x=0.$

### Exercise

$x + y = y\implies x=0.$

```lean
theorem add_left_eq_self (x y : ℕ) : x + y = y → x = 0
```

**Available tactics:** `apply`, `exact`, `induction`, `intro`, `rfl`, `rw`, `symm`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-4"></a>

## Level 4: add_right_eq_self

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/AdvAddition/level/4) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__AdvAddition__4.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvAddition/L04add_right_eq_self.lean#L20)

### Original instructions

`add_right_eq_self x y` is the theorem that $x + y = x\implies y=0.$
Two ways to do it spring to mind; I'll mention them when you've solved it.

### Exercise

$x+y=x\implies y=0$.

```lean
theorem add_right_eq_self (x y : ℕ) : x + y = x → y = 0
```

**Available tactics:** `apply`, `exact`, `induction`, `intro`, `rfl`, `rw`, `symm`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-5"></a>

## Level 5: add_right_eq_zero

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/AdvAddition/level/5) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__AdvAddition__5.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvAddition/L05add_right_eq_zero.lean#L78)

### Original instructions

The next result we'll need in `≤` World is that if `a + b = 0` then `a = 0` and `b = 0`.
Let's prove one of these facts in this level, and the other in the next.

##### A new tactic: `cases`

The `cases` tactic will split an object or hypothesis up into the possible ways
that it could have been created.

For example, sometimes you want to deal with the two cases `b = 0` and `b = succ d` separately,
but don't need the inductive hypothesis `hd` that comes with `induction b with d hd`.
In this situation you can use `cases b with d` instead. There are two ways to make
a number: it's either zero or a successor. So you will end up with two goals, one
with `b = 0` and one with `b = succ d`.

Another example: if you have a hypothesis `h : False` then you are done, because a false statement implies
any statement. Here `cases h` will close the goal, because there are *no* ways to
make a proof of `False`! So you will end up with no goals, meaning you have proved everything.

### Exercise

If $a+b=0$ then $a=0$.

```lean
theorem add_right_eq_zero (a b : ℕ) : a + b = 0 → a = 0
```

**Available tactics:** `apply`, `cases`, `exact`, `induction`, `intro`, `rfl`, `rw`, `symm`.

**New tactics:** `cases`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-6"></a>

## Level 6: add_left_eq_zero

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/AdvAddition/level/6) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__AdvAddition__6.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvAddition/L06add_left_eq_zero.lean#L20)

### Original instructions

You can just mimic the previous proof to do this one -- or you can figure out a way
of using it.

### Exercise

If $a+b=0$ then $b=0$.

```lean
theorem add_left_eq_zero (a b : ℕ) : a + b = 0 → b = 0
```

**Available tactics:** `apply`, `cases`, `exact`, `induction`, `intro`, `rfl`, `rw`, `symm`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>
