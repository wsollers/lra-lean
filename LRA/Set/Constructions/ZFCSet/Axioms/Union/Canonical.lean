import LRA.Set.Constructions.ZFCSet.Axioms.Union.Uniqueness
import LRA.Set.Constructions.ZFCSet.Axioms.Pairing.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`TheUnionOver` TODO

Predicate logic:

  noncomputable def TheUnionOver (A : Set) : Set :=
    Classical.choose (UnionOverExists A)

Predicate logic (unfolded):

  noncomputable def TheUnionOver (A : Set) : Set :=
    Classical.choose (UnionOverExists A) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheUnionOver (A : Set) : Set :=
  Classical.choose (UnionOverExists A)
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
noncomputable def TheUnionOver (A : Set) : Set :=
  Classical.choose (UnionOverExists A)

/--
`TheUnionOverIsUnionOf` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.ZFCSet.Axioms.IsUnionOf A (LRA.Set.Constructions.ZFCSet.Axioms.TheUnionOver A)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsUnionOf A) ⋯).1 x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipZFCSet.1 A B ∧ LRA.Set.Constructions.instMembershipZFCSet.1 B x)

Logical form (Lean):

```lean
theorem TheUnionOverIsUnionOf (A : Set) :
    IsUnionOf A (TheUnionOver A)
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
theorem TheUnionOverIsUnionOf (A : Set) :
    IsUnionOf A (TheUnionOver A) := by
  sorry

/--
`TheUnion` TODO

Predicate logic:

  noncomputable def TheUnion (A B : Set) : Set :=
    TheUnionOver (PairSet A B)

Predicate logic (unfolded):

  noncomputable def TheUnion (A B : Set) : Set :=
    TheUnionOver (PairSet A B) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheUnion (A B : Set) : Set :=
  TheUnionOver (PairSet A B)
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
noncomputable def TheUnion (A B : Set) : Set :=
  TheUnionOver (PairSet A B)

end LRA.Set.Constructions.ZFCSet.Axioms
