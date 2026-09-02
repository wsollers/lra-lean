import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.LStructure
import LRA.NumberSystems.RationalNumbers.Definition

namespace LRA.NumberSystems.RationalNumbers.Constructions.Mathlib

open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory

abbrev LRA_MATHLIB_Carrier := LRA.NumberSystems.RationalNumbers.LRA_MATHLIB_Q

abbrev LRA_MathlibCarrier := LRA_MATHLIB_Carrier

abbrev Carrier := LRA_MathlibCarrier

def genericModel : RationalModel :=
  mathlibRationalModel

theorem satisfiesGenericType : genericModel.Carrier = Carrier := by
  sorry
def firstOrderModel := rationalNumbersModel genericModel

end LRA.NumberSystems.RationalNumbers.Constructions.Mathlib
