import LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.WholeNumbers.Constructions.Mathlib

open LRA.NumberSystems.WholeNumbers.Interface.ModelTheory

abbrev Carrier := Nat

def genericModel : WholeNumberModel :=
  mathlibWholeNumberModel

theorem satisfiesGenericType : genericModel.Carrier = Carrier :=
  rfl

def firstOrderModel := genericModel.firstOrderModel

end LRA.NumberSystems.WholeNumbers.Constructions.Mathlib
