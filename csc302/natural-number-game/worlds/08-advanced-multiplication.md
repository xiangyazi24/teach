# Advanced Multiplication World

World ID: `AdvMultiplication` · Levels: 10 · Prerequisites: LessOrEqual, Multiplication.

[Index](../README.md) · [Mathematical reference](../reference.md)

## World introduction

Advanced *Addition* World proved various implications
involving addition, such as `x + y = 0 → x = 0` and `x + y = x → y = 0`.
These lemmas were used to prove basic facts about ≤ in ≤ World.

In Advanced Multiplication World we prove analogous
facts about multiplication, such as `x * y = 1 → x = 1`, and
`x * y = x → y = 1` (assuming `x ≠ 0` in the latter result). This will prepare
us for Divisibility World.

Multiplication World is more complex than Addition World. In the same
way, Advanced Multiplication world is more complex than Advanced Addition
World. One reason for this is that certain intermediate results are only
true under the additional hypothesis that one of the variables is non-zero.
This causes some unexpected extra twists.

<a id="level-1"></a>

## Level 1: mul_le_mul_right

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/AdvMultiplication/level/1) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__AdvMultiplication__1.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L01mul_le_mul_right.lean#L18)

### Original instructions

Let's warm up with an easy one, which works even if `t = 0`.

### Exercise

```lean
theorem mul_le_mul_right (a b t : ℕ) (h : a ≤ b) : a * t ≤ b * t
```

**Available tactics:** `apply`, `cases`, `exact`, `induction`, `intro`, `left`, `rfl`, `right`, `rw`, `symm`, `use`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_mul](../reference.md#mynat-add-mul), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_antisymm](../reference.md#mynat-le-antisymm), [le_one](../reference.md#mynat-le-one), [le_refl](../reference.md#mynat-le-refl), [le_succ_self](../reference.md#mynat-le-succ-self), [le_total](../reference.md#mynat-le-total), [le_trans](../reference.md#mynat-le-trans), [le_two](../reference.md#mynat-le-two), [le_zero](../reference.md#mynat-le-zero), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_mul](../reference.md#mynat-one-mul), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [succ_le_succ](../reference.md#mynat-succ-le-succ), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_le](../reference.md#mynat-zero-le), [zero_mul](../reference.md#mynat-zero-mul), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-2"></a>

## Level 2: mul_left_ne_zero

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/AdvMultiplication/level/2) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__AdvMultiplication__2.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L02mul_left_ne_zero.lean#L18)

### Original instructions

If you have completed Algorithm World then you can use the `contrapose!` tactic
here. If not then I'll talk you through a manual approach.

### Exercise

```lean
theorem mul_left_ne_zero (a b : ℕ) (h : a * b ≠ 0) : b ≠ 0
```

**Available tactics:** `apply`, `cases`, `exact`, `induction`, `intro`, `left`, `rfl`, `right`, `rw`, `symm`, `use`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_mul](../reference.md#mynat-add-mul), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_antisymm](../reference.md#mynat-le-antisymm), [le_one](../reference.md#mynat-le-one), [le_refl](../reference.md#mynat-le-refl), [le_succ_self](../reference.md#mynat-le-succ-self), [le_total](../reference.md#mynat-le-total), [le_trans](../reference.md#mynat-le-trans), [le_two](../reference.md#mynat-le-two), [le_zero](../reference.md#mynat-le-zero), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_le_mul_right](../reference.md#mynat-mul-le-mul-right), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_mul](../reference.md#mynat-one-mul), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [succ_le_succ](../reference.md#mynat-succ-le-succ), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_le](../reference.md#mynat-zero-le), [zero_mul](../reference.md#mynat-zero-mul), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-3"></a>

## Level 3: eq_succ_of_ne_zero

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/AdvMultiplication/level/3) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__AdvMultiplication__3.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L03eq_succ_of_ne_zero.lean#L73)

### Original instructions

