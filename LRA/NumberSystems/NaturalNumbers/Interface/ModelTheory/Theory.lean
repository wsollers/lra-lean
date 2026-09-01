import LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.Definitions.ConceptSignature
import LRA.Operation

namespace LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory

open LRA.AlgebraicStructures (CommutativeSemiringWithoutZeroConceptSignature)

/-- `NaturalNumbersTheory signature` means `signature` satisfies the
positive-commutative-semiring laws: `add` and `multiply` are each associative
and commutative, `one` is a two-sided identity for `multiply`, and `multiply`
distributes over `add` on both sides. This is the model-theoretic restatement
of `CommutativeSemiringWithoutZeroLaws`, stated directly over the raw
operations carried by `signature` rather than over a typeclass instance.

Logical form:

```lean
structure NaturalNumbersTheory
    (signature : CommutativeSemiringWithoutZeroConceptSignature) : Prop where
  addAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b => signature.add a b)
  addCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b => signature.add a b)
  mulAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b => signature.multiply a b)
  mulCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b => signature.multiply a b)
  oneMul :
    LRA.Operation.Laws.Identity.LeftIdentity
      (fun a b => signature.multiply a b) signature.one
  mulOne :
    LRA.Operation.Laws.Identity.RightIdentity
      (fun a b => signature.multiply a b) signature.one
  leftDistributive :
    LRA.Operation.Laws.Distributive.LeftDistributive
      (fun a b => signature.multiply a b) (fun a b => signature.add a b)
  rightDistributive :
    LRA.Operation.Laws.Distributive.RightDistributive
      (fun a b => signature.multiply a b) (fun a b => signature.add a b)
```
-/
structure NaturalNumbersTheory
    (signature : CommutativeSemiringWithoutZeroConceptSignature) : Prop where
  addAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b => signature.add a b)
  addCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b => signature.add a b)
  mulAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b => signature.multiply a b)
  mulCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b => signature.multiply a b)
  oneMul :
    LRA.Operation.Laws.Identity.LeftIdentity
      (fun a b => signature.multiply a b) signature.one
  mulOne :
    LRA.Operation.Laws.Identity.RightIdentity
      (fun a b => signature.multiply a b) signature.one
  leftDistributive :
    LRA.Operation.Laws.Distributive.LeftDistributive
      (fun a b => signature.multiply a b) (fun a b => signature.add a b)
  rightDistributive :
    LRA.Operation.Laws.Distributive.RightDistributive
      (fun a b => signature.multiply a b) (fun a b => signature.add a b)

end LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory
