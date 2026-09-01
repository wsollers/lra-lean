import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Archimedean
import LRA.AlgebraicStructures.CompleteOrderedField.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.CompleteOrderedField.Examples

/-- `(ℝ, +, *, 0, 1, -, ⁻¹, ≤)` together with least-upper-bound completeness on
`Set Real`, free via the subject-local Mathlib bridge. -/
example : LRA.AlgebraicStructures.CompleteOrderedFieldLaws Real (Set Real) :=
  by
    simpa using
      (LRA.AlgebraicStructures.ofConditionallyCompleteLinearOrder (R := Real))

end LRA.AlgebraicStructures.CompleteOrderedField.Examples
