import LRA.Set.PredicateSet.Instances
import LRA.Set.Interface.Union

namespace LRA.Set.PredicateSet

universe u

variable {Alpha : Type u}

/--
`UnionCommutative` TODO

Predicate logic:

  ∀ A B : LRA.Set.PredicateSet Alpha, A ∪ B = B ∪ A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.PredicateSet.instUnion.1 A B = LRA.Set.PredicateSet.instUnion.1 B A

Logical form (Lean):

```lean
theorem UnionCommutative :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∪ B = B ∪ A
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
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∪ B = B ∪ A := by
  sorry

/--
`UnionAssociative` TODO

Predicate logic:

  ∀ A B C : LRA.Set.PredicateSet Alpha, (A ∪ B) ∪ C = A ∪ (B ∪ C)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B C : Alpha → Prop), LRA.Set.PredicateSet.instUnion.1 (LRA.Set.PredicateSet.instUnion.1 A B) C = LRA.Set.PredicateSet.instUnion.1 A (LRA.Set.PredicateSet.instUnion.1 B C)

Logical form (Lean):

```lean
theorem UnionAssociative :
    ∀ A B C : LRA.Set.PredicateSet Alpha, (A ∪ B) ∪ C = A ∪ (B ∪ C)
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
    ∀ A B C : LRA.Set.PredicateSet Alpha, (A ∪ B) ∪ C = A ∪ (B ∪ C) := by
  sorry

/--
`EmptyUnion` TODO

Predicate logic:

  ∀ A : LRA.Set.PredicateSet Alpha, ∅ ∈ LRA.Set.PredicateSet Alpha ∪ A = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.PredicateSet.instUnion.1 LRA.Set.PredicateSet.instEmptyCollection.1 A = A

Logical form (Lean):

```lean
theorem EmptyUnion :
    ∀ A : LRA.Set.PredicateSet Alpha,
      (∅ : LRA.Set.PredicateSet Alpha) ∪ A = A
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
    ∀ A : LRA.Set.PredicateSet Alpha,
      (∅ : LRA.Set.PredicateSet Alpha) ∪ A = A := by
  sorry

/--
`UnionEmpty` TODO

Predicate logic:

  ∀ A : LRA.Set.PredicateSet Alpha, A ∪ ∅ ∈ LRA.Set.PredicateSet Alpha = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.PredicateSet.instUnion.1 A LRA.Set.PredicateSet.instEmptyCollection.1 = A

Logical form (Lean):

```lean
theorem UnionEmpty :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A ∪ (∅ : LRA.Set.PredicateSet Alpha) = A
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
    ∀ A : LRA.Set.PredicateSet Alpha,
      A ∪ (∅ : LRA.Set.PredicateSet Alpha) = A := by
  sorry

/--
`UnionIdempotent` TODO

Predicate logic:

  ∀ A : LRA.Set.PredicateSet Alpha, A ∪ A = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.PredicateSet.instUnion.1 A A = A

Logical form (Lean):

```lean
theorem UnionIdempotent :
    ∀ A : LRA.Set.PredicateSet Alpha, A ∪ A = A
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
    ∀ A : LRA.Set.PredicateSet Alpha, A ∪ A = A := by
  sorry

/--
`UnionMonotone` TODO

Predicate logic:

  ∀ A₁ A₂ B₁ B₂ : LRA.Set.PredicateSet Alpha, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A₁ A₂ B₁ B₂ : Alpha → Prop), (LRA.Set.PredicateSet.instHasSubset.1 A₁ A₂ ∧ LRA.Set.PredicateSet.instHasSubset.1 B₁ B₂) → LRA.Set.PredicateSet.instHasSubset.1 (LRA.Set.PredicateSet.instUnion.1 A₁ B₁) (LRA.Set.PredicateSet.instUnion.1 A₂ B₂)

Logical form (Lean):

```lean
theorem UnionMonotone :
    ∀ A₁ A₂ B₁ B₂ : LRA.Set.PredicateSet Alpha,
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
    ∀ A₁ A₂ B₁ B₂ : LRA.Set.PredicateSet Alpha,
      A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂ := by
  sorry

/--
`SubsetIffUnionEqRight` TODO

Predicate logic:

  ∀ A B : LRA.Set.PredicateSet Alpha, A ⊆ B ↔ A ∪ B = B

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.PredicateSet.instHasSubset.1 A B ↔ LRA.Set.PredicateSet.instUnion.1 A B = B

Logical form (Lean):

```lean
theorem SubsetIffUnionEqRight :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ⊆ B ↔ A ∪ B = B
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
    ∀ A B : LRA.Set.PredicateSet Alpha, A ⊆ B ↔ A ∪ B = B := by
  sorry

instance : UnionLaws (LRA.Set.PredicateSet Alpha) where
  UnionCommutative := LRA.Set.PredicateSet.UnionCommutative
  UnionAssociative := LRA.Set.PredicateSet.UnionAssociative
  EmptyUnion := LRA.Set.PredicateSet.EmptyUnion
  UnionEmpty := LRA.Set.PredicateSet.UnionEmpty
  UnionIdempotent := LRA.Set.PredicateSet.UnionIdempotent
  UnionMonotone := LRA.Set.PredicateSet.UnionMonotone
  SubsetIffUnionEqRight := LRA.Set.PredicateSet.SubsetIffUnionEqRight

end LRA.Set.PredicateSet
