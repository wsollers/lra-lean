import LRA.AlgebraicStructures.Group.Interface.Definitions.Signature
import LRA.AlgebraicStructures.Group.Interface.Definitions.ConceptSignature
import LRA.Operation

namespace LRA.AlgebraicStructures.Group.Interface.ModelTheory

open LRA.AlgebraicStructures (GroupConceptSignature)

/--
`GroupTheory` `GroupTheory signature` means `signature` satisfies the group laws: `multiply` is associative, `one` is a two-sided identity for `multiply`, and `inverse` is a two-sided inverse for `multiply` against `one`. This is the model-theoretic restatement of `GroupLaws`, stated directly over the raw operations carried by `signature` rather than over a typeclass instance.

Predicate logic:

  structure GroupTheory (signature : GroupConceptSignature) : Prop where
    multiplyAssociative :
      LRA.Operation.Laws.Associative.Associative (fun a b => signature.multiply a b)
    oneMultiply :
      LRA.Operation.Laws.Identity.LeftIdentity
        (fun a b => signature.multiply a b) signature.one
    multiplyOne :
      LRA.Operation.Laws.Identity.RightIdentity
        (fun a b => signature.multiply a b) signature.one
    inverseMultiplyCancel :
      LRA.Operation.Laws.Inverse.LeftInverse
        (fun a b => signature.multiply a b) signature.one signature.inverse
    multiplyInverseCancel :
      LRA.Operation.Laws.Inverse.RightInverse
        (fun a b => signature.multiply a b) signature.one signature.inverse

Predicate logic (unfolded):

  structure GroupTheory (signature : GroupConceptSignature) : Prop where
    multiplyAssociative :
      LRA.Operation.Laws.Associative.Associative (fun a b => signature.multiply a b)
    oneMultiply :
      LRA.Operation.Laws.Identity.LeftIdentity
        (fun a b => signature.multiply a b) signature.one
    multiplyOne :
      LRA.Operation.Laws.Identity.RightIdentity
        (fun a b => signature.multiply a b) signature.one
    inverseMultiplyCancel :
      LRA.Operation.Laws.Inverse.LeftInverse
        (fun a b => signature.multiply a b) signature.one signature.inverse
    multiplyInverseCancel :
      LRA.Operation.Laws.Inverse.RightInverse
        (fun a b => signature.multiply a b) signature.one signature.inverse (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure GroupTheory (signature : GroupConceptSignature) : Prop where
  multiplyAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b => signature.multiply a b)
  oneMultiply :
    LRA.Operation.Laws.Identity.LeftIdentity
      (fun a b => signature.multiply a b) signature.one
  multiplyOne :
    LRA.Operation.Laws.Identity.RightIdentity
      (fun a b => signature.multiply a b) signature.one
  inverseMultiplyCancel :
    LRA.Operation.Laws.Inverse.LeftInverse
      (fun a b => signature.multiply a b) signature.one signature.inverse
  multiplyInverseCancel :
    LRA.Operation.Laws.Inverse.RightInverse
      (fun a b => signature.multiply a b) signature.one signature.inverse
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
structure GroupTheory (signature : GroupConceptSignature) : Prop where
  multiplyAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b => signature.multiply a b)
  oneMultiply :
    LRA.Operation.Laws.Identity.LeftIdentity
      (fun a b => signature.multiply a b) signature.one
  multiplyOne :
    LRA.Operation.Laws.Identity.RightIdentity
      (fun a b => signature.multiply a b) signature.one
  inverseMultiplyCancel :
    LRA.Operation.Laws.Inverse.LeftInverse
      (fun a b => signature.multiply a b) signature.one signature.inverse
  multiplyInverseCancel :
    LRA.Operation.Laws.Inverse.RightInverse
      (fun a b => signature.multiply a b) signature.one signature.inverse

end LRA.AlgebraicStructures.Group.Interface.ModelTheory
