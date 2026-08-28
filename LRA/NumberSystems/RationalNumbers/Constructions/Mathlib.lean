import LRA.NumberSystems.Interface.ModelTheory.LStructure
import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RationalNumbers.Constructions.Mathlib

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory

abbrev Carrier := Rat

def genericModel : DenselyOrderedFieldModel :=
  mathlibDenselyOrderedFieldModel

theorem satisfiesGenericType : genericModel.Carrier = Carrier :=
  rfl

def firstOrderModel := rationalNumbersModel genericModel

end LRA.NumberSystems.RationalNumbers.Constructions.Mathlib
