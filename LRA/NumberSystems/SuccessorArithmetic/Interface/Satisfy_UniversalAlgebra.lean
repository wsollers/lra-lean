import LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory.Model
import LRA.NumberSystems.SuccessorArithmetic.Interface.UniversalAlgebra.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

open LRA.NumberSystems.SuccessorArithmetic.Interface.UniversalAlgebra

def genericAlgebra (M : SuccessorArithmeticModel) :
    LRA.Identity.AlgebraicStructure SuccessorArithmeticAlgebraicSignature where
  Carrier := M.Carrier
  carrierNonempty := M.carrierNonempty
  interpretOperation := fun symbol args =>
    match symbol with
    | .successor => LRA.AlgebraicStructures.Succ (args ⟨0, by decide⟩)
  interpretConstant := fun symbol =>
    match symbol with
    | .zero => 0

end LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory
