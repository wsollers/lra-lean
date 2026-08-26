import LRA.Set.Constructions.TypeSet.Instances
import LRA.Set.Interface.Subset

namespace LRA.Set.Constructions.TypeSet

universe u

variable {Alpha : Type u}

/--
`SubsetReflexive` TODO

Predicate logic:

  ∀ A : LRA.Set.Constructions.TypeSet Alpha, A ⊆ A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.Constructions.TypeSet.instHasSubset.1 A A

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

  ∀ A B C : LRA.Set.Constructions.TypeSet Alpha, A ⊆ B → B ⊆ C → A ⊆ C

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B C : Alpha → Prop), (LRA.Set.Constructions.TypeSet.instHasSubset.1 A B ∧ LRA.Set.Constructions.TypeSet.instHasSubset.1 B C) → LRA.Set.Constructions.TypeSet.instHasSubset.1 A C

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

  ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A = B ↔ A ⊆ B ∧ B ⊆ A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), A = B ↔ (LRA.Set.Constructions.TypeSet.instHasSubset.1 A B ∧ LRA.Set.Constructions.TypeSet.instHasSubset.1 B A)

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

instance : SubsetLaws (LRA.Set.Constructions.TypeSet Alpha) where
  SubsetReflexive := LRA.Set.Constructions.TypeSet.SubsetReflexive
  SubsetTransitive := LRA.Set.Constructions.TypeSet.SubsetTransitive
  SetEqualityIffMutualSubset :=
    LRA.Set.Constructions.TypeSet.SetEqualityIffMutualSubset

end LRA.Set.Constructions.TypeSet
