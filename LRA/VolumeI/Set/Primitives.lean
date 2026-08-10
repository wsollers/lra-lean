/-!
The primitive language of textbook set theory.

This language is single-sorted: every object is a set, and every member of a
set is itself a set. The axioms determine how the primitive membership relation
behaves and which sets exist.
-/

namespace LRA.VolumeI.Set

/--
The primitive sort of sets.

Logical form:

```lean
Set : Type
```
-/
axiom Set : Type

/--
The primitive membership relation between sets.

Logical form:

```lean
MembershipRelation element containingSet : Prop
```
-/
axiom MembershipRelation : Set -> Set -> Prop

/--
Ordinary membership notation for textbook sets.

Logical form:

```lean
element ∈ containingSet ↔ MembershipRelation element containingSet
```
-/
instance : Membership Set Set where
  mem element containingSet := MembershipRelation element containingSet

end LRA.VolumeI.Set
