import LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory.Model
import LRA.NumberSystems.SuccessorArithmetic.Interface.UniversalAlgebra.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

open LRA.NumberSystems.SuccessorArithmetic.Interface.UniversalAlgebra

def genericAlgebra (M : SuccessorArithmeticModel) :
    LRA.Identity.AlgebraicStructure SuccessorArithmeticAlgebraicSignature where
  Carrier := M.signature.carrier
  carrierNonempty := ⟨M.signature.base⟩
  interpretOperation := fun symbol args =>
    match symbol with
    | .successor => M.signature.successor (args ⟨0, by decide⟩)
  interpretConstant := fun symbol =>
    match symbol with
    | .base => M.signature.base

end LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

