import LRA.VolumeI.Set.Algebra

/-!
Contract-backed definitions for algebras of sets.

This module states Volume IV's algebra-of-sets interface against the abstract
set-operation contract from Volume I. Concrete backends map their native set
APIs into that contract in switch modules.
-/

namespace LRA.VolumeIV.AlgebrasOfSets

/-- An algebra of sets is a set-operation signature satisfying the algebra laws.

Mathematical statement (Lean): `structure AlgebraOfSetsDefinition`.
-/
abbrev AlgebraOfSetsDefinition :=
  LRA.VolumeI.Set.Algebra.SetAlgebraModel

/-- A ring of sets is a set-ring signature satisfying the set-ring laws.

Mathematical statement (Lean): `abbrev RingOfSetsDefinition`.
-/
abbrev RingOfSetsDefinition :=
  LRA.VolumeI.Set.Algebra.SetRingModel

/-- A sigma-ring is a sigma-ring signature satisfying the sigma-ring laws.

Mathematical statement (Lean): `abbrev SigmaRingDefinition`.
-/
abbrev SigmaRingDefinition :=
  LRA.VolumeI.Set.Algebra.SigmaRingModel

/-- A sigma-algebra is a sigma-algebra signature satisfying the sigma-algebra laws.

Mathematical statement (Lean): `abbrev SigmaAlgebraDefinition`.
-/
abbrev SigmaAlgebraDefinition :=
  LRA.VolumeI.Set.Algebra.SigmaAlgebraModel

/-- Reference data for a space equipped with an algebra of sets.

Mathematical statement (Lean): `structure AlgebraOfSetsSpaceDefinition`.
-/
structure AlgebraOfSetsSpaceDefinition where
  /-- The algebra of set-objects on the carrier. -/
  algebra : AlgebraOfSetsDefinition

namespace AlgebraOfSetsSpaceDefinition

/-- The underlying set-object carrier of a space equipped with an algebra. -/
abbrev SetObject (space : AlgebraOfSetsSpaceDefinition) :
    LRA.VolumeI.Set.LRACarrier :=
  space.algebra.signature.carrier

end AlgebraOfSetsSpaceDefinition

end LRA.VolumeIV.AlgebrasOfSets
