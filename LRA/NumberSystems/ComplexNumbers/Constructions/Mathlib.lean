import LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.ComplexNumbers.Constructions.Mathlib

open LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory

abbrev Carrier := Complex

noncomputable def genericModel : ComplexNumberModel :=
  mathlibComplexNumberModel

theorem satisfiesGenericType : genericModel.Carrier = Carrier := by
  sorry
noncomputable def firstOrderModel := genericModel.firstOrderModel

end LRA.NumberSystems.ComplexNumbers.Constructions.Mathlib
