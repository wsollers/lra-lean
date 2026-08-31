import LRA.Operation.Multiplication.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.Operation.Multiplication.Interface.UniversalAlgebra

open LRA.Operation.Multiplication.Interface.ModelTheory

universe u

/-- UA-facing entrypoint induced by a promoted generic multiplication model. -/
def genericSignatureOf {Carrier : Type u}
    (model : MultiplicationModel Carrier) :
    LRA.Operation.Multiplication.Interface.UniversalAlgebra.Signature.GenericMultiplicationSignature :=
  model.signature

end LRA.Operation.Multiplication.Interface.UniversalAlgebra
