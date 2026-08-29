import LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory.Model

namespace LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

def genericTheory (M : SuccessorArithmeticModel) : Prop :=
  SuccessorArithmeticTheory M.signature

theorem satisfiesModelTheory (M : SuccessorArithmeticModel) : genericTheory M := by
  exact M.satisfiesTheory

end LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

