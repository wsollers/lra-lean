import LRA.Identity.Uniqueness

namespace LRA.Identity

universe u

/-- Existence and uniqueness for a predicate. -/
def ExistsAndUnique {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  (∃ witness : Carrier, predicate witness) ∧ Unique predicate

end LRA.Identity
