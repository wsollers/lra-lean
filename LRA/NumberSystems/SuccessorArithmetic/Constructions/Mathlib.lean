import LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory.Model
import LRA.NumberSystems.SuccessorArithmetic.Definition

namespace LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib

open LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

abbrev Carrier := LRA.NumberSystems.SuccessorArithmetic.StandardCarrier

def genericModel : SuccessorArithmeticModel :=
  mathlibSuccessorArithmeticModel

theorem satisfiesGenericType : genericModel.signature.carrier = Carrier := by
  rfl

def firstOrderModel := BuildSuccessorArithmeticModel genericModel.signature

end LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib

