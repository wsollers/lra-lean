import LRA.Set.Constructions.TypeSet.Instances
import LRA.Set.Interface.Laws.Subset

namespace LRA.Set.Constructions.TypeSet

universe u

variable {Alpha : Type u}

/--
`SubsetReflexive` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeSet.instHasSubset.Subset A A

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeSet.instHasSubset.1 A A

Logical form (Lean):

```lean
theorem SubsetReflexive :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha, A ⊆ A
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
theorem SubsetReflexive :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha, A ⊆ A := by
  sorry

/--
`SubsetTransitive` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B C : LRA.Set.Constructions.TypeSet Alpha), (LRA.Set.Constructions.TypeSet.instHasSubset.Subset A B ∧ LRA.Set.Constructions.TypeSet.instHasSubset.Subset B C) → LRA.Set.Constructions.TypeSet.instHasSubset.Subset A C

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    (LRA.Set.Constructions.TypeSet.instHasSubset.1 A B ∧ LRA.Set.Constructions.TypeSet.instHasSubset.1 B C) → LRA.Set.Constructions.TypeSet.instHasSubset.1 A C

Logical form (Lean):

```lean
theorem SubsetTransitive :
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha, A ⊆ B → B ⊆ C → A ⊆ C
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
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha, A ⊆ B → B ⊆ C → A ⊆ C := by
  sorry

/--
`SetEqualityIffMutualSubset` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha), A = B ↔ (LRA.Set.Constructions.TypeSet.instHasSubset.Subset A B ∧ LRA.Set.Constructions.TypeSet.instHasSubset.Subset B A)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    A = B ↔ (LRA.Set.Constructions.TypeSet.instHasSubset.Subset A B ∧ LRA.Set.Constructions.TypeSet.instHasSubset.Subset B A)

Logical form (Lean):

```lean
theorem SetEqualityIffMutualSubset :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A = B ↔ A ⊆ B ∧ B ⊆ A
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
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A = B ↔ A ⊆ B ∧ B ⊆ A := by
  sorry

end LRA.Set.Constructions.TypeSet
