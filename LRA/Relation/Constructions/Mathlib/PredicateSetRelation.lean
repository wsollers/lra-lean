import LRA.Relation.Interface
import LRA.Set.Interop.Providers.Mathlib.Predicate

namespace LRA.Relation.Constructions.Mathlib

universe u

/--
`PredicateSetRelation` TODO

Predicate logic:

  abbrev PredicateSetRelation (Carrier : Type u) : Type u :=
    LRA.Set.Interop.Providers.Mathlib.Predicate.PredicateSet (Carrier × Carrier)

Predicate logic (unfolded):

  abbrev PredicateSetRelation (Carrier : Type u) : Type u :=
    LRA.Set.Interop.Providers.Mathlib.Predicate.PredicateSet (Carrier × Carrier) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev PredicateSetRelation (Carrier : Type u) : Type u :=
  LRA.Set.Interop.Providers.Mathlib.Predicate.PredicateSet (Carrier × Carrier)
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
abbrev PredicateSetRelation (Carrier : Type u) : Type u :=
  LRA.Set.Interop.Providers.Mathlib.Predicate.PredicateSet (Carrier × Carrier)

/--
`PredicateSetRelation.toEndorelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (a : LRA.Relation.Constructions.Mathlib.PredicateSetRelation Carrier) (a_1 a_2 : Carrier), a { fst := a_1, snd := a_2 }

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    a { fst := a_1, snd := a_2 }

Logical form (Lean):

```lean
def PredicateSetRelation.toEndorelation
    {Carrier : Type u} :
    PredicateSetRelation Carrier → LRA.Relation.Endorelation Carrier :=
  fun relation left right => (left, right) ∈ relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def PredicateSetRelation.toEndorelation
    {Carrier : Type u} :
    PredicateSetRelation Carrier → LRA.Relation.Endorelation Carrier :=
  fun relation left right => (left, right) ∈ relation

/--
`PredicateSetRelation.ofEndorelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (a : LRA.Relation.Endorelation Carrier) (a_1 : Prod Carrier Carrier), a a_1.fst a_1.snd

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    a a_1.1 a_1.2

Logical form (Lean):

```lean
def PredicateSetRelation.ofEndorelation
    {Carrier : Type u} :
    LRA.Relation.Endorelation Carrier → PredicateSetRelation Carrier :=
  fun relation => { pair | relation pair.1 pair.2 }
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def PredicateSetRelation.ofEndorelation
    {Carrier : Type u} :
    LRA.Relation.Endorelation Carrier → PredicateSetRelation Carrier :=
  fun relation => { pair | relation pair.1 pair.2 }

end LRA.Relation.Constructions.Mathlib
