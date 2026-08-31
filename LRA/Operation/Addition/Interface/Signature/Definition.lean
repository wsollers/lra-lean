import LRA.Operation.Addition.Definition

namespace LRA.Operation.Addition.Interface.Signature

universe u

/-- Subject-facing signature bundle for a promoted generic addition witness. -/
structure AdditionConceptSignature where
  carrier : Type u
  [carrierNonempty : Nonempty carrier]
  add : LRA.Operation.BinaryOperation carrier

end LRA.Operation.Addition.Interface.Signature
