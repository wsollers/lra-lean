import LRA.NumberSystems.RationalNumbers.Constructions.Mathlib

namespace LRA.NumberSystems.RationalNumbers.Constructions.Mathlib

/-- The Mathlib nonnegative-rational refinement canonically bridges to the
settled generic nonnegative-rational owner. -/
noncomputable def satisfiesNonnegativeRefinement :
    LRA.NumberSystems.RationalNumbers.LRA_MATHLIB_Q_Nonneg ≃
      LRA.NumberSystems.RationalNumbers.LRA_Q_Nonneg where
  toFun := by
    intro value
    sorry
  invFun := by
    intro value
    sorry
  left_inv := by
    intro value
    sorry
  right_inv := by
    intro value
    sorry

/-- The Mathlib positive-rational refinement canonically bridges to the
settled generic positive-rational owner. -/
noncomputable def satisfiesPositiveRefinement :
    LRA.NumberSystems.RationalNumbers.LRA_MATHLIB_Q_Pos ≃
      LRA.NumberSystems.RationalNumbers.LRA_Q_Pos where
  toFun := by
    intro value
    sorry
  invFun := by
    intro value
    sorry
  left_inv := by
    intro value
    sorry
  right_inv := by
    intro value
    sorry

end LRA.NumberSystems.RationalNumbers.Constructions.Mathlib
