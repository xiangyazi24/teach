import FinalProject.NNG
import FinalProject.Tactic.Ring
import FinalProject.Modulo.Order
import FinalProject.Modulo.Divisibility
import FinalProject.Modulo.DivMod
import FinalProject.Modulo.Congruence
import FinalProject.Modulo.Prime

/-!
# CSC302 final-project library

* `FinalProject.NNG`: the Natural Number Game (`ℕ`, `+`, `*`, `^`, `≤` and all the game's
  theorems, under the game's names).
* `FinalProject.Tactic.Ring`: lets the `grind` tactic prove polynomial identities on `ℕ`.
* `FinalProject.Modulo.*`: `<` and strong induction, divisibility `∣`, division with
  remainder `/` and `%`, congruence `a ≡ b [MOD n]`, and the definition of `Prime`.

No Mathlib; everything is proved from the definitions, without extra axioms.
-/
