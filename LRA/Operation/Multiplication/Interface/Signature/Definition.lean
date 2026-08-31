import LRA.Operation.Multiplication.Definition

namespace LRA.Operation.Multiplication.Interface.Signature

universe u

/-- Subject-facing signature bundle for a promoted generic multiplication witness. -/
structure MultiplicationConceptSignature where
  carrier : Type u
  [carrierNonempty : Nonempty carrier]
  multiply : LRA.Operation.BinaryOperation carrier

end LRA.Operation.Multiplication.Interface.Signature