Multiplication usually makes a number bigger, but multiplication by zero can make
it smaller. Thus many lemmas about inequalities and multiplication need the
hypothesis `a ≠ 0`. Here is a key lemma that enables us to use this hypothesis.
To help us with the proof, we can use the `tauto` tactic. Click on the tactic's name
on the right to see what it does.

### Exercise

```lean
theorem eq_succ_of_ne_zero (a : ℕ) (ha : a ≠ 0) : ∃ n, a = succ n
```

**Available tactics:** `apply`, `cases`, `exact`, `induction`, `intro`, `left`, `rfl`, `right`, `rw`, `symm`, `tauto`, `use`.

**New tactics:** `tauto`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_mul](../reference.md#mynat-add-mul), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_antisymm](../reference.md#mynat-le-antisymm), [le_one](../reference.md#mynat-le-one), [le_refl](../reference.md#mynat-le-refl), [le_succ_self](../reference.md#mynat-le-succ-self), [le_total](../reference.md#mynat-le-total), [le_trans](../reference.md#mynat-le-trans), [le_two](../reference.md#mynat-le-two), [le_zero](../reference.md#mynat-le-zero), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_le_mul_right](../reference.md#mynat-mul-le-mul-right), [mul_left_ne_zero](../reference.md#mynat-mul-left-ne-zero), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_mul](../reference.md#mynat-one-mul), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [succ_le_succ](../reference.md#mynat-succ-le-succ), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_le](../reference.md#mynat-zero-le), [zero_mul](../reference.md#mynat-zero-mul), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-4"></a>

## Level 4: one_le_of_ne_zero

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/AdvMultiplication/level/4) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__AdvMultiplication__4.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L04one_le_of_ne_zero.lean#L18)

### Original instructions

The previous lemma can be used to prove this one.

### Exercise

```lean
theorem one_le_of_ne_zero (a : ℕ) (ha : a ≠ 0) : 1 ≤ a
```

**Available tactics:** `apply`, `cases`, `exact`, `induction`, `intro`, `left`, `rfl`, `right`, `rw`, `symm`, `tauto`, `use`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_mul](../reference.md#mynat-add-mul), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [eq_succ_of_ne_zero](../reference.md#mynat-eq-succ-of-ne-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_antisymm](../reference.md#mynat-le-antisymm), [le_one](../reference.md#mynat-le-one), [le_refl](../reference.md#mynat-le-refl), [le_succ_self](../reference.md#mynat-le-succ-self), [le_total](../reference.md#mynat-le-total), [le_trans](../reference.md#mynat-le-trans), [le_two](../reference.md#mynat-le-two), [le_zero](../reference.md#mynat-le-zero), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_le_mul_right](../reference.md#mynat-mul-le-mul-right), [mul_left_ne_zero](../reference.md#mynat-mul-left-ne-zero), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_mul](../reference.md#mynat-one-mul), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [succ_le_succ](../reference.md#mynat-succ-le-succ), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_le](../reference.md#mynat-zero-le), [zero_mul](../reference.md#mynat-zero-mul), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-5"></a>

## Level 5: le_mul_right

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/AdvMultiplication/level/5) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__AdvMultiplication__5.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L05le_mul_right.lean#L30)

### Original instructions

One day this game will have a Prime Number World, with a final boss
of proving that $2$ is prime.
To do this, we will have to rule out things like $2 = 37 × 42.$
We will do this by proving that any factor of $2$ is at most $2$,
which we will do using this lemma. The proof I have in mind manipulates the hypothesis
until it becomes the goal, using `mul_left_ne_zero`, `one_le_of_ne_zero` and
`mul_le_mul_right`.

### Exercise

```lean
theorem le_mul_right (a b : ℕ) (h : a * b ≠ 0) : a ≤ a * b
```

