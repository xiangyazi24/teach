import FinalProject

/-!
# A4. Fibonacci numbers and gcd  (★★★★)

Prove `gcd (F m) (F n) = F (gcd m n)`. Along the way: consecutive Fibonacci numbers are
coprime, and `F (m + n + 1) = F (m + 1) * F (n + 1) + F m * F n`.

Needs: topic A1 (`gcd`, its properties; prove them as the first part of this file; the
size below includes them).

Size: 300–400 lines is the usual target; this topic is larger (guideline estimate:
450–550 lines).

Rules for the submitted file:
* It compiles with `scripts/check.sh`, with no `sorry`, `admit`, `axiom` or `native_decide`.
* It ends with `#print axioms` for the main theorem (only `propext`, `Classical.choice`,
  `Quot.sound` may appear).
* `grind` only to close an equation between polynomial expressions; never for
  inequalities, divisibility or logic.
* Import only `FinalProject`. No Mathlib, no Lean `Nat` theorems, no `omega`.

The statements that mention `gcd` are in comment blocks, because you define `gcd` yourself
(part A1). Once your definition compiles, remove the comment markers and prove them; do not
weaken them.
-/

namespace MyNat

/-! ## The Fibonacci numbers -/

/-- The Fibonacci numbers: `F 0 = 0`, `F 1 = 1`, `F (n + 2) = F n + F (n + 1)`. -/
def fib : ℕ → ℕ
  | .zero => 0
  | .succ .zero => 1
  | .succ (.succ n) => fib n + fib (succ n)

/-- `F 0 = 0`. -/
theorem fib_zero : fib 0 = 0 := rfl

/-- `F 1 = 1`. -/
theorem fib_one : fib 1 = 1 := rfl

/-- `F (n + 2) = F n + F (n + 1)`. -/
theorem fib_add_two (n : ℕ) : fib (succ (succ n)) = fib n + fib (succ n) := rfl

/-! ## The addition formula -/

/-- **Addition formula:** `F (m + n + 1) = F (m + 1) * F (n + 1) + F m * F n`. -/
theorem fib_add (m n : ℕ) :
    fib (m + n + 1) = fib (m + 1) * fib (n + 1) + fib m * fib n := by
  sorry

/-! ## Consecutive Fibonacci numbers are coprime -/

/-- **Consecutive Fibonacci numbers are coprime**, stated without `gcd`: every common
divisor of `F n` and `F (n + 1)` is `1`. -/
theorem fib_coprime_succ (n d : ℕ) (h1 : d ∣ fib n) (h2 : d ∣ fib (n + 1)) : d = 1 := by
  sorry

/-! ## Part A1: `gcd`

-- TODO: define `gcd` by Euclid's recursion (`gcd 0 b = b`, `gcd a b = gcd (b % a) a`
-- for `a ≠ 0`) and prove what you need from topic A1, at least:

/-- `gcd a b ∣ a`. -/
theorem gcd_dvd_left (a b : ℕ) : gcd a b ∣ a := by
  sorry

/-- `gcd a b ∣ b`. -/
theorem gcd_dvd_right (a b : ℕ) : gcd a b ∣ b := by
  sorry

/-- Every common divisor of `a` and `b` divides `gcd a b`. -/
theorem dvd_gcd {d a b : ℕ} (ha : d ∣ a) (hb : d ∣ b) : d ∣ gcd a b := by
  sorry
-/

/-! ## The main theorem

Required statements (after defining `gcd`):

/-- Consecutive Fibonacci numbers are coprime: `gcd (F n) (F (n + 1)) = 1`. -/
theorem gcd_fib_succ (n : ℕ) : gcd (fib n) (fib (n + 1)) = 1 := by
  sorry

/-- **`gcd (F m) (F n) = F (gcd m n)`.** -/
theorem gcd_fib (m n : ℕ) : gcd (fib m) (fib n) = fib (gcd m n) := by
  sorry

#print axioms gcd_fib
-/

#print axioms fib_add
#print axioms fib_coprime_succ

end MyNat
