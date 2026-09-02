import LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.NaturalNumbers.Definition

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib

open LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory

abbrev LRA_MATHLIB_Carrier := LRA.NumberSystems.NaturalNumbers.LRA_MATHLIB_N

abbrev LRA_MathlibCarrier := LRA_MATHLIB_Carrier

abbrev Carrier := LRA_MathlibCarrier

def genericModel : NaturalNumberModel :=
  mathlibNaturalNumberModel

theorem satisfiesGenericType : genericModel.Carrier = Carrier := by
  sorry
def firstOrderModel := genericModel.firstOrderModel

end LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib
