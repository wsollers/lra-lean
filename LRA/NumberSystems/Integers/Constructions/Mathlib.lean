import LRA.NumberSystems.Integers.Interface.ModelTheory.LStructure

namespace LRA.NumberSystems.Integers.Constructions.Mathlib

open LRA.NumberSystems.Integers.Interface.ModelTheory

abbrev Carrier := Int

def genericModel : IntegerModel :=
  mathlibIntegerModel

theorem satisfiesGenericType : genericModel.Carrier = Carrier :=
  rfl

def firstOrderModel := integersModel genericModel

end LRA.NumberSystems.Integers.Constructions.Mathlib
