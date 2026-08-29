import LRA.NumberSystems.ZeroBasedNaturals.Interface.ModelTheory.Model
import LRA.NumberSystems.ZeroBasedNaturals.Interface.UniversalAlgebra.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.NumberSystems.ZeroBasedNaturals.Interface.ModelTheory

open LRA.NumberSystems.ZeroBasedNaturals.Interface.UniversalAlgebra

def genericAlgebra (M : ZeroBasedNaturalsModel) :
    LRA.Identity.AlgebraicStructure ZeroBasedNaturalsAlgebraicSignature where
  Carrier := M.Carrier
  carrierNonempty := M.carrierNonempty
  interpretOperation := fun symbol args =>
    match symbol with
    | .add => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
    | .mul => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
  interpretConstant := fun symbol =>
    match symbol with
    | .zero => 0
    | .one => 1

end LRA.NumberSystems.ZeroBasedNaturals.Interface.ModelTheory
