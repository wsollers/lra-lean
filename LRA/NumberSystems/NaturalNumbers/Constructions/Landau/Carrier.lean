import LRA.Set.Constructions.TypeSet.Definition

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.Set.Constructions

/--
`LandauElement` TODO

Predicate logic:

  Type

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Type

Logical form (Lean):

```lean
axiom LandauElement : Type
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
axiom LandauElement : Type

/--
`LandauOne` TODO

Predicate logic:

  LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement

Logical form (Lean):

```lean
axiom LandauOne : LandauElement
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
axiom LandauOne : LandauElement

/--
`LandauSuccessor` TODO

Predicate logic:

  LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement → LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement

Logical form (Lean):

```lean
axiom LandauSuccessor : LandauElement → LandauElement
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
axiom LandauSuccessor : LandauElement → LandauElement

end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
