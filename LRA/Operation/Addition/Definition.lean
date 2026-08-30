import LRA.Operation.Definition

namespace LRA.Operation.Addition

open LRA.Operation

universe u

/-- Core specification record for a generic addition operation on a carrier. -/
structure Specification (Carrier : Type u) where
  add : BinaryEndoOperation Carrier

end LRA.Operation.Addition

