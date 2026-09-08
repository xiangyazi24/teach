# Tutorial World

World ID: `Tutorial` · Levels: 8 · Prerequisites: None.

[Index](../README.md) · [Mathematical reference](../reference.md)

## World introduction

Welcome to tutorial world! In this world we learn the basics
of proving theorems. The boss level of this world
is the theorem `2 + 2 = 4`.

You prove theorems by solving puzzles using tools called *tactics*.
The aim is to prove the theorem by applying tactics
in the right order.

Let's learn some basic tactics. Click on "Start" below
to begin your quest.

<a id="level-1"></a>

## Level 1: The rfl tactic

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Tutorial/level/1) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Tutorial__1.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Tutorial/L01rfl.lean#L71)

### Original instructions

#### Read this first

Each level in this game involves proving a mathematical theorem (the "Goal").
The goal will be a statement about *numbers*. Some numbers in this game have known values.
Those numbers have names like $37$. Other numbers will be secret. They're called things
like $x$ and $q$. We know $x$ is a number, we just don't know which one.

In this first level we're going to prove the theorem that $37x + q = 37x + q$.
You can see `x q : ℕ` in the *Objects* below, which means that `x` and `q`
are numbers.

We solve goals in Lean using *Tactics*, and the first tactic we're
going to learn is called `rfl`, which proves all theorems of the form $X = X$.

Prove that $37x+q=37x+q$ by executing the `rfl` tactic.

### Exercise

If $x$ and $q$ are arbitrary natural numbers, then $37x+q=37x+q.$

```lean
example (x q : ℕ) : 37 * x + q = 37 * x + q
```

**Available tactics:** `rfl`.

**New tactics:** `rfl`.

<details>
<summary>Available facts at this level</summary>

None

</details>

<a id="level-2"></a>

## Level 2: the rw tactic

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Tutorial/level/2) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Tutorial__2.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Tutorial/L02rw.lean#L172)

### Original instructions

In this level the *goal* is $2y=2(x+7)$ but to help us we
have an *assumption* `h` saying that $y = x + 7$. Check that you can see `h` in
your list of assumptions. Lean thinks of `h` as being a secret proof of the
assumption, rather like `x` is a secret number.

Before we can use `rfl`, we have to "substitute in for $y$".
We do this in Lean by *rewriting* the goal with `h`,
using the `rw` tactic.

### Exercise

If $x$ and $y$ are natural numbers, and $y = x + 7$, then $2y = 2(x + 7)$.

```lean
example (x y : ℕ) (h : y = x + 7) : 2 * y = 2 * (x + 7)
```

**Available tactics:** `rfl`, `rw`.

**New tactics:** `rw`.

<details>
<summary>Available facts at this level</summary>

None

</details>

<a id="level-3"></a>

## Level 3: Numbers

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Tutorial/level/3) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Tutorial__3.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Tutorial/L03two_eq_ss0.lean#L68)

### Original instructions

##### The birth of number.

Numbers in Lean are defined by two rules.

* `0` is a number.
* If `n` is a number, then the *successor* `succ n` of `n` is a number.

The successor of `n` means the number after `n`. Let's learn to
count, and name a few small numbers.

##### Counting to four.

`0` is a number, so `succ 0` is a number. Let's call this new number `1`.
Similarly let's define `2 = succ 1`, `3 = succ 2` and `4 = succ 3`.
This gives us plenty of numbers to be getting along with.

The *proof* that `2 = succ 1` is called `two_eq_succ_one`.
Check out the "012" tab in the list of lemmas on the right
for this and other proofs.

Let's prove that $2$ is the number after the number after zero.

### Exercise

$2$ is the number after the number after $0$.

```lean
example : 2 = succ (succ 0)
```

**Available tactics:** `rfl`, `rw`.

**New supplied facts:** `four_eq_succ_three`, `one_eq_succ_zero`, `three_eq_succ_two`, `two_eq_succ_one`.

**New definitions:** `MyNat`.

<details>
<summary>Available facts at this level</summary>

[four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one)

</details>

<a id="level-4"></a>

## Level 4: rewriting backwards

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Tutorial/level/4) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Tutorial__4.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Tutorial/L04rw_backwards.lean#L26)

### Original instructions

If `h` is a proof of `X = Y` then `rw [h]` will
turn `X`s into `Y`s. But what if we want to
turn `Y`s into `X`s? To tell the `rw` tactic
we want this, we use a left arrow `←`. Type
`\l` and then hit the space bar to get this arrow.

