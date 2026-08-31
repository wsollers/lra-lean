import LRA.Operation.Addition.Interface.Signature.Definition
import LRA.Operation.Addition.Existence
import LRA.Operation.Addition.Uniqueness

namespace LRA.Operation.Addition.Interface.ModelTheory

open LRA.Operation.Addition.Interface.Signature

/-- Model-theoretic restatement of the promoted generic addition obligations. -/
structure AdditionTheory (signature : AdditionConceptSignature) : Prop where
  realizesSignature :
    ∃ witness : LRA.Operation.Addition.Specification signature.carrier,
      witness.add = signature.add
  existence : LRA.Operation.Addition.ExistsOn signature.carrier
  uniqueness : LRA.Operation.Addition.UniqueOn signature.carrier

end LRA.Operation.Addition.Interface.ModelTheory
