import LRA.NumberSystems.FirstOrderArithmetic.Interface.ModelTheory.Model

namespace LRA.NumberSystems.FirstOrderArithmetic.Interface.ModelTheory

def genericTheory (M : FirstOrderArithmeticModel) : Prop :=
  FirstOrderArithmeticTheory M.signature

theorem satisfiesModelTheory (M : FirstOrderArithmeticModel) : genericTheory M := by
  exact M.satisfiesTheory

end LRA.NumberSystems.FirstOrderArithmetic.Interface.ModelTheory

