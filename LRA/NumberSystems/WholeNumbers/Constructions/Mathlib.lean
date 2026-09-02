import LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.WholeNumbers.Definition

namespace LRA.NumberSystems.WholeNumbers.Constructions.Mathlib

open LRA.NumberSystems.WholeNumbers.Interface.ModelTheory

abbrev LRA_MATHLIB_Carrier := LRA.NumberSystems.WholeNumbers.LRA_MATHLIB_W

abbrev LRA_MathlibCarrier := LRA_MATHLIB_Carrier

abbrev Carrier := LRA_MathlibCarrier

def genericModel : WholeNumberModel :=
  mathlibWholeNumberModel

theorem satisfiesGenericType : genericModel.Carrier = Carrier := by
  sorry
def firstOrderModel := genericModel.firstOrderModel

end LRA.NumberSystems.WholeNumbers.Constructions.Mathlib
