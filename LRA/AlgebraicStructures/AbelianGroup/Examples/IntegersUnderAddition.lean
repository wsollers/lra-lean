import Mathlib.Algebra.Group.Int.Defs
import LRA.AlgebraicStructures.AbelianGroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.AbelianGroup.Examples

/-- `(ℤ, +, 0, -)` on `Int` itself, free via the generic abelian-group bridge. -/
example : LRA.AlgebraicStructures.AbelianGroupLaws Int := inferInstance

end LRA.AlgebraicStructures.AbelianGroup.Examples
