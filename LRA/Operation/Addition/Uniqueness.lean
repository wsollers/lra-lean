import LRA.Operation.Addition.Definition

namespace LRA.Operation.Addition

universe u

/-- Uniqueness predicate for later refinement of a generic addition witness. -/
def UniqueOn (Carrier : Type u) : Prop :=
  ∀ first second : Specification Carrier, first = second

end LRA.Operation.Addition

