import LRA.Operation.Definition

namespace LRA.Operation.Multiplication

open LRA.Operation

universe u

/-- Core specification record for a generic multiplication operation on a carrier. -/
structure Specification (Carrier : Type u) where
  mul : BinaryEndoOperation Carrier

end LRA.Operation.Multiplication

