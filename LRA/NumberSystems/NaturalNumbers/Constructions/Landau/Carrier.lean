import LRA.Set.PredicateSet.Definition

/-!
The Landau carrier: postulated directly, mirroring
`LRA.Set.ZFCSet.Primitives`'s own shape (`axiom ZFCSet : Type`) rather than
being built from something more primitive.

This is deliberate, not a shortcut. Landau's *Grundlagen der Analysis*
takes the five basic properties as given, not derived from set theory --
this construction is the one of the three (`VonNeumann` from ZFC,
`Presburger` from a native inductive type, `Landau` here) that plays the
role for the naturals that `LRA.Set.ZFC` plays for sets: the axiomatic
bedrock, not a model built on top of a different foundation. See
`LRA/NaturalNumbers/ProofOrder.md`'s Backends section.

Backed by `LRA.Set.PredicateSet` for its notion of subset, the same as
`Presburger` -- there is no bespoke "Landau set" notion to build, unlike
`VonNeumann`'s ZFC-generic membership.
-/

namespace LRA.NaturalNumbers.Constructions.Landau

/-- The Landau carrier, postulated directly. -/
axiom LandauElement : Type

/-- The distinguished element ("one," per Landau's own one-based
convention -- this is this construction's own choice, not a claim about
`PeanoSystem`'s field name, which stays base-agnostic per §1.6.10). -/
axiom LandauOne : LandauElement

/-- The successor operation, postulated directly. -/
axiom LandauSuccessor : LandauElement → LandauElement

end LRA.NaturalNumbers.Constructions.Landau
