import LRA.NumberSystems.PresburgerArithmetic.Interface.ModelTheory.Model

namespace LRA.NumberSystems.PresburgerArithmetic.Interface.ModelTheory

def genericTheory (M : PresburgerArithmeticModel) : Prop :=
  PresburgerArithmeticTheory M.signature

theorem satisfiesModelTheory (M : PresburgerArithmeticModel) : genericTheory M := by
  exact M.satisfiesTheory

end LRA.NumberSystems.PresburgerArithmetic.Interface.ModelTheory

