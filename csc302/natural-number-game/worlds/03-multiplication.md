# Multiplication World

World ID: `Multiplication` · Levels: 9 · Prerequisites: Addition.

[Index](../README.md) · [Mathematical reference](../reference.md)

## World introduction

How should we define `37 * x`? Just like addition, we need to give definitions
when $x=0$ and when $x$ is a successor.

The zero case is easy: we define `37 * 0` to be `0`. Now say we know
`37 * d`. What should `37 * succ d` be? Well, that's $(d+1)$ $37$s,
so it should be `37 * d + 37`.

Here are the definitions in Lean.

  * `mul_zero a : a * 0 = 0`
  * `mul_succ a d : a * succ d = a * d + a`

In this world, we must not only prove facts about multiplication like `a * b = b * a`,
we must also prove facts about how multiplication interacts with addition, like `a * (b + c) = a * b + a * c`.
Let's get started.

<a id="level-1"></a>

## Level 1: mul_one

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Multiplication/level/1) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Multiplication__1.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Multiplication/L01mul_one.lean#L49)

### Original instructions

See the new "*" tab in your lemmas, containing `mul_zero` and `mul_succ`.
Right now these are the only facts we know about multiplication.
Let's prove nine more.

Let's start with a warm-up: no induction needed for this one,
because we know `1` is a successor.

### Exercise

For any natural number $m$, we have $ m \times 1 = m$.

```lean
theorem mul_one (m : ℕ) : m * 1 = m
```

**Available tactics:** `induction`, `rfl`, `rw`.

**New supplied facts:** `mul_succ`, `mul_zero`.

**New definitions:** `Mul`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add)

</details>

<a id="level-2"></a>

## Level 2: zero_mul

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Multiplication/level/2) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Multiplication__2.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Multiplication/L02zero_mul.lean#L26)

### Original instructions

Our first challenge is `mul_comm x y : x * y = y * x`,
and we want to prove it by induction. The zero
case will need `mul_zero` (which we have)
and `zero_mul` (which we don't), so let's
start with this.

### Exercise

For all natural numbers $m$, we have $ 0 \times m = 0$.

```lean
theorem zero_mul (m : ℕ) : 0 * m = 0
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add)

</details>

<a id="level-3"></a>

## Level 3: succ_mul

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Multiplication/level/3) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Multiplication__3.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Multiplication/L03succ_mul.lean#L32)

### Original instructions

Similarly we have `mul_succ`
but we're going to need `succ_mul` (guess what it says -- maybe you
are getting the hang of Lean's naming conventions).

The last level from addition world might help you in this level.
If you can't remember what it is, you can go back to the
home screen by clicking the house icon and then taking a look.
You won't lose any progress.

### Exercise

For all natural numbers $a$ and $b$, we have
$(\operatorname{succ}\ a) \times b = a\times b + b$.

```lean
theorem succ_mul (a b : ℕ) : succ a * b = a * b + b
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_mul](../reference.md#mynat-zero-mul)

</details>

<a id="level-4"></a>

## Level 4: mul_comm

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Multiplication/level/4) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Multiplication__4.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Multiplication/L04mul_comm.lean#L27)

### Original instructions

The first sub-boss of Multiplication World is `mul_comm x y : x * y = y * x`.

When you've proved this theorem we will have "spare" proofs
such as `zero_mul`, which is now easily deducible from `mul_zero`.
But we'll keep hold of these proofs anyway, because it's convenient
to have exactly the right tool for a job.

### Exercise

Multiplication is commutative.

