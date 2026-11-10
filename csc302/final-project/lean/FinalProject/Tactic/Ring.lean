import FinalProject.NNG

/-!
# Letting `grind` do algebra on `ℕ`

In the game you proved identities like `add_sq` by long chains of `rw`.
Lean has a built-in automatic tactic, `grind`, which contains a *ring normalizer*:
it can multiply out both sides of an equation of polynomials and compare them.
But `grind` knows nothing about our home-made `MyNat`. To teach it, we hand it
a *commutative semiring structure* on `ℕ`
(`Lean.Grind.CommSemiring MyNat`): a package containing `+`, `*`, `0`, `1`, powers,
and the laws they obey. Every law in the package is a theorem you already proved in
the game (`add_comm`, `mul_assoc`, `mul_add`, `zero_mul`, ...). Nothing new is
assumed: the package is just the NNG theorems bundled together.

After this file, `grind` proves goals such as
```
example (a b c : ℕ) :
    (a + b + c) * (a + b + c) = a * a + b * b + c * c + 2 * (a * b + b * c + c * a) := by
  grind

example (a b : ℕ) : (a + b) ^ 2 = a ^ 2 + b ^ 2 + 2 * a * b := by grind
```
It also uses hypotheses: from `h : a = b` it can prove `a * c ^ 2 = c * c * b`.

**What `grind` can and cannot do here.**
* Identities between polynomials in `+`, `*`, numerals and powers with
  numeral exponents (`a ^ 2`, `a ^ 3`, ...): yes.
* The exponent laws `a ^ (m + n) = a ^ m * a ^ n`, `(a * b) ^ n = a ^ n * b ^ n`,
  `(a ^ m) ^ n = a ^ (m * n)` with *variable* exponents: yes (tested below).
* There is no subtraction on `ℕ`, so identities must be stated with everything moved
  to the side where it is added. `grind` also does not know `≤`, `∣` or `%` on `MyNat`
  beyond what you give it as hypotheses.

**Technical note (exponents).** `grind`'s ring normalizer expects powers whose exponent
is one of Lean's built-in natural numbers `Nat`, whereas our `a ^ n` has `n : ℕ` (= `MyNat`).
We therefore define a second power `a ^ (k : Nat)` (`npowNat`), prove
`pow_eq_npow : a ^ n = a ^ (toNat n)`, and tell `grind` to rewrite with it
(`grind norm` attribute) before it starts. You never need to write `toNat` yourself.
-/

namespace MyNat

/-- Powers with a *built-in* `Nat` exponent: `npowNat a k = a * a * ... * a` (`k` factors).
Only used behind the scenes so that `grind` can handle powers; see the module note. -/
def npowNat (a : ℕ) : Nat → ℕ
  | 0 => 1
  | k + 1 => npowNat a k * a

/-- `a ^ (k : Nat)` means `npowNat a k`. -/
instance instNPow : HPow MyNat Nat MyNat := ⟨npowNat⟩

/-- Converting a built-in natural number `k` to our `ℕ` (`ofNat k`). -/
instance instNatCast : NatCast MyNat := ⟨ofNat⟩

/-- **The NNG theorems packaged as a commutative semiring.**
Each field is a theorem from the game; `grind` reads them from this instance. -/
instance instCommSemiring : Lean.Grind.CommSemiring MyNat :=
  { natCast := instNatCast
    ofNat := fun _ => instOfNat
    nsmul := ⟨fun k a => ofNat k * a⟩
    npow := instNPow
    add_zero := add_zero
    add_comm := add_comm
    add_assoc := add_assoc
    mul_assoc := mul_assoc
    mul_one := mul_one
    one_mul := one_mul
    left_distrib := mul_add
    right_distrib := add_mul
    zero_mul := zero_mul
    mul_zero := mul_zero
    pow_zero := fun _ => rfl
    pow_succ := fun _ _ => rfl
    mul_comm := mul_comm }

/-- Addition on `ℕ` can be cancelled on the right (`add_right_cancel` from the game).
`grind` uses this when it reasons with equations. -/
instance instAddRightCancel : Lean.Grind.AddRightCancel MyNat := ⟨add_right_cancel⟩

