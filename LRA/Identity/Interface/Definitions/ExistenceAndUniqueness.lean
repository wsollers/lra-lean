import LRA.Identity.Interface.Definitions.Uniqueness
import LRA.Identity.Interface.Definitions.Distinctness

namespace LRA.Identity

universe u

def Exists {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  ∃ x, predicate x

def ExistsAndUnique {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  (∃ witness : Carrier, predicate witness) ∧ Unique predicate

def AtLeastTwo (Carrier : Type u) : Prop :=
  ∃ x y : Carrier, Distinct x y

def AtMostTwo (Carrier : Type u) : Prop :=
  ∀ x y z : Carrier, x = y ∨ y = z ∨ x = z

end LRA.Identity
