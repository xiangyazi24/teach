# Power World

World ID: `Power` · Levels: 10 · Prerequisites: Multiplication.

[Index](../README.md) · [Mathematical reference](../reference.md)

## World introduction

This world introduces exponentiation. If you want to define `37 ^ n`
then, as always, you will need to know what `37 ^ 0` is, and
what `37 ^ (succ d)` is, given only `37 ^ d`.

You can probably guess the names of the general theorems:

  * `pow_zero (a : ℕ) : a ^ 0 = 1`
  * `pow_succ (a b : ℕ) : a ^ succ b = a ^ b * a`

Using only these, can you get past the final boss level?

The levels in this world were designed by Sian Carey, a UROP student
at Imperial College London, funded by a Mary Lister McCammon Fellowship
in the summer of 2019. Thanks to Sian and also thanks to Imperial
College for funding her.

<a id="level-1"></a>

## Level 1: zero_pow_zero

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Power/level/1) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Power__1.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Power/L01zero_pow_zero.lean#L50)

### Original instructions

Mathematicians sometimes debate what `0 ^ 0` is;
the answer depends, of course, on your definitions. In this
game, `0 ^ 0 = 1`. See if you can prove it.

Check out the *Pow* tab in your list of theorems
to see the new proofs which are available.

### Exercise

$0 ^ 0 = 1$

```lean
theorem zero_pow_zero : (0 : ℕ) ^ 0 = 1
```

**Available tactics:** `induction`, `rfl`, `rw`.

**New supplied facts:** `pow_zero`.

**New definitions:** `Pow`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_mul](../reference.md#mynat-add-mul), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_mul](../reference.md#mynat-one-mul), [pow_zero](../reference.md#mynat-pow-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_mul](../reference.md#mynat-zero-mul)

</details>

<a id="level-2"></a>

## Level 2: zero_pow_succ

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Power/level/2) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Power__2.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Power/L02zero_pow_succ.lean#L26)

### Original instructions

We've just seen that `0 ^ 0 = 1`, but if `n`
is a successor, then `0 ^ n = 0`. We prove that here.

### Exercise

For all numbers $m$, $0 ^{\operatorname{succ} (m)} = 0$.

```lean
theorem zero_pow_succ (m : ℕ) : (0 : ℕ) ^ (succ m) = 0
```

**Available tactics:** `induction`, `rfl`, `rw`.

**New supplied facts:** `pow_succ`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_mul](../reference.md#mynat-add-mul), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_mul](../reference.md#mynat-one-mul), [pow_succ](../reference.md#mynat-pow-succ), [pow_zero](../reference.md#mynat-pow-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_mul](../reference.md#mynat-zero-mul), [zero_pow_zero](../reference.md#mynat-zero-pow-zero)

</details>

<a id="level-3"></a>

## Level 3: pow_one

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Power/level/3) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Power__3.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Power/L03pow_one.lean#L18)

### Original instructions

### Exercise

For all naturals $a$, $a ^ 1 = a$.

```lean
theorem pow_one (a : ℕ) : a ^ 1 = a
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_mul](../reference.md#mynat-add-mul), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_mul](../reference.md#mynat-one-mul), [pow_succ](../reference.md#mynat-pow-succ), [pow_zero](../reference.md#mynat-pow-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_mul](../reference.md#mynat-zero-mul), [zero_pow_succ](../reference.md#mynat-zero-pow-succ), [zero_pow_zero](../reference.md#mynat-zero-pow-zero)

</details>

<a id="level-4"></a>

## Level 4: one_pow

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Power/level/4) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Power__4.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Power/L04one_pow.lean#L13)

### Original instructions

### Exercise

For all naturals $m$, $1 ^ m = 1$.

```lean
theorem one_pow (m : ℕ) : (1 : ℕ) ^ m = 1
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_mul](../reference.md#mynat-add-mul), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_mul](../reference.md#mynat-one-mul), [pow_one](../reference.md#mynat-pow-one), [pow_succ](../reference.md#mynat-pow-succ), [pow_zero](../reference.md#mynat-pow-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_mul](../reference.md#mynat-zero-mul), [zero_pow_succ](../reference.md#mynat-zero-pow-succ), [zero_pow_zero](../reference.md#mynat-zero-pow-zero)

</details>

<a id="level-5"></a>

## Level 5: pow_two

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Power/level/5) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Power__5.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Power/L05pow_two.lean#L15)

