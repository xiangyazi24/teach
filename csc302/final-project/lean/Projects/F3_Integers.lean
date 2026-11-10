import FinalProject.NNG

/-!
# F3. The integers  (★★★)

The game has no negative numbers. Build them: an integer is a pair `(a, b)` of natural
numbers, thought of as `a - b`, where `(a, b)` and `(c, d)` count as equal when
`a + d = b + c`. Define `+`, `×` and negation, prove that they respect this equality, and
prove the ring laws (commutativity, associativity, distributivity, `x + (-x) = 0`). This is
how mathematicians construct `ℤ` from `ℕ`.

Size: about 300–400 lines, comments included (guideline estimate: 350–450 lines).

Rules for the submitted file:
* It compiles with `scripts/check.sh`, with no `sorry`, `admit`, `axiom` or `native_decide`.
* It ends with `#print axioms` for the main theorem (only `propext`, `Classical.choice`,
  `Quot.sound` may appear).
* `grind` only to close an equation between polynomial expressions; never for
  inequalities, divisibility or logic.
* Track F: import only `FinalProject.NNG`. No Mathlib, no Lean `Nat` theorems, no `omega`.

Everything lives in the namespace `F3`. The laws for pairs are named `ZPair.add_comm`,
`ZPair.mul_assoc`, ..., so they do not clash with the game's `add_comm`, `mul_assoc`, ...
which you will use in the proofs.

The definitions of `+`, `×` and `-` below are the standard ones; you may change them
(and must then say so in the report), but keep every theorem statement.
-/

open MyNat

namespace F3

/-! ## Pairs and their equality -/

/-- A pair of natural numbers `(pos, neg)`, thought of as the integer `pos - neg`. -/
structure ZPair where
  pos : ℕ
  neg : ℕ

/-- `x ≈ y`: the pairs `(a, b)` and `(c, d)` represent the same integer, `a + d = b + c`. -/
def ZPair.Equiv (x y : ZPair) : Prop := x.pos + y.neg = x.neg + y.pos

/-- The notation `x ≈ y` for `ZPair.Equiv x y`. -/
instance : HasEquiv ZPair := ⟨ZPair.Equiv⟩

/-- `x ≈ y` unfolds to `x.pos + y.neg = x.neg + y.pos`. -/
theorem ZPair.equiv_iff (x y : ZPair) : x ≈ y ↔ x.pos + y.neg = x.neg + y.pos := Iff.rfl

/-- `≈` is reflexive. -/
theorem ZPair.equiv_refl (x : ZPair) : x ≈ x := by
  sorry

/-- `≈` is symmetric. -/
theorem ZPair.equiv_symm {x y : ZPair} (h : x ≈ y) : y ≈ x := by
  sorry

/-- `≈` is transitive. (This one needs cancellation: `add_right_cancel`.) -/
theorem ZPair.equiv_trans {x y z : ZPair} (h1 : x ≈ y) (h2 : y ≈ z) : x ≈ z := by
  sorry

/-! ## The operations -/

/-- Zero is `(0, 0)`. -/
instance : OfNat ZPair 0 := ⟨⟨0, 0⟩⟩

/-- One is `(1, 0)`. -/
instance : OfNat ZPair 1 := ⟨⟨1, 0⟩⟩

/-- `(a, b) + (c, d) = (a + c, b + d)`. -/
instance : Add ZPair := ⟨fun x y => ⟨x.pos + y.pos, x.neg + y.neg⟩⟩

/-- `-(a, b) = (b, a)`. -/
instance : Neg ZPair := ⟨fun x => ⟨x.neg, x.pos⟩⟩

/-- `(a, b) * (c, d) = (a * c + b * d, a * d + b * c)`,
because `(a - b)(c - d) = (ac + bd) - (ad + bc)`. -/
instance : Mul ZPair := ⟨fun x y => ⟨x.pos * y.pos + x.neg * y.neg, x.pos * y.neg + x.neg * y.pos⟩⟩

/-! ## The operations respect `≈` -/

/-- Addition respects `≈`. -/
theorem ZPair.add_congr {x x' y y' : ZPair} (hx : x ≈ x') (hy : y ≈ y') :
    x + y ≈ x' + y' := by
  sorry

/-- Negation respects `≈`. -/
theorem ZPair.neg_congr {x x' : ZPair} (hx : x ≈ x') : -x ≈ -x' := by
  sorry

/-- Multiplication respects `≈`. -/
theorem ZPair.mul_congr {x x' y y' : ZPair} (hx : x ≈ x') (hy : y ≈ y') :
    x * y ≈ x' * y' := by
  sorry

/-! ## The ring laws (up to `≈`) -/

/-- Addition is commutative. -/
theorem ZPair.add_comm (x y : ZPair) : x + y ≈ y + x := by
  sorry

/-- Addition is associative. -/
theorem ZPair.add_assoc (x y z : ZPair) : x + y + z ≈ x + (y + z) := by
  sorry

/-- `0` is neutral for addition. -/
theorem ZPair.zero_add (x : ZPair) : 0 + x ≈ x := by
  sorry

/-- **Additive inverses:** `x + (-x) = 0`. -/
theorem ZPair.add_neg (x : ZPair) : x + -x ≈ 0 := by
  sorry

/-- Multiplication is commutative. -/
theorem ZPair.mul_comm (x y : ZPair) : x * y ≈ y * x := by
  sorry

/-- Multiplication is associative. -/
theorem ZPair.mul_assoc (x y z : ZPair) : x * y * z ≈ x * (y * z) := by
  sorry

/-- `1` is neutral for multiplication. -/
theorem ZPair.one_mul (x : ZPair) : 1 * x ≈ x := by
  sorry

/-- Multiplication distributes over addition. -/
theorem ZPair.mul_add (x y z : ZPair) : x * (y + z) ≈ x * y + x * z := by
  sorry

/-- **`ZPair` is a commutative ring up to `≈`**: all the laws above together. -/
theorem ZPair.ring_laws :
    (∀ x y : ZPair, x + y ≈ y + x) ∧
    (∀ x y z : ZPair, x + y + z ≈ x + (y + z)) ∧
    (∀ x : ZPair, 0 + x ≈ x) ∧
    (∀ x : ZPair, x + -x ≈ 0) ∧
    (∀ x y : ZPair, x * y ≈ y * x) ∧
    (∀ x y z : ZPair, x * y * z ≈ x * (y * z)) ∧
    (∀ x : ZPair, 1 * x ≈ x) ∧
    (∀ x y z : ZPair, x * (y + z) ≈ x * y + x * z) := by
  sorry

#print axioms ZPair.ring_laws
#print axioms ZPair.mul_congr

end F3
