import LRA.Set.SetClass.Definition
import LRA.Set.SetClass.Representation

namespace LRA.Set

universe u v

/-- Set classes are extensional as predicates. -/
theorem SetClassExtensionality {α : Type u} {left right : SetClass α}
    (sameMembers : ∀ element, left element ↔ right element) :
    left = right := by
  sorry

/-- Every set object represents the class obtained from its own membership predicate. -/
theorem SetRepresentsItsClass {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (setObject : SetObject) :
    Represents setObject (ClassOfSet setObject) := by
  sorry

end LRA.Set
