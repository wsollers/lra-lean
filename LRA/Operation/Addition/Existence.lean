import LRA.Operation.Addition.Definition
import LRA.Operation.Laws.Closure.Definition

namespace LRA.Operation.Addition

open LRA.Operation

universe u

/-- Existence of a generic addition witness on a carrier. -/
def ExistsOn (Carrier : Type u) : Prop :=
  Nonempty (Specification Carrier)

end LRA.Operation.Addition
