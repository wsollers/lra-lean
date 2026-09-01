import Mathlib.Algebra.Field.Rat
import LRA.AlgebraicStructures.IntegralDomain.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.IntegralDomain.Examples

/-- `(ℚ, +, *, 0, 1, -)` on `Rat` itself, free via the subject-local Mathlib bridge. -/
example : LRA.AlgebraicStructures.IntegralDomainLaws Rat := inferInstance

end LRA.AlgebraicStructures.IntegralDomain.Examples
