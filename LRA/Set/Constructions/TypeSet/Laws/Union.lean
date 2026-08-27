import LRA.Set.Constructions.TypeSet.Instances
import LRA.Set.Interface.Union

namespace LRA.Set.Constructions.TypeSet

universe u

variable {Alpha : Type u}

/--
`UnionCommutative` TODO

Predicate logic:

  ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∪ B = B ∪ A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.Constructions.TypeSet.instUnion.1 A B = LRA.Set.Constructions.TypeSet.instUnion.1 B A

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

  ∀ A B C : LRA.Set.Constructions.TypeSet Alpha, (A ∪ B) ∪ C = A ∪ (B ∪ C)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B C : Alpha → Prop), LRA.Set.Constructions.TypeSet.instUnion.1 (LRA.Set.Constructions.TypeSet.instUnion.1 A B) C = LRA.Set.Constructions.TypeSet.instUnion.1 A (LRA.Set.Constructions.TypeSet.instUnion.1 B C)

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

  ∀ A : LRA.Set.Constructions.TypeSet Alpha, ∅ ∈ LRA.Set.Constructions.TypeSet Alpha ∪ A = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.Constructions.TypeSet.instUnion.1 LRA.Set.Constructions.TypeSet.instEmptyCollection.1 A = A

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

  ∀ A : LRA.Set.Constructions.TypeSet Alpha, A ∪ ∅ ∈ LRA.Set.Constructions.TypeSet Alpha = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.Constructions.TypeSet.instUnion.1 A LRA.Set.Constructions.TypeSet.instEmptyCollection.1 = A

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

  ∀ A : LRA.Set.Constructions.TypeSet Alpha, A ∪ A = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.Constructions.TypeSet.instUnion.1 A A = A

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

  ∀ A₁ A₂ B₁ B₂ : LRA.Set.Constructions.TypeSet Alpha, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A₁ A₂ B₁ B₂ : Alpha → Prop), (LRA.Set.Constructions.TypeSet.instHasSubset.1 A₁ A₂ ∧ LRA.Set.Constructions.TypeSet.instHasSubset.1 B₁ B₂) → LRA.Set.Constructions.TypeSet.instHasSubset.1 (LRA.Set.Constructions.TypeSet.instUnion.1 A₁ B₁) (LRA.Set.Constructions.TypeSet.instUnion.1 A₂ B₂)

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

  ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ⊆ B ↔ A ∪ B = B

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.Constructions.TypeSet.instHasSubset.1 A B ↔ LRA.Set.Constructions.TypeSet.instUnion.1 A B = B

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
