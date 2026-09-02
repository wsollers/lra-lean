import LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory.Theory
import LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory.Model

namespace LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

def genericTheory (M : SuccessorArithmeticModel) : Prop :=
  SuccessorArithmeticTheory M.signature

theorem satisfiesModelTheory (M : SuccessorArithmeticModel) : genericTheory M := by
  sorry
end LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory
