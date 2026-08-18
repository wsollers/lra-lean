import LRA.SetSystems

/-!
Contract-backed definitions for algebras of sets.

This module states Volume IV's algebra-of-sets interface against the
ambient-relative algebra layer from Volume I. Concrete backends supply
their operations through the capability classes, so these definitions
work at every registered backend.
-/

namespace LRA.SetSystems

open LRA.Set

universe u v

/-- An algebra of sets on an ambient set.

Mathematical statement (Lean): `abbrev AlgebraOfSetsDefinition`.


Logical form:

```lean
abbrev AlgebraOfSetsDefinition := @LRA.SetSystems.AlgebraOfSets
```
-/
abbrev AlgebraOfSetsDefinition := @LRA.SetSystems.AlgebraOfSets

/-- A ring of sets on an ambient set.

Mathematical statement (Lean): `abbrev RingOfSetsDefinition`.


Logical form:

```lean
abbrev RingOfSetsDefinition := @LRA.SetSystems.RingOfSets
```
-/
abbrev RingOfSetsDefinition := @LRA.SetSystems.RingOfSets

/-- A sigma-ring on an ambient set.

Mathematical statement (Lean): `abbrev SigmaRingDefinition`.


Logical form:

```lean
abbrev SigmaRingDefinition := @LRA.SetSystems.SigmaRingOfSets
```
-/
abbrev SigmaRingDefinition := @LRA.SetSystems.SigmaRingOfSets

/-- A sigma-algebra on an ambient set.

Mathematical statement (Lean): `abbrev SigmaAlgebraDefinition`.


Logical form:

```lean
abbrev SigmaAlgebraDefinition := @LRA.SetSystems.SigmaAlgebraOfSets
```
-/
abbrev SigmaAlgebraDefinition := @LRA.SetSystems.SigmaAlgebraOfSets

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
  algebra : LRA.SetSystems.AlgebraOfSets ambient
```
-/
structure AlgebraOfSetsSpaceDefinition
    (Element : Type u) (SetObj : Type v)
    [Membership Element SetObj]
    [Union SetObj] [Inter SetObj] [SDiff SetObj]
    [EmptyCollection SetObj] [HasSubset SetObj] [HasSymmDiff SetObj] where
  ambient : SetObj
  algebra : LRA.SetSystems.AlgebraOfSets ambient

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

end LRA.SetSystems
