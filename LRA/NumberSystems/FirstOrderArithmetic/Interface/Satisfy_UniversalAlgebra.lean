import LRA.NumberSystems.FirstOrderArithmetic.Interface.ModelTheory.Model
import LRA.NumberSystems.FirstOrderArithmetic.Interface.UniversalAlgebra.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.NumberSystems.FirstOrderArithmetic.Interface.ModelTheory

open LRA.NumberSystems.FirstOrderArithmetic.Interface.UniversalAlgebra

def genericAlgebra (M : FirstOrderArithmeticModel) :
    LRA.Identity.AlgebraicStructure FirstOrderArithmeticAlgebraicSignature where
  Carrier := M.signature.carrier
  carrierNonempty := ⟨M.signature.zero⟩
  interpretOperation := fun symbol args =>
    match symbol with
    | .successor => M.signature.successor (args ⟨0, by decide⟩)
    | .add => M.signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul => M.signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant := fun symbol =>
    match symbol with
    | .zero => M.signature.zero

end LRA.NumberSystems.FirstOrderArithmetic.Interface.ModelTheory

