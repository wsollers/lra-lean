import LRA.Set.Constructions.ZFCSet.Axioms.EmptySet.Uniqueness

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`TheEmptySet` TODO

Predicate logic:

  noncomputable def TheEmptySet : Set :=
    Classical.choose EmptySetExists

Predicate logic (unfolded):

  noncomputable def TheEmptySet : Set :=
    Classical.choose EmptySetExists (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheEmptySet : Set :=
  Classical.choose EmptySetExists
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
noncomputable def TheEmptySet : Set :=
  Classical.choose EmptySetExists

/--
`TheEmptySetIsEmpty` TODO

Predicate logic:

  LRA.Set.Constructions.ZFCSet.Axioms.IsEmptySet LRA.Set.Constructions.ZFCSet.Axioms.TheEmptySet

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.1 LRA.Set.Constructions.ZFCSet.Axioms.TheEmptySet x → False

Logical form (Lean):

```lean
theorem TheEmptySetIsEmpty :
    IsEmptySet TheEmptySet
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
theorem TheEmptySetIsEmpty :
    IsEmptySet TheEmptySet :=
  Classical.choose_spec EmptySetExists

end LRA.Set.Constructions.ZFCSet.Axioms