### Original instructions

Note: this lemma will be useful for the final boss!

### Exercise

For all naturals $a$, $a ^ 2 = a \times a$.

```lean
theorem pow_two (a : ℕ) : a ^ 2 = a * a
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_mul](../reference.md#mynat-add-mul), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_mul](../reference.md#mynat-one-mul), [one_pow](../reference.md#mynat-one-pow), [pow_one](../reference.md#mynat-pow-one), [pow_succ](../reference.md#mynat-pow-succ), [pow_zero](../reference.md#mynat-pow-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_mul](../reference.md#mynat-zero-mul), [zero_pow_succ](../reference.md#mynat-zero-pow-succ), [zero_pow_zero](../reference.md#mynat-zero-pow-zero)

</details>

<a id="level-6"></a>

## Level 6: pow_add

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Power/level/6) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Power__6.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Power/L06pow_add.lean#L16)

### Original instructions

Let's now begin our approach to the final boss,
by proving some more subtle facts about powers.

### Exercise

For all naturals $a$, $m$, $n$, we have $a^{m + n} = a ^ m  a ^ n$.

```lean
theorem pow_add (a m n : ℕ) : a ^ (m + n) = a ^ m * a ^ n
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_mul](../reference.md#mynat-add-mul), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_mul](../reference.md#mynat-one-mul), [one_pow](../reference.md#mynat-one-pow), [pow_one](../reference.md#mynat-pow-one), [pow_succ](../reference.md#mynat-pow-succ), [pow_two](../reference.md#mynat-pow-two), [pow_zero](../reference.md#mynat-pow-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_mul](../reference.md#mynat-zero-mul), [zero_pow_succ](../reference.md#mynat-zero-pow-succ), [zero_pow_zero](../reference.md#mynat-zero-pow-zero)

</details>

<a id="level-7"></a>

## Level 7: mul_pow

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Power/level/7) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Power__7.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Power/L07mul_pow.lean#L23)

### Original instructions

The music gets ever more dramatic, as we explore
the interplay between exponentiation and multiplication.

If you're having trouble exchanging the right `a * b`
because `rw [mul_comm]` swaps the wrong multiplication,
then read the documentation of `rw` for tips on how to fix this.

### Exercise

For all naturals $a$, $b$, $n$, we have $(ab) ^ n = a ^ nb ^ n$.

```lean
theorem mul_pow (a b n : ℕ) : (a * b) ^ n = a ^ n * b ^ n
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_mul](../reference.md#mynat-add-mul), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_mul](../reference.md#mynat-one-mul), [one_pow](../reference.md#mynat-one-pow), [pow_add](../reference.md#mynat-pow-add), [pow_one](../reference.md#mynat-pow-one), [pow_succ](../reference.md#mynat-pow-succ), [pow_two](../reference.md#mynat-pow-two), [pow_zero](../reference.md#mynat-pow-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_mul](../reference.md#mynat-zero-mul), [zero_pow_succ](../reference.md#mynat-zero-pow-succ), [zero_pow_zero](../reference.md#mynat-zero-pow-zero)

</details>

<a id="level-8"></a>

## Level 8: pow_pow

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Power/level/8) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Power__8.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Power/L08pow_pow.lean#L20)

### Original instructions

One of the best named levels in the game, a savage `pow_pow`
sub-boss appears as the music reaches a frenzy. What
else could there be to prove about powers after this?

### Exercise

For all naturals $a$, $m$, $n$, we have $(a ^ m) ^ n = a ^ {mn}$.

```lean
theorem pow_pow (a m n : ℕ) : (a ^ m) ^ n = a ^ (m * n)
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_mul](../reference.md#mynat-add-mul), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_one](../reference.md#mynat-mul-one), [mul_pow](../reference.md#mynat-mul-pow), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_mul](../reference.md#mynat-one-mul), [one_pow](../reference.md#mynat-one-pow), [pow_add](../reference.md#mynat-pow-add), [pow_one](../reference.md#mynat-pow-one), [pow_succ](../reference.md#mynat-pow-succ), [pow_two](../reference.md#mynat-pow-two), [pow_zero](../reference.md#mynat-pow-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_mul](../reference.md#mynat-zero-mul), [zero_pow_succ](../reference.md#mynat-zero-pow-succ), [zero_pow_zero](../reference.md#mynat-zero-pow-zero)

</details>

<a id="level-9"></a>

## Level 9: add_sq

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Power/level/9) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Power__9.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Power/L09add_sq.lean#L21)

