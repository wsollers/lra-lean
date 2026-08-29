import LRA.NumberSystems.PresburgerArithmetic.Interface.ModelTheory.Model
import LRA.NumberSystems.PresburgerArithmetic.Definition

namespace LRA.NumberSystems.PresburgerArithmetic.Constructions.Mathlib

open LRA.NumberSystems.PresburgerArithmetic.Interface.ModelTheory

abbrev Carrier := LRA.NumberSystems.PresburgerArithmetic.StandardCarrier

def genericModel : PresburgerArithmeticModel :=
  mathlibPresburgerArithmeticModel

theorem satisfiesGenericType : genericModel.signature.carrier = Carrier := by
  rfl

def firstOrderModel := BuildPresburgerArithmeticModel genericModel.signature

end LRA.NumberSystems.PresburgerArithmetic.Constructions.Mathlib

