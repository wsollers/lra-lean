/-!
The primitive language of Enderton-style textbook set theory.

This language is single-sorted: every object is a set, and every member of a
set is itself a set. The axioms (in `Axioms/Axioms.lean`) determine how the
primitive membership relation behaves and which sets exist.
-/

namespace LRA.Set.Enderton
/--
The primitive sort of sets.

Logical form:

```lean
axiom Set : Type
```
-/
axiom Set : Type

/-- The primitive membership relation between sets.

Argument-order convention, fixed once here: `MembershipRelation x A` asserts
that `x` is a member of `A` -- element first, container second, mirroring the
textbook reading of `x ∈ A`. Every statement in the Enderton chapter goes
through the `∈` notation below rather than citing this relation raw, but the
convention still matters: it is what `x ∈ A` unfolds to.

Logical form:

```lean
axiom MembershipRelation : Set -> Set -> Prop
```
-/
axiom MembershipRelation : Set -> Set -> Prop

/-- Ordinary membership notation for textbook sets: `x ∈ A` unfolds to
`MembershipRelation x A`.

Careful with the binder order. Since Lean 4.12, `Membership.mem` takes the
*container* first (`mem : γ → α → Prop`), so the container is the first
binder here even though the primitive relation puts the element first. The
notation `x ∈ A` elaborates to `Membership.mem A x`, which this instance
sends to `MembershipRelation x A` -- element first, as the convention above
requires. -/
instance : Membership Set Set where
  mem containingSet element := MembershipRelation element containingSet

end LRA.Set.Enderton
