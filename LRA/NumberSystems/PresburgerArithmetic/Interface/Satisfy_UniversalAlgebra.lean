import LRA.NumberSystems.PresburgerArithmetic.Interface.ModelTheory.Model
import LRA.NumberSystems.PresburgerArithmetic.Interface.UniversalAlgebra.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.NumberSystems.PresburgerArithmetic.Interface.ModelTheory

open LRA.NumberSystems.PresburgerArithmetic.Interface.UniversalAlgebra

def genericAlgebra (M : PresburgerArithmeticModel) :
    LRA.Identity.AlgebraicStructure PresburgerArithmeticAlgebraicSignature where
  Carrier := M.signature.carrier
  carrierNonempty := ⟨M.signature.zero⟩
  interpretOperation := fun symbol args =>
    match symbol with
    | .successor => M.signature.successor (args ⟨0, by decide⟩)
    | .add => M.signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant := fun symbol =>
    match symbol with
    | .zero => M.signature.zero

end LRA.NumberSystems.PresburgerArithmetic.Interface.ModelTheory

