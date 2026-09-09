import LRA.Operation.Multiplication.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.Operation.Multiplication.Interface.UniversalAlgebra

open LRA.Operation.Multiplication.Interface.ModelTheory

universe u

/--
`genericSignatureOf` UA-facing entrypoint induced by a promoted generic multiplication model.

Predicate logic:

  def genericSignatureOf {Carrier : Type u}
      (model : MultiplicationModel Carrier) :
      LRA.Operation.Multiplication.Interface.UniversalAlgebra.Signature.GenericMultiplicationSignature :=
    model.signature

Predicate logic (unfolded):

  def genericSignatureOf {Carrier : Type u}
      (model : MultiplicationModel Carrier) :
      LRA.Operation.Multiplication.Interface.UniversalAlgebra.Signature.GenericMultiplicationSignature :=
    model.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def genericSignatureOf {Carrier : Type u}
    (model : MultiplicationModel Carrier) :
    LRA.Operation.Multiplication.Interface.UniversalAlgebra.Signature.GenericMultiplicationSignature :=
  model.signature
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def genericSignatureOf {Carrier : Type u}
    (model : MultiplicationModel Carrier) :
    LRA.Operation.Multiplication.Interface.UniversalAlgebra.Signature.GenericMultiplicationSignature :=
  model.signature

end LRA.Operation.Multiplication.Interface.UniversalAlgebra
