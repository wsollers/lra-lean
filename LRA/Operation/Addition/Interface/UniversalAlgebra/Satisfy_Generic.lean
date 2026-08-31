import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Addition.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.Operation.Addition.Interface.UniversalAlgebra

open LRA.Operation.Addition.Interface.ModelTheory

universe u

/-- UA-facing entrypoint induced by a promoted generic addition model. -/
def genericSignatureOf {Carrier : Type u}
    (model : AdditionModel Carrier) :
    LRA.Operation.Addition.Interface.UniversalAlgebra.Signature.GenericAdditionSignature :=
  model.signature

end LRA.Operation.Addition.Interface.UniversalAlgebra
