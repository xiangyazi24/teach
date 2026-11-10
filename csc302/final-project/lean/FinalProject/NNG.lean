import FinalProject.NNG.Definition
import FinalProject.NNG.Addition
import FinalProject.NNG.Multiplication
import FinalProject.NNG.Power
import FinalProject.NNG.Implication
import FinalProject.NNG.AdvAddition
import FinalProject.NNG.LessOrEqual
import FinalProject.NNG.AdvMultiplication
import FinalProject.NNG.Algorithm

/-!
# The Natural Number Game layer

Importing `FinalProject.NNG` gives exactly the Natural Number Game: the type `ℕ`
(`MyNat`), `+`, `*`, `^`, `≤`, and every theorem of the game's worlds
(Tutorial, Addition, Multiplication, Power, Implication, Advanced Addition,
`≤`, Advanced Multiplication, Algorithm), under the game's names.
It does *not* include strong induction, `<`, divisibility or remainders
(those are in `FinalProject.Modulo.*`).
-/
