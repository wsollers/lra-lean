import LRA.Set.Constructions.ZFCSet.Instances
import LRA.Set.Interface.Laws.Subset

namespace LRA.Set.Constructions.ZFCSet

/--
`SubsetReflexive` TODO

Predicate logic:

  ∀ A : Set, A ⊆ A

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSubset.1 A A

Logical form (Lean):

```lean
theorem SubsetReflexive : ∀ A : Set, A ⊆ A
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
theorem SubsetReflexive : ∀ A : Set, A ⊆ A := by
  sorry

/--
`SubsetTransitive` TODO

Predicate logic:

  ∀ A B C : Set, A ⊆ B → B ⊆ C → A ⊆ C

Predicate logic (unfolded):

  ∀ (A B C : LRA.Set.Constructions.ZFCSet.Set), (LRA.Set.Constructions.ZFCSet.instHasSubset.1 A B ∧ LRA.Set.Constructions.ZFCSet.instHasSubset.1 B C) → LRA.Set.Constructions.ZFCSet.instHasSubset.1 A C

Logical form (Lean):

```lean
theorem SubsetTransitive :
    ∀ A B C : Set, A ⊆ B → B ⊆ C → A ⊆ C
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
    ∀ A B C : Set, A ⊆ B → B ⊆ C → A ⊆ C := by
  sorry

/--
`SetEqualityIffMutualSubset` TODO

Predicate logic:

  ∀ A B : Set, A = B ↔ A ⊆ B ∧ B ⊆ A

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), A = B ↔ (LRA.Set.Constructions.ZFCSet.instHasSubset.1 A B ∧ LRA.Set.Constructions.ZFCSet.instHasSubset.1 B A)

Logical form (Lean):

```lean
theorem SetEqualityIffMutualSubset :
    ∀ A B : Set, A = B ↔ A ⊆ B ∧ B ⊆ A
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
    ∀ A B : Set, A = B ↔ A ⊆ B ∧ B ⊆ A := by
  sorry

end LRA.Set.Constructions.ZFCSet
