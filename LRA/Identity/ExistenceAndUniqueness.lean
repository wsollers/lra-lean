import LRA.Identity.Uniqueness

namespace LRA.Identity

universe u

                                                
def ExistsAndUnique {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  (∃ witness : Carrier, predicate witness) ∧ Unique predicate

end LRA.Identity