/-! ## Bridging our exponents to `Nat` exponents -/

/-- `toNat` of a numeral is that numeral. -/
theorem toNat_ofNat (n : Nat) : toNat (no_index (OfNat.ofNat n : ℕ)) = (OfNat.ofNat n : Nat) := by
  induction n with
  | zero => rfl
  | succ n ih =>
    show Nat.succ (toNat (ofNat n)) = n + 1
    rw [show toNat (ofNat n) = n from ih]

/-- `toNat` turns our `+` into `Nat`'s `+`. -/
theorem toNat_add (a b : ℕ) : toNat (a + b) = toNat a + toNat b := by
  induction b with
  | zero => rfl
  | succ b ih =>
    show Nat.succ (toNat (a + b)) = toNat a + Nat.succ (toNat b)
    rw [ih]
    rfl

/-- `toNat` turns our `*` into `Nat`'s `*`. -/
theorem toNat_mul (a b : ℕ) : toNat (a * b) = toNat a * toNat b := by
  induction b with
  | zero => rfl
  | succ b ih =>
    show toNat (a * b + a) = toNat a * Nat.succ (toNat b)
    rw [toNat_add, ih, Nat.mul_succ]

/-- Our power `a ^ n` (with `n : ℕ`) equals the `Nat`-exponent power `a ^ (toNat n)`. -/
theorem pow_eq_npow (a n : ℕ) : a ^ n = a ^ (toNat n) := by
  induction n with
  | zero => rfl
  | succ n ih =>
    rw [pow_succ, ih]
    rfl

/-- `(a * b) ^ k = a ^ k * b ^ k` for a `Nat` exponent `k` (helps `grind` with variable exponents). -/
theorem mul_npow (a b : ℕ) (k : Nat) : (a * b) ^ k = a ^ k * b ^ k := by
  induction k with
  | zero => rfl
  | succ k ih =>
    show (a * b) ^ k * (a * b) = (a ^ k * a) * (b ^ k * b)
    rw [ih]
    grind

/-- `a ^ (j * k) = (a ^ j) ^ k` for `Nat` exponents (helps `grind` with variable exponents). -/
theorem npow_mul (a : ℕ) (j k : Nat) : a ^ (j * k) = (a ^ j) ^ k := by
  induction k with
  | zero => rfl
  | succ k ih =>
    show a ^ (j * k + j) = (a ^ j) ^ k * a ^ j
    rw [← ih]
    grind

attribute [grind norm] pow_eq_npow toNat_ofNat toNat_add toNat_mul
attribute [grind =] mul_npow npow_mul

/-! ## Tests -/

example (a b : ℕ) : (a + b) * (a + b) = a * a + 2 * a * b + b * b := by grind

example (a b c : ℕ) :
    (a + b + c) * (a + b + c) = a * a + b * b + c * c + 2 * (a * b + b * c + c * a) := by
  grind

example (a : ℕ) : (a + 1) ^ 3 = a ^ 3 + 3 * a ^ 2 + 3 * a + 1 := by grind

/-- Using a hypothesis: from `h : a * b = c` the product `(a + b)²` is `a² + b² + 2c`. -/
example (a b c : ℕ) (h : a * b = c) : (a + b) * (a + b) = a * a + b * b + 2 * c := by
  grind

example (a b : ℕ) : (a + b) ^ 2 = a ^ 2 + b ^ 2 + 2 * a * b := by grind
example (a : ℕ) : a ^ 3 = a * a * a := by grind
example (a m n : ℕ) : a ^ (m + n) = a ^ m * a ^ n := by grind
example (a b n : ℕ) : (a * b) ^ n = a ^ n * b ^ n := by grind
example (a m n : ℕ) : (a ^ m) ^ n = a ^ (m * n) := by grind
example (a b c : ℕ) (h : a = b) : a * c ^ 2 = c * c * b := by grind
example (a b x : ℕ) (h : a + x = b + x) : a = b := by grind

end MyNat
