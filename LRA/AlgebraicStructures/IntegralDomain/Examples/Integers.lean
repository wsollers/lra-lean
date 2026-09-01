import Mathlib.Algebra.Ring.Int.Defs
import LRA.AlgebraicStructures.IntegralDomain.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.IntegralDomain.Examples

/-- `(ℤ, +, *, 0, 1, -)` on `Int` itself, free via the subject-local Mathlib bridge. -/
example : LRA.AlgebraicStructures.IntegralDomainLaws Int := inferInstance

end LRA.AlgebraicStructures.IntegralDomain.Examples
