import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.LStructure

namespace LRA.NumberSystems.RationalNumbers.Constructions.Mathlib

open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory

abbrev Carrier := Rat

def genericModel : RationalModel :=
  mathlibRationalModel

theorem satisfiesGenericType : genericModel.Carrier = Carrier :=
  rfl

def firstOrderModel := rationalNumbersModel genericModel

end LRA.NumberSystems.RationalNumbers.Constructions.Mathlib
