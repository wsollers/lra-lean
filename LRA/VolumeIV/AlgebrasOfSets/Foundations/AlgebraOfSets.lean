import LRA.VolumeI.Set.Algebra

/-!
Contract-backed definitions for algebras of sets.

This module states Volume IV's algebra-of-sets interface against the
ambient-relative algebra layer from Volume I. Concrete backends supply
their operations through the capability classes, so these definitions
work at every registered backend.
-/

namespace LRA.VolumeIV.AlgebrasOfSets

open LRA.VolumeI.Set

universe u v

/-- An algebra of sets on an ambient set.

Mathematical statement (Lean): `abbrev AlgebraOfSetsDefinition`.
-/
abbrev AlgebraOfSetsDefinition := @LRA.VolumeI.Set.Algebra.AlgebraOfSets

/-- A ring of sets on an ambient set.

Mathematical statement (Lean): `abbrev RingOfSetsDefinition`.
-/
abbrev RingOfSetsDefinition := @LRA.VolumeI.Set.Algebra.RingOfSets

/-- A sigma-ring on an ambient set.

Mathematical statement (Lean): `abbrev SigmaRingDefinition`.
-/
abbrev SigmaRingDefinition := @LRA.VolumeI.Set.Algebra.SigmaRingOfSets

/-- A sigma-algebra on an ambient set.

Mathematical statement (Lean): `abbrev SigmaAlgebraDefinition`.
-/
abbrev SigmaAlgebraDefinition := @LRA.VolumeI.Set.Algebra.SigmaAlgebraOfSets

/-- Reference data for a space equipped with an algebra of sets: an
ambient set together with an algebra on it.

Mathematical statement (Lean): `structure AlgebraOfSetsSpaceDefinition`.
-/
structure AlgebraOfSetsSpaceDefinition
    (Element : Type u) (SetObj : Type v)
    [Membership Element SetObj]
    [Union SetObj] [Inter SetObj] [SDiff SetObj]
    [EmptyCollection SetObj] [HasSubset SetObj] [HasSymmDiff SetObj] where
  ambient : SetObj
  algebra : LRA.VolumeI.Set.Algebra.AlgebraOfSets ambient

namespace AlgebraOfSetsSpaceDefinition

variable {Element : Type u} {SetObj : Type v}
variable [Membership Element SetObj]
variable [Union SetObj] [Inter SetObj] [SDiff SetObj]
variable [EmptyCollection SetObj] [HasSubset SetObj] [HasSymmDiff SetObj]

/-- The underlying set-object type of a space equipped with an algebra. -/
abbrev SetObject
    (_space : AlgebraOfSetsSpaceDefinition Element SetObj) : Type v :=
  SetObj

end AlgebraOfSetsSpaceDefinition

end LRA.VolumeIV.AlgebrasOfSets
