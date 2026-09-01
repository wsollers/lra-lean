import Mathlib.Data.ZMod.Defs
import LRA.AlgebraicStructures.AbelianGroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.AbelianGroup.Examples

/-- `(ℤ/nℤ, +, 0, -)` modelled by `ZMod n`, free via the generic abelian-group bridge. -/
example (n : Nat) : LRA.AlgebraicStructures.AbelianGroupLaws (ZMod n) := inferInstance

end LRA.AlgebraicStructures.AbelianGroup.Examples
