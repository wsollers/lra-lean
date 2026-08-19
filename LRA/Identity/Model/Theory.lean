import LRA.Identity.Axioms
import LRA.Identity.Distinctness
import LRA.Identity.Uniqueness
import LRA.Identity.ExistenceAndUniqueness
import LRA.Identity.Model.LStructure

namespace LRA.Identity

universe u

/-! Theory card for axiomatic equality. -/

/-- The two primitive equality principles over a carrier. -/
structure EqualityTheory (Carrier : Type u) : Prop where
  reflexivity : ∀ x : Carrier, x = x
  leibniz :
    ∀ x y : Carrier,
      x = y ->
        ∀ property : Carrier -> Prop, property x ↔ property y

/-- The chosen equality axioms satisfy the equality theory. -/
theorem NativeEqualitySatisfiesEqualityTheory (Carrier : Type u) :
    EqualityTheory Carrier := by
  constructor
  · intro x
    exact EqualityReflexivity x
  · intro x y equalityWitness property
    exact LeibnizLaw equalityWitness property

/-- Transitional existence predicate; ownership will be revisited with Logic. -/
def Exists {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  ∃ x, predicate x

/-- At least two elements, expressible in the pure language of equality. -/
def AtLeastTwo (Carrier : Type u) : Prop :=
  ∃ x y : Carrier, Distinct x y

/-- At most two elements, expressible in the pure language of equality. -/
def AtMostTwo (Carrier : Type u) : Prop :=
  ∀ x y z : Carrier, x = y ∨ y = z ∨ x = z

end LRA.Identity
