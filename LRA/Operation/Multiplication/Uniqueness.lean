import LRA.Operation.Multiplication.Definition

namespace LRA.Operation.Multiplication

universe u

/-- Uniqueness predicate for later refinement of a generic multiplication witness. -/
def UniqueOn (Carrier : Type u) : Prop :=
  ∀ first second : Specification Carrier, first = second

end LRA.Operation.Multiplication