**Available tactics:** `apply`, `cases`, `exact`, `induction`, `intro`, `left`, `rfl`, `right`, `rw`, `symm`, `tauto`, `use`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_mul](../reference.md#mynat-add-mul), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [eq_succ_of_ne_zero](../reference.md#mynat-eq-succ-of-ne-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_antisymm](../reference.md#mynat-le-antisymm), [le_one](../reference.md#mynat-le-one), [le_refl](../reference.md#mynat-le-refl), [le_succ_self](../reference.md#mynat-le-succ-self), [le_total](../reference.md#mynat-le-total), [le_trans](../reference.md#mynat-le-trans), [le_two](../reference.md#mynat-le-two), [le_zero](../reference.md#mynat-le-zero), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_le_mul_right](../reference.md#mynat-mul-le-mul-right), [mul_left_ne_zero](../reference.md#mynat-mul-left-ne-zero), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_le_of_ne_zero](../reference.md#mynat-one-le-of-ne-zero), [one_mul](../reference.md#mynat-one-mul), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [succ_le_succ](../reference.md#mynat-succ-le-succ), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_le](../reference.md#mynat-zero-le), [zero_mul](../reference.md#mynat-zero-mul), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-6"></a>

## Level 6: mul_right_eq_one

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/AdvMultiplication/level/6) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__AdvMultiplication__6.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L06mul_right_eq_one.lean#L66)

### Original instructions

This level proves `x * y = 1 → x = 1`, the multiplicative analogue of Advanced Addition
World's `x + y = 0 → x = 0`. The strategy is to prove that `x ≤ 1` and then use the
lemma `le_one` from `≤` world.

We'll prove it using a new and very useful tactic called `have`.

### Exercise

```lean
theorem mul_right_eq_one (x y : ℕ) (h : x * y = 1) : x = 1
```

**Available tactics:** `apply`, `cases`, `exact`, `have`, `induction`, `intro`, `left`, `rfl`, `right`, `rw`, `symm`, `tauto`, `use`.

**New tactics:** `have`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_mul](../reference.md#mynat-add-mul), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [eq_succ_of_ne_zero](../reference.md#mynat-eq-succ-of-ne-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_antisymm](../reference.md#mynat-le-antisymm), [le_mul_right](../reference.md#mynat-le-mul-right), [le_one](../reference.md#mynat-le-one), [le_refl](../reference.md#mynat-le-refl), [le_succ_self](../reference.md#mynat-le-succ-self), [le_total](../reference.md#mynat-le-total), [le_trans](../reference.md#mynat-le-trans), [le_two](../reference.md#mynat-le-two), [le_zero](../reference.md#mynat-le-zero), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_le_mul_right](../reference.md#mynat-mul-le-mul-right), [mul_left_ne_zero](../reference.md#mynat-mul-left-ne-zero), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_le_of_ne_zero](../reference.md#mynat-one-le-of-ne-zero), [one_mul](../reference.md#mynat-one-mul), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [succ_le_succ](../reference.md#mynat-succ-le-succ), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_le](../reference.md#mynat-zero-le), [zero_mul](../reference.md#mynat-zero-mul), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-7"></a>

## Level 7: mul_ne_zero

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/AdvMultiplication/level/7) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__AdvMultiplication__7.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L07mul_ne_zero.lean#L21)

### Original instructions

This level proves that if `a ≠ 0` and `b ≠ 0` then `a * b ≠ 0`. One strategy
is to write both `a` and `b` as `succ` of something, deduce that `a * b` is
also `succ` of something, and then `apply zero_ne_succ`.

### Exercise

```lean
theorem mul_ne_zero (a b : ℕ) (ha : a ≠ 0) (hb : b ≠ 0) : a * b ≠ 0
```

