# Algorithm World

World ID: `Algorithm` · Levels: 9 · Prerequisites: Implication.

[Index](../README.md) · [Mathematical reference](../reference.md)

## World introduction

Proofs like $2+2=4$ and $a+b+c+d+e=e+d+c+b+a$ are very tedious to do by hand.
In Algorithm World we learn how to get the computer to do them for us.

Click on "Start" to proceed.

<a id="level-1"></a>

## Level 1: add_left_comm

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Algorithm/level/1) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Algorithm__1.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Algorithm/L01add_left_comm.lean#L25)

### Original instructions

Having to rearrange variables manually using commutativity and
associativity is very tedious. We start by reminding you of this. `add_left_comm`
is a key component in the first algorithm which we'll explain, but we need
to prove it manually.

Remember that you can do precision commutativity rewriting
with things like `rw [add_comm b c]`. And remember that
`a + b + c` means `(a + b) + c`.

### Exercise

If $a, b, c$ are numbers, then $a+(b+c)=b+(a+c)$.

```lean
theorem add_left_comm (a b c : ℕ) : a + (b + c) = b + (a + c)
```

**Available tactics:** `apply`, `exact`, `induction`, `intro`, `rfl`, `rw`, `symm`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-2"></a>

## Level 2: making life easier

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Algorithm/level/2) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Algorithm__2.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Algorithm/L02add_algo1.lean#L27)

### Original instructions

In some later worlds, we're going to see some much nastier levels,
like `(a + a + 1) + (b + b + 1) = (a + b + 1) + (a + b + 1)`.
Brackets need to be moved around, and variables need to be swapped.

In this level, `(a + b) + (c + d) = ((a + c) + d) + b`,
let's forget about the brackets and just think about
the variable order.
To turn `a+b+c+d` into `a+c+d+b` we need to swap `b` and `c`,
and then swap `b` and `d`. But this is easier than you
think with `add_left_comm`.

### Exercise

If $a, b$, $c$ and $d$ are numbers, we have
$(a + b) + (c + d) = ((a + c) + d) + b.$

```lean
example (a b c d : ℕ) : a + b + (c + d) = a + c + d + b
```

**Available tactics:** `apply`, `exact`, `induction`, `intro`, `rfl`, `rw`, `symm`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_comm](../reference.md#mynat-add-left-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-3"></a>

## Level 3: making life simple

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Algorithm/level/3) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Algorithm__3.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Algorithm/L03add_algo2.lean#L34)

### Original instructions

Lean's simplifier, `simp`, is "`rw` on steroids". It will rewrite every lemma
tagged with `simp` and every lemma fed to it by the user, as much as it can.

This level is not a level which you want to solve by hand.
Get the simplifier to solve it for you.

### Exercise

If $a, b,\ldots h$ are arbitrary natural numbers, we have
$(d + f) + (h + (a + c)) + (g + e + b) = a + b + c + d + e + f + g + h$.

```lean
example (a b c d e f g h : ℕ) :
    (d + f) + (h + (a + c)) + (g + e + b) = a + b + c + d + e + f + g + h
```

**Available tactics:** `apply`, `exact`, `induction`, `intro`, `rfl`, `rw`, `simp`, `symm`.

**New tactics:** `simp`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_comm](../reference.md#mynat-add-left-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-4"></a>

## Level 4: the simplest approach

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Algorithm/level/4) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Algorithm__4.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Algorithm/L04add_algo3.lean#L42)

### Original instructions

You can make your own tactics in Lean.
This code here
```
macro "simp_add" : tactic => `(tactic|(
  simp only [add_assoc, add_left_comm, add_comm]))
```
was used to create a new tactic `simp_add`, which runs
`simp only [add_assoc, add_left_comm, add_comm]`.
Try running `simp_add` to solve this level!

### Exercise

If $a, b,\ldots h$ are arbitrary natural numbers, we have
$(d + f) + (h + (a + c)) + (g + e + b) = a + b + c + d + e + f + g + h$.

```lean
example (a b c d e f g h : ℕ) :
    (d + f) + (h + (a + c)) + (g + e + b) = a + b + c + d + e + f + g + h
