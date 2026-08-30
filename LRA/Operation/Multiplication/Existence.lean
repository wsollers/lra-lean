import LRA.Operation.Multiplication.Definition
import LRA.Operation.Laws.Closure.Definition

namespace LRA.Operation.Multiplication

universe u

/-- Existence of a generic multiplication witness on a carrier. -/
def ExistsOn (Carrier : Type u) : Prop :=
  Nonempty (Specification Carrier)

end LRA.Operation.Multiplication
