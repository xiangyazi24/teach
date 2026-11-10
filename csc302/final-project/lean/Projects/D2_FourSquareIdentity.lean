import FinalProject

/-!
# D2. Euler's four-square identity  (★★★)

A product of two sums of four squares is a sum of four squares:
`IsSum4 m → IsSum4 n → IsSum4 (m * n)`. Euler's identity:
```
(a₁² + a₂² + a₃² + a₄²)(b₁² + b₂² + b₃² + b₄²)
  = (a₁b₁ + a₂b₂ + a₃b₃ + a₄b₄)² + (a₁b₂ − a₂b₁ + a₃b₄ − a₄b₃)²
  + (a₁b₃ − a₂b₄ − a₃b₁ + a₄b₂)² + (a₁b₄ + a₂b₃ − a₃b₂ − a₄b₁)²
```
Four of the eight products in the last three squares enter with a minus sign, so in `ℕ`
you need case splits on which of two sums is larger (as in D1), or the integers from F3.
Include a function computing the four squares and `#eval` examples.

Size: about 300–400 lines, comments included (guideline estimate: 300–400 lines).

Rules for the submitted file:
* It compiles with `scripts/check.sh`, with no `sorry`, `admit`, `axiom` or `native_decide`.
* It ends with `#print axioms` for the main theorem (only `propext`, `Classical.choice`,
  `Quot.sound` may appear).
* `grind` only to close an equation between polynomial expressions; never for
  inequalities, divisibility or logic.
* Import only `FinalProject`. No Mathlib, no Lean `Nat` theorems, no `omega`.
-/

namespace MyNat

/-- `IsSum4 n`: `n` is a sum of four squares. -/
def IsSum4 (n : ℕ) : Prop := ∃ a b c d : ℕ, n = a * a + b * b + c * c + d * d

/-! ## Euler's identity without subtraction

Each of the last three squares has the form `(P − Q)²` with
`P₂ = a₁b₂ + a₃b₄`, `Q₂ = a₂b₁ + a₄b₃`,
`P₃ = a₁b₃ + a₄b₂`, `Q₃ = a₂b₄ + a₃b₁`,
`P₄ = a₁b₄ + a₂b₃`, `Q₄ = a₃b₂ + a₄b₁`.
Replace `|Pᵢ − Qᵢ|` by any `eᵢ` with `Pᵢ = Qᵢ + eᵢ` or `Qᵢ = Pᵢ + eᵢ`. -/

/-- **Euler's four-square identity, subtraction-free.** If for `i = 2, 3, 4` the number `eᵢ`
is the difference of `Pᵢ` and `Qᵢ` (in one direction or the other), then
`(a₁² + ⋯ + a₄²)(b₁² + ⋯ + b₄²) = (a₁b₁ + a₂b₂ + a₃b₃ + a₄b₄)² + e₂² + e₃² + e₄²`. -/
theorem euler_four_square (a₁ a₂ a₃ a₄ b₁ b₂ b₃ b₄ e₂ e₃ e₄ : ℕ)
    (h₂ : a₁ * b₂ + a₃ * b₄ = a₂ * b₁ + a₄ * b₃ + e₂ ∨ a₂ * b₁ + a₄ * b₃ = a₁ * b₂ + a₃ * b₄ + e₂)
    (h₃ : a₁ * b₃ + a₄ * b₂ = a₂ * b₄ + a₃ * b₁ + e₃ ∨ a₂ * b₄ + a₃ * b₁ = a₁ * b₃ + a₄ * b₂ + e₃)
    (h₄ : a₁ * b₄ + a₂ * b₃ = a₃ * b₂ + a₄ * b₁ + e₄ ∨ a₃ * b₂ + a₄ * b₁ = a₁ * b₄ + a₂ * b₃ + e₄) :
    (a₁ * a₁ + a₂ * a₂ + a₃ * a₃ + a₄ * a₄) * (b₁ * b₁ + b₂ * b₂ + b₃ * b₃ + b₄ * b₄)
      = (a₁ * b₁ + a₂ * b₂ + a₃ * b₃ + a₄ * b₄) * (a₁ * b₁ + a₂ * b₂ + a₃ * b₃ + a₄ * b₄)
        + e₂ * e₂ + e₃ * e₃ + e₄ * e₄ := by
  sorry

/-- For any `P, Q` there is `e` with `P = Q + e` or `Q = P + e` (namely `e = |P − Q|`). -/
theorem exists_diff (P Q : ℕ) : ∃ e, P = Q + e ∨ Q = P + e := by
  sorry

/-! ## The main theorem -/

/-- **Sums of four squares are closed under products:**
`IsSum4 m → IsSum4 n → IsSum4 (m * n)`. -/
theorem isSum4_mul {m n : ℕ} (hm : IsSum4 m) (hn : IsSum4 n) : IsSum4 (m * n) := by
  sorry

/-! ## Computing the four squares

-- TODO: define a function
--   def mulWitness4 (a b : ℕ × ℕ × ℕ × ℕ) : ℕ × ℕ × ℕ × ℕ := ...
-- which, from four squares for `m` and four squares for `n`, computes four squares for
-- `m * n`. State and prove that its output is correct (its four squares add up to the
-- product), and `#eval` it, e.g. on `7 = 2² + 1² + 1² + 1²` and `15 = 3² + 2² + 1² + 1²`.
-/

#print axioms euler_four_square
#print axioms isSum4_mul

end MyNat
