import LRA.AlgebraicStructures
import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy.Instances

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy

open LRA.AlgebraicStructures

/-- The effective-Cauchy construction canonically realizes field structure. -/
theorem satisfiesField
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) :
    FieldLaws (EffectiveCauchyReal rationalSystem) := by
  sorry

/-- The effective-Cauchy construction canonically realizes ordered field structure. -/
theorem satisfiesOrderedField
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) :
    OrderedFieldLaws (EffectiveCauchyReal rationalSystem) := by
  sorry

/-- The effective-Cauchy construction canonically realizes complete ordered field structure. -/
theorem satisfiesCompleteOrderedField
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) :
    CompleteOrderedFieldLaws
      (EffectiveCauchyReal rationalSystem)
      (Set (EffectiveCauchyReal rationalSystem)) := by
  sorry

end LRA.NumberSystems.RealNumbers.EffectiveCauchy