```

**Available tactics:** `apply`, `exact`, `induction`, `intro`, `rfl`, `rw`, `simp`, `simp_add`, `symm`.

**New tactics:** `simp_add`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_comm](../reference.md#mynat-add-left-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-5"></a>

## Level 5: pred

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Algorithm/level/5) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Algorithm__5.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Algorithm/L05pred.lean#L39)

### Original instructions

We now start work on an algorithm to do addition more efficiently. Recall that
we defined addition by recursion, saying what it did on `0` and successors.
It is an axiom of Lean that recursion is a valid
way to define functions from types such as the naturals.

Let's define a new function `pred` from the naturals to the naturals, which
attempts to subtract 1 from the input. The definition is this:

```
pred 0 := 37
pred (succ n) := n
```

We cannot subtract one from 0, so we just return a junk value. As well as this
definition, we also create a new lemma `pred_succ`, which says that `pred (succ n) = n`.
Let's use this lemma to prove `succ_inj`, the theorem which
Peano assumed as an axiom and which we have already used extensively without justification.

### Exercise

If $\operatorname{succ}(a)=\operatorname{succ}(b)$ then $a=b$.

```lean
example (a b : ℕ) (h : succ a = succ b) : a = b
```

**Available tactics:** `apply`, `exact`, `induction`, `intro`, `rfl`, `rw`, `simp`, `simp_add`, `symm`.

**New supplied facts:** `pred_succ`.

**Disabled lemmas:** `succ_inj`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_comm](../reference.md#mynat-add-left-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [pred_succ](../reference.md#mynat-pred-succ), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-6"></a>

## Level 6: is_zero

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Algorithm/level/6) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Algorithm__6.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Algorithm/L06is_zero.lean#L52)

### Original instructions

We define a function `is_zero` thus:

```
is_zero 0 := True
is_zero (succ n) := False
```

We also create two lemmas, `is_zero_zero` and `is_zero_succ n`, saying that `is_zero 0 = True`
and `is_zero (succ n) = False`. Let's use these lemmas to prove `succ_ne_zero`, Peano's
Last Axiom. Actually, we have been using `zero_ne_succ` before, but it's handy to have
this opposite version too, which can be proved in the same way. Note: you can
cheat here by using `zero_ne_succ` but the point of this world is to show
you how to *prove* results like that.

If you can turn your goal into `True`, then the `trivial` tactic will solve it.

### Exercise

$\operatorname{succ}(a) \neq 0$.

```lean
theorem succ_ne_zero (a : ℕ) : succ a ≠ 0
```

**Available tactics:** `apply`, `exact`, `induction`, `intro`, `rfl`, `rw`, `simp`, `simp_add`, `symm`, `trivial`.

**New tactics:** `trivial`.

**New supplied facts:** `is_zero_succ`, `is_zero_zero`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_comm](../reference.md#mynat-add-left-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [is_zero_succ](../reference.md#mynat-is-zero-succ), [is_zero_zero](../reference.md#mynat-is-zero-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [pred_succ](../reference.md#mynat-pred-succ), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-7"></a>

## Level 7: An algorithm for equality

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Algorithm/level/7) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Algorithm__7.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Algorithm/L07succ_ne_succ.lean#L62)

### Original instructions

Here we begin to
develop an algorithm which, given two naturals `a` and `b`, returns the answer
to "does `a = b`?"

Here is the algorithm. First note that `a` and `b` are numbers, and hence
are either `0` or successors.

*) If `a` and `b` are both `0`, return "yes".

*) If one is `0` and the other is `succ n`, return "no".

*) If `a = succ m` and `b = succ n`, then return the answer to "does `m = n`?"

Our job now is to *prove* that this algorithm always gives the correct answer. The proof that
`0 = 0` is `rfl`. The proof that `0 ≠ succ n` is `zero_ne_succ n`, and the proof
that `succ m ≠ 0` is `succ_ne_zero m`. The proof that if `h : m = n` then
`succ m = succ n` is `rw [h]` and then `rfl`. This level is a proof of the one
remaining job we have to do: if `a ≠ b` then `succ a ≠ succ b`.

### Exercise

If $a \neq b$ then $\operatorname{succ}(a) \neq\operatorname{succ}(b)$.

```lean
theorem succ_ne_succ (m n : ℕ) (h : m ≠ n) : succ m ≠ succ n
```

**Available tactics:** `apply`, `contrapose`, `exact`, `induction`, `intro`, `rfl`, `rw`, `simp`, `simp_add`, `symm`, `trivial`.

**New tactics:** `contrapose`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_comm](../reference.md#mynat-add-left-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [is_zero_succ](../reference.md#mynat-is-zero-succ), [is_zero_zero](../reference.md#mynat-is-zero-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [pred_succ](../reference.md#mynat-pred-succ), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [succ_ne_zero](../reference.md#mynat-succ-ne-zero), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-8"></a>

## Level 8: decide

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Algorithm/level/8) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Algorithm__8.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Algorithm/L08decide.lean#L62)

### Original instructions

Implementing the algorithm for equality of naturals, and the proof that it is correct,
looks like this:

```
instance instDecidableEq : DecidableEq ℕ
| 0, 0 => isTrue <| by
  show 0 = 0
  rfl
