import LRA.NumberSystems.Integers.Interface.ModelTheory.LStructure
import LRA.NumberSystems.Integers.Definition

namespace LRA.NumberSystems.Integers.Constructions.Mathlib

open LRA.NumberSystems.Integers.Interface.ModelTheory

abbrev LRA_MATHLIB_Carrier := LRA.NumberSystems.Integers.LRA_MATHLIB_Z

abbrev LRA_MathlibCarrier := LRA_MATHLIB_Carrier

abbrev Carrier := LRA_MathlibCarrier

def genericModel : IntegerModel :=
  mathlibIntegerModel

theorem satisfiesGenericType : genericModel.Carrier = Carrier :=
  rfl

def firstOrderModel := integersModel genericModel

end LRA.NumberSystems.Integers.Constructions.Mathlib
