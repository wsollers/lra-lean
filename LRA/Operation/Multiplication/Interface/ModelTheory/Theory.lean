import LRA.Operation.Multiplication.Interface.Signature.Definition
import LRA.Operation.Multiplication.Existence
import LRA.Operation.Multiplication.Uniqueness

namespace LRA.Operation.Multiplication.Interface.ModelTheory

open LRA.Operation.Multiplication.Interface.Signature

/-- Model-theoretic restatement of the promoted generic multiplication obligations. -/
structure MultiplicationTheory (signature : MultiplicationConceptSignature) : Prop where
  realizesSignature :
    ∃ witness : LRA.Operation.Multiplication.Specification signature.carrier,
      witness.mul = signature.multiply
  existence : LRA.Operation.Multiplication.ExistsOn signature.carrier
  uniqueness : LRA.Operation.Multiplication.UniqueOn signature.carrier

end LRA.Operation.Multiplication.Interface.ModelTheory
