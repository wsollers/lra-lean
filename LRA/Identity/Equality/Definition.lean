import LRA.Relation.Canonical.IdentityRelation.Definition

namespace LRA.Identity

universe u

/-- A descriptive name for Lean propositional equality. -/
abbrev PropositionalEquality {Carrier : Type u} (left right : Carrier) : Prop :=
  left = right

/-- TeX label: `def:equality-relation`.

The equality relation on a carrier.

This is an intentional synonym for `LRA.Relation.IdentityRelation`, justified by
the mathematics rather than by migration history. The diagonal `{(x, x)}` carries
two standard names, and which one is right depends on what is being said about
it: relation theory calls it the *identity relation*, because it is the identity
for relation composition, while model theory calls it the *equality relation*,
because it is what interprets the symbol `=`. `LRA.Identity` is the subject that
owns equality, so it owns that second name.

Unlike `LRA.Identity.IdentityRelation`, which §7.2 deleted, this does not repeat
a name the relation subject already uses. -/
abbrev EqualityRelation (Carrier : Type u) : Carrier → Carrier → Prop :=
  LRA.Relation.IdentityRelation Carrier

end LRA.Identity