| succ m, 0 => isFalse <| by
  show succ m ≠ 0
  exact succ_ne_zero m
| 0, succ n => isFalse <| by
  show 0 ≠ succ n
  exact zero_ne_succ n
| succ m, succ n =>
  match instDecidableEq m n with
  | isTrue (h : m = n) => isTrue <| by
    show succ m = succ n
    rw [h]
    rfl
  | isFalse (h : m ≠ n) => isFalse <| by
    show succ m ≠ succ n
    exact succ_ne_succ m n h
```

This Lean code is a formally verified algorithm for deciding equality
between two naturals. I've typed it in already, behind the scenes.
Because the algorithm is formally verified to be correct, we can
use it in Lean proofs. You can run the algorithm with the `decide` tactic.

### Exercise

$20+20=40$.

```lean
example : (20 : ℕ) + 20 = 40
```

**Available tactics:** `apply`, `contrapose`, `decide`, `exact`, `induction`, `intro`, `rfl`, `rw`, `simp`, `simp_add`, `symm`, `trivial`.

**New tactics:** `decide`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_comm](../reference.md#mynat-add-left-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [is_zero_succ](../reference.md#mynat-is-zero-succ), [is_zero_zero](../reference.md#mynat-is-zero-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [pred_succ](../reference.md#mynat-pred-succ), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [succ_ne_succ](../reference.md#mynat-succ-ne-succ), [succ_ne_zero](../reference.md#mynat-succ-ne-zero), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>

<a id="level-9"></a>

## Level 9: decide again

[Play level](https://adam.math.hhu.de/#/g/leanprover-community/nng4/world/Algorithm/level/9) · [Live data](https://adam.math.hhu.de/data/g/leanprover-community/nng4/level__Algorithm__9.json) · [Source](https://github.com/leanprover-community/NNG4/blob/360d7976c3353883e0a09581e819017bd0656312/Game/Levels/Algorithm/L09decide2.lean#L17)

### Original instructions

We gave a pretty unsatisfactory proof of `2 + 2 ≠ 5` earlier on; now give a nicer one.

### Exercise

$2+2 \neq 5.$

```lean
example : (2 : ℕ) + 2 ≠ 5
```

**Available tactics:** `apply`, `contrapose`, `decide`, `exact`, `induction`, `intro`, `rfl`, `rw`, `simp`, `simp_add`, `symm`, `trivial`.

<details>
<summary>Available facts at this level</summary>

[add_assoc](../reference.md#mynat-add-assoc), [add_comm](../reference.md#mynat-add-comm), [add_left_comm](../reference.md#mynat-add-left-comm), [add_right_comm](../reference.md#mynat-add-right-comm), [add_succ](../reference.md#mynat-add-succ), [add_zero](../reference.md#mynat-add-zero), [four_eq_succ_three](../reference.md#mynat-four-eq-succ-three), [is_zero_succ](../reference.md#mynat-is-zero-succ), [is_zero_zero](../reference.md#mynat-is-zero-zero), [one_eq_succ_zero](../reference.md#mynat-one-eq-succ-zero), [one_ne_zero](../reference.md#mynat-one-ne-zero), [pred_succ](../reference.md#mynat-pred-succ), [succ_add](../reference.md#mynat-succ-add), [succ_eq_add_one](../reference.md#mynat-succ-eq-add-one), [succ_inj](../reference.md#mynat-succ-inj), [succ_ne_succ](../reference.md#mynat-succ-ne-succ), [succ_ne_zero](../reference.md#mynat-succ-ne-zero), [three_eq_succ_two](../reference.md#mynat-three-eq-succ-two), [two_eq_succ_one](../reference.md#mynat-two-eq-succ-one), [zero_add](../reference.md#mynat-zero-add), [zero_ne_one](../reference.md#mynat-zero-ne-one), [zero_ne_succ](../reference.md#mynat-zero-ne-succ)

</details>