**Available tactics:** `apply`, `cases`, `exact`, `have`, `induction`, `intro`, `left`, `rfl`, `right`, `rw`, `symm`, `tauto`, `use`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_mul](../reference.md#mynat-add-mul), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [eq_succ_of_ne_zero](../reference.md#mynat-eq-succ-of-ne-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_antisymm](../reference.md#mynat-le-antisymm), [le_mul_right](../reference.md#mynat-le-mul-right), [le_one](../reference.md#mynat-le-one), [le_refl](../reference.md#mynat-le-refl), [le_succ_self](../reference.md#mynat-le-succ-self), [le_total](../reference.md#mynat-le-total), [le_trans](../reference.md#mynat-le-trans), [le_two](../reference.md#mynat-le-two), [le_zero](../reference.md#mynat-le-zero), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_le_mul_right](../reference.md#mynat-mul-le-mul-right), [mul_left_ne_zero](../reference.md#mynat-mul-left-ne-zero), [mul_one](../reference.md#mynat-mul-one), [mul_right_eq_one](../reference.md#mynat-mul-right-eq-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_le_of_ne_zero](../reference.md#mynat-one-le-of-ne-zero), [one_mul](../reference.md#mynat-one-mul), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [succ_le_succ](../reference.md#mynat-succ-le-succ), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_le](../reference.md#mynat-zero-le), [zero_mul](../reference.md#mynat-zero-mul), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-8"></a>

## Level 8: mul_eq_zero

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/AdvMultiplication/level/8) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__AdvMultiplication__8.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L08mul_eq_zero.lean#L20)

### Original instructions

This level proves that if `a * b = 0` then `a = 0` or `b = 0`. It is
logically equivalent to the last level, so there is a very short proof.

### Exercise

```lean
theorem mul_eq_zero (a b : ℕ) (h : a * b = 0) : a = 0 ∨ b = 0
```

**Available tactics:** `apply`, `cases`, `exact`, `have`, `induction`, `intro`, `left`, `rfl`, `right`, `rw`, `symm`, `tauto`, `use`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_mul](../reference.md#mynat-add-mul), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [eq_succ_of_ne_zero](../reference.md#mynat-eq-succ-of-ne-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_antisymm](../reference.md#mynat-le-antisymm), [le_mul_right](../reference.md#mynat-le-mul-right), [le_one](../reference.md#mynat-le-one), [le_refl](../reference.md#mynat-le-refl), [le_succ_self](../reference.md#mynat-le-succ-self), [le_total](../reference.md#mynat-le-total), [le_trans](../reference.md#mynat-le-trans), [le_two](../reference.md#mynat-le-two), [le_zero](../reference.md#mynat-le-zero), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_le_mul_right](../reference.md#mynat-mul-le-mul-right), [mul_left_ne_zero](../reference.md#mynat-mul-left-ne-zero), [mul_ne_zero](../reference.md#mynat-mul-ne-zero), [mul_one](../reference.md#mynat-mul-one), [mul_right_eq_one](../reference.md#mynat-mul-right-eq-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_le_of_ne_zero](../reference.md#mynat-one-le-of-ne-zero), [one_mul](../reference.md#mynat-one-mul), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [succ_le_succ](../reference.md#mynat-succ-le-succ), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_le](../reference.md#mynat-zero-le), [zero_mul](../reference.md#mynat-zero-mul), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-9"></a>

## Level 9: mul_left_cancel

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/AdvMultiplication/level/9) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__AdvMultiplication__9.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L09mul_left_cancel.lean#L30)

### Original instructions

In this level we prove that if `a * b = a * c` and `a ≠ 0` then `b = c`. It is tricky, for
several reasons. One of these is that
we need to introduce a new idea: we will need to understand the concept of
mathematical induction a little better.

Starting with `induction b with d hd` is too naive, because in the inductive step
the hypothesis is `a * d = a * c → d = c` but what we know is `a * succ d = a * c`,
so the induction hypothesis does not apply!

Assume `a ≠ 0` is fixed. The actual statement we want to prove by induction on `b` is
"for all `c`, if `a * b = a * c` then `b = c`". This *can* be proved by induction,
because we now have the flexibility to change `c`.

### Exercise

```lean
theorem mul_left_cancel (a b c : ℕ) (ha : a ≠ 0) (h : a * b = a * c) : b = c
```