```lean
theorem mul_comm (a b : ℕ) : a * b = b * a
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_mul](../reference.md#mynat-zero-mul)

</details>

<a id="level-5"></a>

## Level 5: one_mul

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Multiplication/level/5) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Multiplication__5.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Multiplication/L05one_mul.lean#L20)

### Original instructions

You can prove $1\times m=m$ in at least three ways.
Either by induction, or by using `succ_mul`, or
by using commutativity. Which do you think is quickest?

### Exercise

For any natural number $m$, we have $ 1 \times m = m$.

```lean
theorem one_mul (m : ℕ): 1 * m = m
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [mul_comm](../reference.md#mynat-mul-comm), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_mul](../reference.md#mynat-zero-mul)

</details>

<a id="level-6"></a>

## Level 6: two_mul

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Multiplication/level/6) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Multiplication__6.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Multiplication/L06two_mul.lean#L21)

### Original instructions

This level is more important than you think; it plays
a useful role when battling a big boss later on.

### Exercise

For any natural number $m$, we have $ 2 \times m = m+m$.

```lean
theorem two_mul (m : ℕ): 2 * m = m + m
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [mul_comm](../reference.md#mynat-mul-comm), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_mul](../reference.md#mynat-one-mul), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_mul](../reference.md#mynat-zero-mul)

</details>

<a id="level-7"></a>

## Level 7: mul_add

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Multiplication/level/7) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Multiplication__7.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Multiplication/L07mul_add.lean#L31)

### Original instructions

Our next goal is "left and right distributivity",
meaning $a(b+c)=ab+ac$ and $(b+c)a=ba+ca$. Rather than
these slightly pompous names, the name of the proofs
in Lean are descriptive. Let's start with
`mul_add a b c`, the proof of `a * (b + c) = a * b + a * c`.
Note that the left hand side contains a multiplication
and then an addition.

### Exercise

Multiplication is distributive over addition on the left.
In other words, for all natural numbers $a$, $b$ and $c$, we have
$a(b + c) = ab + ac$.

```lean
theorem mul_add (a b c : ℕ) : a * (b + c) = a * b + a * c
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [mul_comm](../reference.md#mynat-mul-comm), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_mul](../reference.md#mynat-one-mul), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_mul](../reference.md#mynat-zero-mul)

</details>

<a id="level-8"></a>

## Level 8: add_mul

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Multiplication/level/8) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Multiplication__8.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Multiplication/L08add_mul.lean#L23)

### Original instructions

`add_mul` is just as fiddly to prove by induction; but there's a trick
which avoids it. Can you spot it?

### Exercise

Addition is distributive over multiplication.
In other words, for all natural numbers $a$, $b$ and $c$, we have
$(a + b) \times c = ac + bc$.

```lean
theorem add_mul (a b c : ℕ) : (a + b) * c = a * c + b * c
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [mul_add](../reference.md#mynat-mul-add), [mul_comm](../reference.md#mynat-mul-comm), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_mul](../reference.md#mynat-one-mul), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_mul](../reference.md#mynat-zero-mul)

</details>

<a id="level-9"></a>

## Level 9: mul_assoc

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Multiplication/level/9) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Multiplication__9.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Multiplication/L09mul_assoc.lean#L30)

### Original instructions

We now have enough to prove that multiplication is associative,
the boss level of multiplication world. Good luck!

### Exercise

Multiplication is associative.
In other words, for all natural numbers $a$, $b$ and $c$, we have
$(ab)c = a(bc)$.

```lean
theorem mul_assoc (a b c : ℕ) : (a * b) * c = a * (b * c)
```

**Available tactics:** `induction`, `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_mul](../reference.md#mynat-add-mul), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [mul_add](../reference.md#mynat-mul-add), [mul_comm](../reference.md#mynat-mul-comm), [mul_one](../reference.md#mynat-mul-one), [mul_succ](../reference.md#mynat-mul-succ), [mul_zero](../reference.md#mynat-mul-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_mul](../reference.md#mynat-one-mul), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_mul](../reference.md#mynat-succ-mul), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [two_mul](../reference.md#mynat-two-mul), [zero_add](../reference.md#mynat-zero-add), [zero_mul](../reference.md#mynat-zero-mul)

</details>
