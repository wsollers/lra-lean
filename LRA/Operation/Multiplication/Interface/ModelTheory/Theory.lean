import LRA.Operation.Multiplication.Interface.Signature.Definition
import LRA.Operation.Multiplication.Existence
import LRA.Operation.Multiplication.Uniqueness

namespace LRA.Operation.Multiplication.Interface.ModelTheory

open LRA.Operation.Multiplication.Interface.Signature

/--
`MultiplicationTheory` Model-theoretic restatement of the promoted generic multiplication obligations.

Predicate logic:

  structure MultiplicationTheory (signature : MultiplicationConceptSignature) : Prop where
    realizesSignature :
      ∃ witness : LRA.Operation.Multiplication.Specification signature.carrier,
        witness.mul = signature.multiply
    existence : LRA.Operation.Multiplication.ExistsOn signature.carrier
    uniqueness : LRA.Operation.Multiplication.UniqueOn signature.carrier

Predicate logic (unfolded):

  structure MultiplicationTheory (signature : MultiplicationConceptSignature) : Prop where
    realizesSignature :
      ∃ witness : LRA.Operation.Multiplication.Specification signature.carrier,
        witness.mul = signature.multiply
    existence : LRA.Operation.Multiplication.ExistsOn signature.carrier
    uniqueness : LRA.Operation.Multiplication.UniqueOn signature.carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure MultiplicationTheory (signature : MultiplicationConceptSignature) : Prop where
  realizesSignature :
    ∃ witness : LRA.Operation.Multiplication.Specification signature.carrier,
      witness.mul = signature.multiply
  existence : LRA.Operation.Multiplication.ExistsOn signature.carrier
  uniqueness : LRA.Operation.Multiplication.UniqueOn signature.carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
structure MultiplicationTheory (signature : MultiplicationConceptSignature) : Prop where
  realizesSignature :
    ∃ witness : LRA.Operation.Multiplication.Specification signature.carrier,
      witness.mul = signature.multiply
  existence : LRA.Operation.Multiplication.ExistsOn signature.carrier
  uniqueness : LRA.Operation.Multiplication.UniqueOn signature.carrier

end LRA.Operation.Multiplication.Interface.ModelTheory