**Available tactics:** `apply`, `cases`, `exact`, `have`, `induction`, `intro`, `left`, `rfl`, `right`, `rw`, `symm`, `tauto`, `use`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_mul](../reference.md#mynat-add-mul), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [eq_succ_of_ne_zero](../reference.md#mynat-eq-succ-of-ne-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_antisymm](../reference.md#mynat-le-antisymm), [le_mul_right](../reference.md#mynat-le-mul-right), [le_one](../reference.md#mynat-le-one), [le_refl](../reference.md#mynat-le-refl), [le_succ_self](../reference.md#mynat-le-succ-self), [le_total](../reference.md#mynat-le-total), [le_trans](../reference.md#mynat-le-trans), [le_two](../reference.md#mynat-le-two), [le_zero](../reference.md#mynat-le-zero), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_eq_zero](../reference.md#mynat-mul-eq-zero), [mul_le_mul_right](../reference.md#mynat-mul-le-mul-right), [mul_left_ne_zero](../reference.md#mynat-mul-left-ne-zero), [mul_ne_zero](../reference.md#mynat-mul-ne-zero), [mul_one](../reference.md#mynat-mul-one), [mul_right_eq_one](../reference.md#mynat-mul-right-eq-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_le_of_ne_zero](../reference.md#mynat-one-le-of-ne-zero), [one_mul](../reference.md#mynat-one-mul), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [succ_le_succ](../reference.md#mynat-succ-le-succ), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_le](../reference.md#mynat-zero-le), [zero_mul](../reference.md#mynat-zero-mul), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-10"></a>

## Level 10: mul_right_eq_self

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/AdvMultiplication/level/10) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__AdvMultiplication__10.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/AdvMultiplication/L10mul_right_eq_self.lean#L19)

### Original instructions

The lemma proved in the final level of this world will be helpful
in Divisibility World.

### Exercise

```lean
theorem mul_right_eq_self (a b : ℕ) (ha : a ≠ 0) (h : a * b = a) : b = 1
```

**Available tactics:** `apply`, `cases`, `exact`, `have`, `induction`, `intro`, `left`, `rfl`, `right`, `rw`, `symm`, `tauto`, `use`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_cancel](../reference.md#mynat-add-left-cancel), [add_left_eq_self](../reference.md#mynat-add-left-eq-self), [add_left_eq_zero](../reference.md#mynat-add-left-eq-zero), [add_mul](../reference.md#mynat-add-mul), [add_right_cancel](../reference.md#mynat-add-right-cancel), [add_right_comm](../reference.md#mynat-add-right-comm), [add_right_eq_self](../reference.md#mynat-add-right-eq-self), [add_right_eq_zero](../reference.md#mynat-add-right-eq-zero), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [eq_succ_of_ne_zero](../reference.md#mynat-eq-succ-of-ne-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [le_antisymm](../reference.md#mynat-le-antisymm), [le_mul_right](../reference.md#mynat-le-mul-right), [le_one](../reference.md#mynat-le-one), [le_refl](../reference.md#mynat-le-refl), [le_succ_self](../reference.md#mynat-le-succ-self), [le_total](../reference.md#mynat-le-total), [le_trans](../reference.md#mynat-le-trans), [le_two](../reference.md#mynat-le-two), [le_zero](../reference.md#mynat-le-zero), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_eq_zero](../reference.md#mynat-mul-eq-zero), [mul_le_mul_right](../reference.md#mynat-mul-le-mul-right), [mul_left_cancel](../reference.md#mynat-mul-left-cancel), [mul_left_ne_zero](../reference.md#mynat-mul-left-ne-zero), [mul_ne_zero](../reference.md#mynat-mul-ne-zero), [mul_one](../reference.md#mynat-mul-one), [mul_right_eq_one](../reference.md#mynat-mul-right-eq-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_le_of_ne_zero](../reference.md#mynat-one-le-of-ne-zero), [one_mul](../reference.md#mynat-one-mul), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [succ_le_succ](../reference.md#mynat-succ-le-succ), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_le](../reference.md#mynat-zero-le), [zero_mul](../reference.md#mynat-zero-mul), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>
