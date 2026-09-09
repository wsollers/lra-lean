import LRA.Operation.Addition.Interface.Signature.Definition
import LRA.Operation.Addition.Existence
import LRA.Operation.Addition.Uniqueness

namespace LRA.Operation.Addition.Interface.ModelTheory

open LRA.Operation.Addition.Interface.Signature

/--
`AdditionTheory` Model-theoretic restatement of the promoted generic addition obligations.

Predicate logic:

  structure AdditionTheory (signature : AdditionConceptSignature) : Prop where
    realizesSignature :
      ∃ witness : LRA.Operation.Addition.Specification signature.carrier,
        witness.add = signature.add
    existence : LRA.Operation.Addition.ExistsOn signature.carrier
    uniqueness : LRA.Operation.Addition.UniqueOn signature.carrier

Predicate logic (unfolded):

  structure AdditionTheory (signature : AdditionConceptSignature) : Prop where
    realizesSignature :
      ∃ witness : LRA.Operation.Addition.Specification signature.carrier,
        witness.add = signature.add
    existence : LRA.Operation.Addition.ExistsOn signature.carrier
    uniqueness : LRA.Operation.Addition.UniqueOn signature.carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure AdditionTheory (signature : AdditionConceptSignature) : Prop where
  realizesSignature :
    ∃ witness : LRA.Operation.Addition.Specification signature.carrier,
      witness.add = signature.add
  existence : LRA.Operation.Addition.ExistsOn signature.carrier
  uniqueness : LRA.Operation.Addition.UniqueOn signature.carrier
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
structure AdditionTheory (signature : AdditionConceptSignature) : Prop where
  realizesSignature :
    ∃ witness : LRA.Operation.Addition.Specification signature.carrier,
      witness.add = signature.add
  existence : LRA.Operation.Addition.ExistsOn signature.carrier
  uniqueness : LRA.Operation.Addition.UniqueOn signature.carrier

end LRA.Operation.Addition.Interface.ModelTheory
