import LRA.Set.PredicateSet.Instances
import LRA.Set.Interface.Subset

namespace LRA.Set.PredicateSet

universe u

variable {Alpha : Type u}

/--
`SubsetReflexive` TODO

Predicate logic:

  ∀ A : LRA.Set.PredicateSet Alpha, A ⊆ A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.PredicateSet.instHasSubset.1 A A

Logical form (Lean):

```lean
theorem SubsetReflexive :
    ∀ A : LRA.Set.PredicateSet Alpha, A ⊆ A
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
    ∀ A : LRA.Set.PredicateSet Alpha, A ⊆ A := by
  sorry

/--
`SubsetTransitive` TODO

Predicate logic:

  ∀ A B C : LRA.Set.PredicateSet Alpha, A ⊆ B → B ⊆ C → A ⊆ C

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B C : Alpha → Prop), (LRA.Set.PredicateSet.instHasSubset.1 A B ∧ LRA.Set.PredicateSet.instHasSubset.1 B C) → LRA.Set.PredicateSet.instHasSubset.1 A C

Logical form (Lean):

```lean
theorem SubsetTransitive :
    ∀ A B C : LRA.Set.PredicateSet Alpha, A ⊆ B → B ⊆ C → A ⊆ C
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
    ∀ A B C : LRA.Set.PredicateSet Alpha, A ⊆ B → B ⊆ C → A ⊆ C := by
  sorry

/--
`SetEqualityIffMutualSubset` TODO

Predicate logic:

  ∀ A B : LRA.Set.PredicateSet Alpha, A = B ↔ A ⊆ B ∧ B ⊆ A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), A = B ↔ (LRA.Set.PredicateSet.instHasSubset.1 A B ∧ LRA.Set.PredicateSet.instHasSubset.1 B A)

Logical form (Lean):

```lean
theorem SetEqualityIffMutualSubset :
    ∀ A B : LRA.Set.PredicateSet Alpha, A = B ↔ A ⊆ B ∧ B ⊆ A
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
    ∀ A B : LRA.Set.PredicateSet Alpha, A = B ↔ A ⊆ B ∧ B ⊆ A := by
  sorry

instance : SubsetLaws (LRA.Set.PredicateSet Alpha) where
  SubsetReflexive := LRA.Set.PredicateSet.SubsetReflexive
  SubsetTransitive := LRA.Set.PredicateSet.SubsetTransitive
  SetEqualityIffMutualSubset :=
    LRA.Set.PredicateSet.SetEqualityIffMutualSubset

end LRA.Set.PredicateSet
