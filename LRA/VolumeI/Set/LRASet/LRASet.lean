/-!
LRA predicate sets: the typed backend, sibling to `Set.Enderton`.

A predicate set over a carrier `Alpha` is represented directly as a predicate
on `Alpha` -- `LRASet Alpha := Alpha -> Prop`, definitionally the same choice
Mathlib makes for `Set Alpha`. Elements here are ordinary values of `Alpha`
(reals, naturals, points, whatever the carrier is); unlike `Set.Enderton.Set`,
elements are not themselves sets, so this is a genuinely different ontology,
not a second attempt at Enderton's.
-/

namespace LRA.VolumeI.Set.LRASet

universe u

/-- A predicate set over `Alpha`. -/
def LRASet (Alpha : Type u) := Alpha -> Prop

variable {Alpha : Type u}

/-- Ordinary membership notation: `x ∈ A` means `A x`. -/
instance : Membership Alpha (LRASet Alpha) where
  mem containingSet element := containingSet element

/-- Two predicate sets over the same carrier are equal iff they have the same
members.

Unlike `Set.Enderton.Axioms.Extensionality`, this is not a fresh axiom. It
follows from Lean's function extensionality (`funext`) and propositional
extensionality (`propext`), both already part of Lean's trusted core -- the
same reason `Identity.EqualityReflexivity`/`LeibnizLaw` should be `theorem`s,
not `axiom`s, when a native proof already exists. A predicate set's
extensionality is exactly that case: free once you have `funext`/`propext`,
so it is stated here as a `theorem`. -/
theorem LRASetExtensionality {A B : LRASet Alpha}
    (sameMembers : ∀ x : Alpha, x ∈ A ↔ x ∈ B) :
    A = B := by
  sorry

end LRA.VolumeI.Set.LRASet
