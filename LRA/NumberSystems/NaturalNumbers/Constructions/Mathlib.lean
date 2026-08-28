import LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib

open LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory

abbrev Carrier := Nat

def genericModel : NaturalNumberModel :=
  mathlibNaturalNumberModel

theorem satisfiesGenericType : genericModel.Carrier = Carrier :=
  rfl

def firstOrderModel := genericModel.firstOrderModel

end LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib
