import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.IntegralDomain.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.IntegralDomain.Examples

/-- `(ℝ, +, *, 0, 1, -)` on `Real` itself, free via the subject-local Mathlib bridge. -/
example : LRA.AlgebraicStructures.IntegralDomainLaws Real := inferInstance

end LRA.AlgebraicStructures.IntegralDomain.Examples
