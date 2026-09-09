import LRA.Set.Constructions.TypeSet.Instances
import LRA.Set.Interface.Laws.Union

namespace LRA.Set.Constructions.TypeSet

universe u

variable {Alpha : Type u}

/--
`UnionCommutative` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeA ∪ B = LRA.Set.Constructions.TypeB ∪ A

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeA ∪ B = LRA.Set.Constructions.TypeB ∪ A

Logical form (Lean):

```lean
theorem UnionCommutative :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∪ B = B ∪ A
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
theorem UnionCommutative :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∪ B = B ∪ A := by
  sorry

/--
`UnionAssociative` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B C : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA ∪ B ∪ C = LRA.Set.Constructions.TypeA ∪ LRA.Set.Constructions.TypeB ∪ C

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA ∪ B ∪ C = LRA.Set.Constructions.TypeA ∪ LRA.Set.Constructions.TypeB ∪ C

Logical form (Lean):

```lean
theorem UnionAssociative :
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha, (A ∪ B) ∪ C = A ∪ (B ∪ C)
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
theorem UnionAssociative :
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha, (A ∪ B) ∪ C = A ∪ (B ∪ C) := by
  sorry

/--
`EmptyUnion` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeSet.instEmptyCollection.emptyCollection ∪ A = A

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeSet.instEmptyCollection.1 ∪ A = A

Logical form (Lean):

```lean
theorem EmptyUnion :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      (∅ : LRA.Set.Constructions.TypeSet Alpha) ∪ A = A
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
theorem EmptyUnion :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      (∅ : LRA.Set.Constructions.TypeSet Alpha) ∪ A = A := by
  sorry

/--
`UnionEmpty` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeA ∪ LRA.Set.Constructions.TypeSet.instEmptyCollection.emptyCollection = A

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeA ∪ LRA.Set.Constructions.TypeSet.instEmptyCollection.1 = A

Logical form (Lean):

```lean
theorem UnionEmpty :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A ∪ (∅ : LRA.Set.Constructions.TypeSet Alpha) = A
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
theorem UnionEmpty :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A ∪ (∅ : LRA.Set.Constructions.TypeSet Alpha) = A := by
  sorry

/--
`UnionIdempotent` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeA ∪ A = A

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeA ∪ A = A

Logical form (Lean):

```lean
theorem UnionIdempotent :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha, A ∪ A = A
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
theorem UnionIdempotent :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha, A ∪ A = A := by
  sorry

/--
`UnionMonotone` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A₁ A₂ B₁ B₂ : LRA.Set.Constructions.TypeSet Alpha), (LRA.Set.Constructions.TypeSet.instHasSubset.Subset A₁ A₂ ∧ LRA.Set.Constructions.TypeSet.instHasSubset.Subset B₁ B₂) → LRA.Set.Constructions.TypeSet.instHasSubset.Subset (LRA.Set.Constructions.TypeA₁ ∪ B₁) (LRA.Set.Constructions.TypeA₂ ∪ B₂)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    (LRA.Set.Constructions.TypeSet.instHasSubset.1 A₁ A₂ ∧ LRA.Set.Constructions.TypeSet.instHasSubset.1 B₁ B₂) → LRA.Set.Constructions.TypeSet.instHasSubset.1 (LRA.Set.Constructions.TypeA₁ ∪ B₁) (LRA.Set.Constructions.TypeA₂ ∪ B₂)

Logical form (Lean):

```lean
theorem UnionMonotone :
    ∀ A₁ A₂ B₁ B₂ : LRA.Set.Constructions.TypeSet Alpha,
      A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂
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
theorem UnionMonotone :
    ∀ A₁ A₂ B₁ B₂ : LRA.Set.Constructions.TypeSet Alpha,
      A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂ := by
  sorry

/--
`SubsetIffUnionEqRight` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeSet.instHasSubset.Subset A B ↔ LRA.Set.Constructions.TypeA ∪ B = B

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeSet.instHasSubset.Subset A B ↔ LRA.Set.Constructions.TypeA ∪ B = B

Logical form (Lean):

```lean
theorem SubsetIffUnionEqRight :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ⊆ B ↔ A ∪ B = B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem SubsetIffUnionEqRight :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ⊆ B ↔ A ∪ B = B := by
  sorry

end LRA.Set.Constructions.TypeSet
