import LRA.NumberSystems.FirstOrderArithmetic.Interface.ModelTheory.Model
import LRA.NumberSystems.FirstOrderArithmetic.Definition

namespace LRA.NumberSystems.FirstOrderArithmetic.Constructions.Mathlib

open LRA.NumberSystems.FirstOrderArithmetic.Interface.ModelTheory

abbrev Carrier := LRA.NumberSystems.FirstOrderArithmetic.StandardCarrier

def genericModel : FirstOrderArithmeticModel :=
  mathlibFirstOrderArithmeticModel

theorem satisfiesGenericType : genericModel.signature.carrier = Carrier := by
  rfl

def firstOrderModel := BuildFirstOrderArithmeticModel genericModel.signature

end LRA.NumberSystems.FirstOrderArithmetic.Constructions.Mathlib

