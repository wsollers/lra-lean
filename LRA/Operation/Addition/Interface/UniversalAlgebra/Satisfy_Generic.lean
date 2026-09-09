import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Addition.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.Operation.Addition.Interface.UniversalAlgebra

open LRA.Operation.Addition.Interface.ModelTheory

universe u

/--
`genericSignatureOf` UA-facing entrypoint induced by a promoted generic addition model.

Predicate logic:

  def genericSignatureOf {Carrier : Type u}
      (model : AdditionModel Carrier) :
      LRA.Operation.Addition.Interface.UniversalAlgebra.Signature.GenericAdditionSignature :=
    model.signature

Predicate logic (unfolded):

  def genericSignatureOf {Carrier : Type u}
      (model : AdditionModel Carrier) :
      LRA.Operation.Addition.Interface.UniversalAlgebra.Signature.GenericAdditionSignature :=
    model.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def genericSignatureOf {Carrier : Type u}
    (model : AdditionModel Carrier) :
    LRA.Operation.Addition.Interface.UniversalAlgebra.Signature.GenericAdditionSignature :=
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
    (model : AdditionModel Carrier) :
    LRA.Operation.Addition.Interface.UniversalAlgebra.Signature.GenericAdditionSignature :=
  model.signature

end LRA.Operation.Addition.Interface.UniversalAlgebra
