import LRA.NumberSystems.RationalNumbers.Constructions.Mathlib

namespace LRA.NumberSystems.RationalNumbers.Constructions.Mathlib

/-- The Mathlib nonnegative-rational refinement canonically bridges to the
settled generic nonnegative-rational owner. -/
noncomputable def satisfiesNonnegativeRefinement :
    LRA.NumberSystems.RationalNumbers.LRA_MATHLIB_Q_Nonneg ≃
      LRA.NumberSystems.RationalNumbers.LRA_Q_Nonneg := by
  sorry

/-- The Mathlib positive-rational refinement canonically bridges to the
settled generic positive-rational owner. -/
noncomputable def satisfiesPositiveRefinement :
    LRA.NumberSystems.RationalNumbers.LRA_MATHLIB_Q_Pos ≃
      LRA.NumberSystems.RationalNumbers.LRA_Q_Pos := by
  sorry

end LRA.NumberSystems.RationalNumbers.Constructions.Mathlib