### Original instructions

[final boss music]

### Exercise

For all numbers $a$ and $b$, we have
$$(a+b)^2=a^2+b^2+2ab.$$

```lean
theorem add_sq (a b : ℕ) : (a + b) ^ 2 = a ^ 2 + b ^ 2 + 2 * a * b
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_mul](../reference.md#mynat-add-mul), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_one](../reference.md#mynat-mul-one), [mul_pow](../reference.md#mynat-mul-pow), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_mul](../reference.md#mynat-one-mul), [one_pow](../reference.md#mynat-one-pow), [pow_add](../reference.md#mynat-pow-add), [pow_one](../reference.md#mynat-pow-one), [pow_pow](../reference.md#mynat-pow-pow), [pow_succ](../reference.md#mynat-pow-succ), [pow_two](../reference.md#mynat-pow-two), [pow_zero](../reference.md#mynat-pow-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_mul](../reference.md#mynat-zero-mul), [zero_pow_succ](../reference.md#mynat-zero-pow-succ), [zero_pow_zero](../reference.md#mynat-zero-pow-zero)

</details>

<a id="level-10"></a>

## Level 10: Fermat's Last Theorem

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Power/level/10) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Power__10.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Power/L10FLT.lean#L46)

**Instructor note: exhibition level.** The upstream source uses the hidden `xyzzy` placeholder to finish this level. It does not contain a genuine proof of Fermat's Last Theorem. Keep this as a discussion or closing slide, rather than a routine proof assignment.

### Original instructions

We now have enough to state a mathematically accurate, but slightly
clunky, version of Fermat's Last Theorem.

Fermat's Last Theorem states that if $x,y,z>0$ and $m \geq 3$ then $x^m+y^m\not =z^m$.
If you didn't do inequality world yet then we can't talk about $m \geq 3$,
so we have to resort to the hack of using `n + 3` for `m`,
which guarantees it's big enough. Similarly instead of `x > 0` we
use `a + 1`.

This level looks superficially like other levels we have seen,
but the shortest solution known to humans would translate into
many millions of lines of Lean code. The author of this game,
Kevin Buzzard, is working on translating the proof by Wiles
and Taylor into Lean, although this task will take many years.

##### CONGRATULATIONS!

You've finished the main quest of the natural number game!
If you would like to learn more about how to use Lean to
prove theorems in mathematics, then take a look
at [Mathematics In Lean](https://leanprover-community.github.io/mathematics_in_lean/),
an interactive textbook which you can read in your browser,
and which explains how to work with many more mathematical concepts in Lean.

### Exercise

For all naturals $a$ $b$ $c$ and $n$, we have
$$(a+1)^{n+3}+(b+1)^{n+3}\not=(c+1)^{n+3}.$$

```lean
example (a b c n : ℕ) : (a + 1) ^ (n + 3) + (b + 1) ^ (n + 3) ≠ (c + 1) ^ (n + 3)
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_mul](../reference.md#mynat-add-mul), [add_right_comm](../reference.md#mynat-add-right-comm), [add_sq](../reference.md#mynat-add-sq), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [mul_add](../reference.md#mynat-mul-add), [mul_assoc](../reference.md#mynat-mul-assoc), [mul_comm](../reference.md#mynat-mul-comm), [mul_one](../reference.md#mynat-mul-one), [mul_pow](../reference.md#mynat-mul-pow), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_mul](../reference.md#mynat-one-mul), [one_pow](../reference.md#mynat-one-pow), [pow_add](../reference.md#mynat-pow-add), [pow_one](../reference.md#mynat-pow-one), [pow_pow](../reference.md#mynat-pow-pow), [pow_succ](../reference.md#mynat-pow-succ), [pow_two](../reference.md#mynat-pow-two), [pow_zero](../reference.md#mynat-pow-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_mul](../reference.md#mynat-zero-mul), [zero_pow_succ](../reference.md#mynat-zero-pow-succ), [zero_pow_zero](../reference.md#mynat-zero-pow-zero)

</details>
