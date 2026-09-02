import LRA.AlgebraicStructures
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.Instances

namespace LRA.NumberSystems.RealNumbers.Cauchy

open LRA.AlgebraicStructures

/-- The Cauchy-sequence construction canonically realizes field structure. -/
theorem satisfiesField
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem)
    (absoluteValueData : RationalMetricData rationalSystem) :
    FieldLaws (Carrier rationalSystem absoluteValueData) := by
  sorry
/-- The Cauchy-sequence construction canonically realizes ordered field structure. -/
theorem satisfiesOrderedField
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem)
    (absoluteValueData : RationalMetricData rationalSystem) :
    OrderedFieldLaws (Carrier rationalSystem absoluteValueData) := by
  sorry
/-- The Cauchy-sequence construction canonically realizes complete ordered field structure. -/
theorem satisfiesCompleteOrderedField
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem)
    (absoluteValueData : RationalMetricData rationalSystem) :
    CompleteOrderedFieldLaws
      (Carrier rationalSystem absoluteValueData)
      (Set (Carrier rationalSystem absoluteValueData)) := by
  sorry
end LRA.NumberSystems.RealNumbers.Cauchy
