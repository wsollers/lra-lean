import LRA.AlgebraicStructures
import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Instances

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals

open LRA.AlgebraicStructures

/-- The primitive-interval construction canonically realizes field structure. -/
theorem satisfiesField
    (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    FieldLaws (Carrier rationalModel) := by
  sorry
/-- The primitive-interval construction canonically realizes ordered field structure. -/
theorem satisfiesOrderedField
    (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    OrderedFieldLaws (Carrier rationalModel) := by
  sorry
/-- The primitive-interval construction canonically realizes complete ordered field structure. -/
theorem satisfiesCompleteOrderedField
    (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    CompleteOrderedFieldLaws (Carrier rationalModel) (Set (Carrier rationalModel)) := by
  sorry
end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