Let's prove that $2$ is the number after the number
after $0$ again, this time by changing `succ (succ 0)`
into `2`.

### Exercise

$2$ is the number after the number after $0$.

```lean
example : 2 = succ (succ 0)
```

**Available tactics:** `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one)

</details>

<a id="level-5"></a>

## Level 5: Adding zero

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Tutorial/level/5) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Tutorial__5.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Tutorial/L05add_zero.lean#L96)

### Original instructions

We'd like to prove `2 + 2 = 4` but right now
we can't even *state* it
because we haven't yet defined addition.

##### Defining addition.

How are we going to add $37$ to an arbitrary number $x$? Well,
there are only two ways to make numbers in this game: $0$
and successors. So to define `37 + x` we will need
to know what `37 + 0` is and what `37 + succ x` is.
Let's start with adding `0`.

###### Adding 0

To make addition agree with our intuition, we should *define* `37 + 0`
to be `37`. More generally, we should define `a + 0` to be `a` for
any number `a`. The name of this proof in Lean is `add_zero a`.
For example `add_zero 37` is a proof of `37 + 0 = 37`,
`add_zero x` is a proof of `x + 0 = x`, and `add_zero` is a proof
of `? + 0 = ?`.

We write `add_zero x : x + 0 = x`, so `proof : statement`.

### Exercise

$a+(b+0)+(c+0)=a+b+c.$

```lean
example (a b c : ℕ) : a + (b + 0) + (c + 0) = a + b + c
```

**Available tactics:** `rfl`, `rw`.

**New supplied facts:** `add_zero`.

**New definitions:** `Add`.

<details>
<summary>Available facts at this level</summary>

[add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one)

</details>

<a id="level-6"></a>

## Level 6: Precision rewriting

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Tutorial/level/6) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Tutorial__6.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Tutorial/L06add_zero2.lean#L23)

### Original instructions

##### Precision rewriting

In the last level, there was `b + 0` and `c + 0`,
and `rw [add_zero]` changed the first one it saw,
which was `b + 0`. Let's learn how to tell Lean
to change `c + 0` first by giving `add_zero` an
explicit input.

### Exercise

$a+(b+0)+(c+0)=a+b+c.$

```lean
example (a b c : ℕ) : a + (b + 0) + (c + 0) = a + b + c
```

**Available tactics:** `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one)

</details>

<a id="level-7"></a>

## Level 7: add_succ

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Tutorial/level/7) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Tutorial__7.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Tutorial/L07add_succ.lean#L42)

### Original instructions

Every number in Lean is either $0$ or a successor. We know how to add $0$,
but we need to figure out how to add successors. Let's say we already know
that `37 + d = q`. What should the answer to `37 + succ d` be? Well,
`succ d` is one bigger than `d`, so `37 + succ d` should be `succ q`,
the number one bigger than `q`. More generally `x + succ d` should
be `succ (x + d)`. Let's add this as a lemma.

* `add_succ x d : x + succ d = succ (x + d)`

If you ever see `... + succ ...` in your goal, `rw [add_succ]` is
normally a good idea.

Let's now prove that `succ n = n + 1`. Figure out how to get `+ succ` into
the picture, and then `rw [add_succ]`. Switch between the `+` (addition) and
`012` (numerals) tabs under "Theorems" on the right to
see which proofs you can rewrite.

### Exercise

For all natural numbers $a$, we have $\operatorname{succ}(a) = a+1$.

```lean
theorem succ_eq_add_one n : succ n = n + 1
```

**Available tactics:** `rfl`, `rw`.

**New supplied facts:** `add_succ`.

<details>
<summary>Available facts at this level</summary>

[add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one)

</details>

<a id="level-8"></a>

## Level 8: 2+2=4

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Tutorial/level/8) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Tutorial__8.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Tutorial/L08twoaddtwo.lean#L22)

### Original instructions

Good luck!

  One last hint. If `h : X = Y` then `rw [h]` will change *all* `X`s into `Y`s.
  If you only want to change one of them, say the 3rd one, then use
  `nth_rewrite 3 [h]`.

### Exercise

$2+2=4$.

```lean
example : (2 : ℕ) + 2 = 4
```

**Available tactics:** `rfl`, `rw`.

<details>
<summary>Available facts at this level</summary>

[add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one)

</details>
