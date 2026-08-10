/-!
The primitive language of textbook set theory.

This language is single-sorted: every object is a set, and every member of a
set is itself a set. The axioms determine how the primitive membership relation
behaves and which sets exist.
-/

namespace LRA.VolumeI.Set

/-- The primitive sort of sets. -/
axiom Set : Type

/-- The primitive membership relation between sets. -/
axiom MembershipRelation : Set -> Set -> Prop

/-- Ordinary membership notation for textbook sets. -/
instance : Membership Set Set where
  mem element containingSet := MembershipRelation element containingSet

end LRA.VolumeI.Set
