import LRA.AlgebraicStructures
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Instances

namespace LRA.NumberSystems.RealNumbers.Dedekind

open LRA.AlgebraicStructures

/-- The Dedekind-cut construction canonically realizes field structure. -/
theorem satisfiesField
    (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    FieldLaws (Cut rationalModel) := by
  sorry

/-- The Dedekind-cut construction canonically realizes ordered field structure. -/
theorem satisfiesOrderedField
    (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    OrderedFieldLaws (Cut rationalModel) := by
  sorry

/-- The Dedekind-cut construction canonically realizes complete ordered field structure. -/
theorem satisfiesCompleteOrderedField
    (rationalModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) :
    CompleteOrderedFieldLaws (Cut rationalModel) (Set (Cut rationalModel)) := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
