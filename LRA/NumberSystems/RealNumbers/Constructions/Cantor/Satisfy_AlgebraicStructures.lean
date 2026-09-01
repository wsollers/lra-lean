import LRA.AlgebraicStructures
import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Instances

namespace LRA.NumberSystems.RealNumbers.Cantor

open LRA.AlgebraicStructures

/-- The Cantor construction canonically realizes field structure. -/
theorem satisfiesField
    (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    FieldLaws (Carrier fieldModel) := by
  sorry

/-- The Cantor construction canonically realizes ordered field structure. -/
theorem satisfiesOrderedField
    (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    OrderedFieldLaws (Carrier fieldModel) := by
  sorry

/-- The Cantor construction canonically realizes complete ordered field structure. -/
theorem satisfiesCompleteOrderedField
    (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    CompleteOrderedFieldLaws (Carrier fieldModel) (Set (Carrier fieldModel)) := by
  sorry

end LRA.NumberSystems.RealNumbers.Cantor
