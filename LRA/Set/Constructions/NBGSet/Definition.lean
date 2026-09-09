import LRA.Set.Constructions.NBGSet.Primitives

namespace LRA.Set.Constructions.NBG

open LRA.Set.Constructions

/--
`Set` TODO

Predicate logic:

  abbrev Set := NBGSet

Predicate logic (unfolded):

  abbrev Set := NBGSet (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Set := NBGSet
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
abbrev Set := NBGSet

/--
`Class` TODO

Predicate logic:

  abbrev Class := NBGClass

Predicate logic (unfolded):

  abbrev Class := NBGClass (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Class := NBGClass
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
abbrev Class := NBGClass

/--
`ClassOfSet` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Set → LRA.Set.Constructions.NBG.Class

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.NBG.Set → LRA.Set.Constructions.NBG.Class

Logical form (Lean):

```lean
axiom ClassOfSet : Set → Class
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
axiom ClassOfSet : Set → Class

/--
`OrderedPair` TODO

Predicate logic:

  LRA.Set.Constructions.NBG.Set → LRA.Set.Constructions.NBG.Set → LRA.Set.Constructions.NBG.Set

Predicate logic (unfolded):

  LRA.Set.Constructions.NBG.Set → LRA.Set.Constructions.NBG.Set → LRA.Set.Constructions.NBG.Set (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
axiom OrderedPair : Set → Set → Set
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
axiom OrderedPair : Set → Set → Set

end LRA.Set.Constructions.NBG
