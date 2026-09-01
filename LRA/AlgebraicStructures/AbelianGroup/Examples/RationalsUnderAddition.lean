import Mathlib.Data.Rat.Defs
import LRA.AlgebraicStructures.AbelianGroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.AbelianGroup.Examples

/-- `(ℚ, +, 0, -)` on `Rat` itself, free via the generic abelian-group bridge. -/
example : LRA.AlgebraicStructures.AbelianGroupLaws Rat := inferInstance

end LRA.AlgebraicStructures.AbelianGroup.Examples
