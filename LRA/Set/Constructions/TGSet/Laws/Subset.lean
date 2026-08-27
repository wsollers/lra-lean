import LRA.Set.Constructions.TGSet.Instances
import LRA.Set.Interface.Laws.Subset

namespace LRA.Set.Constructions.TGSet

/--
`SubsetReflexive` TODO

Predicate logic:

  forall A : Set, A ⊆ A

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instHasSubset.1 A A

Logical form (Lean):

```lean
theorem SubsetReflexive : forall A : Set, A ⊆ A
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
theorem SubsetReflexive : forall A : Set, A ⊆ A := by
  sorry

/--
`SubsetTransitive` TODO

Predicate logic:

  forall A B C : Set, A ⊆ B -> B ⊆ C -> A ⊆ C

Predicate logic (unfolded):

  ∀ (A B C : LRA.Set.Constructions.TGSet.Set), (LRA.Set.Constructions.TGSet.instHasSubset.1 A B ∧ LRA.Set.Constructions.TGSet.instHasSubset.1 B C) → LRA.Set.Constructions.TGSet.instHasSubset.1 A C

Logical form (Lean):

```lean
theorem SubsetTransitive :
    forall A B C : Set, A ⊆ B -> B ⊆ C -> A ⊆ C
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
theorem SubsetTransitive :
    forall A B C : Set, A ⊆ B -> B ⊆ C -> A ⊆ C := by
  sorry

/--
`SetEqualityIffMutualSubset` TODO

Predicate logic:

  forall A B : Set, A = B <-> A ⊆ B ∧ B ⊆ A

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.TGSet.Set), A = B ↔ (LRA.Set.Constructions.TGSet.instHasSubset.1 A B ∧ LRA.Set.Constructions.TGSet.instHasSubset.1 B A)

Logical form (Lean):

```lean
theorem SetEqualityIffMutualSubset :
    forall A B : Set, A = B <-> A ⊆ B /\ B ⊆ A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem SetEqualityIffMutualSubset :
    forall A B : Set, A = B <-> A ⊆ B /\ B ⊆ A := by
  sorry

end LRA.Set.Constructions.TGSet
