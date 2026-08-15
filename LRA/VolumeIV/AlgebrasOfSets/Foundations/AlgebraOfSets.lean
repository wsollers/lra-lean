import LRA.VolumeI.Set.Algebra

/-!
Contract-backed definitions for algebras of sets.

This module states Volume IV's algebra-of-sets interface against the
ambient-relative algebra layer from Volume I. Concrete backends supply
their operations through the capability classes, so these definitions
work at every registered backend.
-/

namespace LRA.Set.Algebra

open LRA.Set

universe u v

/-- An algebra of sets on an ambient set.

Mathematical statement (Lean): `abbrev AlgebraOfSetsDefinition`.


Logical form:

```lean
abbrev AlgebraOfSetsDefinition := @LRA.Set.Algebra.AlgebraOfSets
```
-/
abbrev AlgebraOfSetsDefinition := @LRA.Set.Algebra.AlgebraOfSets

/-- A ring of sets on an ambient set.

Mathematical statement (Lean): `abbrev RingOfSetsDefinition`.


Logical form:

```lean
abbrev RingOfSetsDefinition := @LRA.Set.Algebra.RingOfSets
```
-/
abbrev RingOfSetsDefinition := @LRA.Set.Algebra.RingOfSets

/-- A sigma-ring on an ambient set.

Mathematical statement (Lean): `abbrev SigmaRingDefinition`.


Logical form:

```lean
abbrev SigmaRingDefinition := @LRA.Set.Algebra.SigmaRingOfSets
```
-/
abbrev SigmaRingDefinition := @LRA.Set.Algebra.SigmaRingOfSets

/-- A sigma-algebra on an ambient set.

Mathematical statement (Lean): `abbrev SigmaAlgebraDefinition`.


Logical form:

```lean
abbrev SigmaAlgebraDefinition := @LRA.Set.Algebra.SigmaAlgebraOfSets
```
-/
abbrev SigmaAlgebraDefinition := @LRA.Set.Algebra.SigmaAlgebraOfSets

/-- Reference data for a space equipped with an algebra of sets: an
ambient set together with an algebra on it.

Mathematical statement (Lean): `structure AlgebraOfSetsSpaceDefinition`.


Logical form:

```lean
structure AlgebraOfSetsSpaceDefinition
    (Element : Type u) (SetObj : Type v)
    [Membership Element SetObj]
    [Union SetObj] [Inter SetObj] [SDiff SetObj]
    [EmptyCollection SetObj] [HasSubset SetObj] [HasSymmDiff SetObj] where
  ambient : SetObj
  algebra : LRA.Set.Algebra.AlgebraOfSets ambient
```
-/
structure AlgebraOfSetsSpaceDefinition
    (Element : Type u) (SetObj : Type v)
    [Membership Element SetObj]
    [Union SetObj] [Inter SetObj] [SDiff SetObj]
    [EmptyCollection SetObj] [HasSubset SetObj] [HasSymmDiff SetObj] where
  ambient : SetObj
  algebra : LRA.Set.Algebra.AlgebraOfSets ambient

namespace AlgebraOfSetsSpaceDefinition

variable {Element : Type u} {SetObj : Type v}
variable [Membership Element SetObj]
variable [Union SetObj] [Inter SetObj] [SDiff SetObj]
variable [EmptyCollection SetObj] [HasSubset SetObj] [HasSymmDiff SetObj]

/-- The underlying set-object type of a space equipped with an algebra.

Logical form:

```lean
abbrev SetObject
    (_space : AlgebraOfSetsSpaceDefinition Element SetObj) : Type v :=
  SetObj
```
-/
abbrev SetObject
    (_space : AlgebraOfSetsSpaceDefinition Element SetObj) : Type v :=
  SetObj

end AlgebraOfSetsSpaceDefinition

end LRA.Set.Algebra
