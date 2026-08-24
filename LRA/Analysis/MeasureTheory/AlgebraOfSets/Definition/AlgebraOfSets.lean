import LRA.SetSystems

namespace LRA.SetSystems

open LRA.Set

universe u v

/--
`AlgebraOfSetsDefinition` TODO

Predicate logic:

  abbrev AlgebraOfSetsDefinition := @LRA.SetSystems.AlgebraOfSets

Predicate logic (unfolded):

  abbrev AlgebraOfSetsDefinition := @LRA.SetSystems.AlgebraOfSets (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev AlgebraOfSetsDefinition := @LRA.SetSystems.AlgebraOfSets
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev AlgebraOfSetsDefinition := @LRA.SetSystems.AlgebraOfSets

/--
`RingOfSetsDefinition` TODO

Predicate logic:

  abbrev RingOfSetsDefinition := @LRA.SetSystems.RingOfSets

Predicate logic (unfolded):

  abbrev RingOfSetsDefinition := @LRA.SetSystems.RingOfSets (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev RingOfSetsDefinition := @LRA.SetSystems.RingOfSets
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev RingOfSetsDefinition := @LRA.SetSystems.RingOfSets

/--
`SigmaRingDefinition` TODO

Predicate logic:

  abbrev SigmaRingDefinition := @LRA.SetSystems.SigmaRingOfSets

Predicate logic (unfolded):

  abbrev SigmaRingDefinition := @LRA.SetSystems.SigmaRingOfSets (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev SigmaRingDefinition := @LRA.SetSystems.SigmaRingOfSets
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev SigmaRingDefinition := @LRA.SetSystems.SigmaRingOfSets

/--
`SigmaAlgebraDefinition` TODO

Predicate logic:

  abbrev SigmaAlgebraDefinition := @LRA.SetSystems.SigmaAlgebraOfSets

Predicate logic (unfolded):

  abbrev SigmaAlgebraDefinition := @LRA.SetSystems.SigmaAlgebraOfSets (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev SigmaAlgebraDefinition := @LRA.SetSystems.SigmaAlgebraOfSets
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev SigmaAlgebraDefinition := @LRA.SetSystems.SigmaAlgebraOfSets

/--
`AlgebraOfSetsSpaceDefinition` TODO

Predicate logic:

  structure AlgebraOfSetsSpaceDefinition
    (Element : Type u) (SetObj : Type v)
    [Membership Element SetObj]
    [Union SetObj] [Inter SetObj] [SDiff SetObj]
    [EmptyCollection SetObj] [HasSubset SetObj] [HasSymmDiff SetObj] where
  ambient : SetObj
  algebra : LRA.SetSystems.AlgebraOfSets ambient

Predicate logic (unfolded):

  structure AlgebraOfSetsSpaceDefinition
    (Element : Type u) (SetObj : Type v)
    [Membership Element SetObj]
    [Union SetObj] [Inter SetObj] [SDiff SetObj]
    [EmptyCollection SetObj] [HasSubset SetObj] [HasSymmDiff SetObj] where
  ambient : SetObj
  algebra : LRA.SetSystems.AlgebraOfSets ambient (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure AlgebraOfSetsSpaceDefinition
    (Element : Type u) (SetObj : Type v)
    [Membership Element SetObj]
    [Union SetObj] [Inter SetObj] [SDiff SetObj]
    [EmptyCollection SetObj] [HasSubset SetObj] [HasSymmDiff SetObj] where
  ambient : SetObj
  algebra : LRA.SetSystems.AlgebraOfSets ambient
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

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

/--
`SetObject` TODO

Predicate logic:

  abbrev SetObject
    (_space : AlgebraOfSetsSpaceDefinition Element SetObj) : Type v :=
  SetObj

Predicate logic (unfolded):

  abbrev SetObject
    (_space : AlgebraOfSetsSpaceDefinition Element SetObj) : Type v :=
  SetObj (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev SetObject
    (_space : AlgebraOfSetsSpaceDefinition Element SetObj) : Type v :=
  SetObj
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev SetObject
    (_space : AlgebraOfSetsSpaceDefinition Element SetObj) : Type v :=
  SetObj

end AlgebraOfSetsSpaceDefinition

end LRA.SetSystems
