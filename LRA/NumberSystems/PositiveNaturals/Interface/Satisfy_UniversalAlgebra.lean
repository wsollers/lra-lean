import LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory.Model
import LRA.NumberSystems.PositiveNaturals.Interface.UniversalAlgebra.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory

open LRA.NumberSystems.PositiveNaturals.Interface.UniversalAlgebra

def genericAlgebra (M : PositiveNaturalsModel) :
    LRA.Identity.AlgebraicStructure PositiveNaturalsAlgebraicSignature where
  Carrier := M.Carrier
  carrierNonempty := M.carrierNonempty
  interpretOperation := fun symbol args =>
    match symbol with
    | .add => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
    | .mul => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
  interpretConstant := fun symbol =>
    match symbol with
    | .one => 1

end LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory
