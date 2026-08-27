import LRA.Set.Constructions.TypeSet.Instances
import LRA.Set.Interface.Laws.Intersection

namespace LRA.Set.Constructions.TypeSet

universe u

variable {Alpha : Type u}

/--
`IntersectionCommutative` TODO

Predicate logic:

  ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∩ B = B ∩ A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.Constructions.TypeSet.instInter.1 A B = LRA.Set.Constructions.TypeSet.instInter.1 B A

Logical form (Lean):

```lean
theorem IntersectionCommutative :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∩ B = B ∩ A
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
theorem IntersectionCommutative :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∩ B = B ∩ A := by
  sorry

/--
`IntersectionAssociative` TODO

Predicate logic:

  ∀ A B C : LRA.Set.Constructions.TypeSet Alpha, (A ∩ B) ∩ C = A ∩ (B ∩ C)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B C : Alpha → Prop), LRA.Set.Constructions.TypeSet.instInter.1 (LRA.Set.Constructions.TypeSet.instInter.1 A B) C = LRA.Set.Constructions.TypeSet.instInter.1 A (LRA.Set.Constructions.TypeSet.instInter.1 B C)

Logical form (Lean):

```lean
theorem IntersectionAssociative :
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha, (A ∩ B) ∩ C = A ∩ (B ∩ C)
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
theorem IntersectionAssociative :
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha, (A ∩ B) ∩ C = A ∩ (B ∩ C) := by
  sorry

/--
`EmptyIntersection` TODO

Predicate logic:

  ∀ A : LRA.Set.Constructions.TypeSet Alpha, ∅ ∈ LRA.Set.Constructions.TypeSet Alpha ∩ A = ∅ ∈ LRA.Set.Constructions.TypeSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.Constructions.TypeSet.instInter.1 LRA.Set.Constructions.TypeSet.instEmptyCollection.1 A = LRA.Set.Constructions.TypeSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem EmptyIntersection :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      (∅ : LRA.Set.Constructions.TypeSet Alpha) ∩ A = (∅ : LRA.Set.Constructions.TypeSet Alpha)
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
theorem EmptyIntersection :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      (∅ : LRA.Set.Constructions.TypeSet Alpha) ∩ A = (∅ : LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

/--
`IntersectionEmpty` TODO

Predicate logic:

  ∀ A : LRA.Set.Constructions.TypeSet Alpha, A ∩ ∅ ∈ LRA.Set.Constructions.TypeSet Alpha = ∅ ∈ LRA.Set.Constructions.TypeSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.Constructions.TypeSet.instInter.1 A LRA.Set.Constructions.TypeSet.instEmptyCollection.1 = LRA.Set.Constructions.TypeSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem IntersectionEmpty :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A ∩ (∅ : LRA.Set.Constructions.TypeSet Alpha) = (∅ : LRA.Set.Constructions.TypeSet Alpha)
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
theorem IntersectionEmpty :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A ∩ (∅ : LRA.Set.Constructions.TypeSet Alpha) = (∅ : LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

/--
`IntersectionIdempotent` TODO

Predicate logic:

  ∀ A : LRA.Set.Constructions.TypeSet Alpha, A ∩ A = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.Constructions.TypeSet.instInter.1 A A = A

Logical form (Lean):

```lean
theorem IntersectionIdempotent :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha, A ∩ A = A
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
theorem IntersectionIdempotent :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha, A ∩ A = A := by
  sorry

/--
`IntersectionMonotone` TODO

Predicate logic:

  ∀ A₁ A₂ B₁ B₂ : LRA.Set.Constructions.TypeSet Alpha, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A₁ A₂ B₁ B₂ : Alpha → Prop), (LRA.Set.Constructions.TypeSet.instHasSubset.1 A₁ A₂ ∧ LRA.Set.Constructions.TypeSet.instHasSubset.1 B₁ B₂) → LRA.Set.Constructions.TypeSet.instHasSubset.1 (LRA.Set.Constructions.TypeSet.instInter.1 A₁ B₁) (LRA.Set.Constructions.TypeSet.instInter.1 A₂ B₂)

Logical form (Lean):

```lean
theorem IntersectionMonotone :
    ∀ A₁ A₂ B₁ B₂ : LRA.Set.Constructions.TypeSet Alpha,
      A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂
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
theorem IntersectionMonotone :
    ∀ A₁ A₂ B₁ B₂ : LRA.Set.Constructions.TypeSet Alpha,
      A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂ := by
  sorry

/--
`SubsetIffIntersectionEqLeft` TODO

Predicate logic:

  ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ⊆ B ↔ A ∩ B = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.Constructions.TypeSet.instHasSubset.1 A B ↔ LRA.Set.Constructions.TypeSet.instInter.1 A B = A

Logical form (Lean):

```lean
theorem SubsetIffIntersectionEqLeft :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ⊆ B ↔ A ∩ B = A
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
theorem SubsetIffIntersectionEqLeft :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ⊆ B ↔ A ∩ B = A := by
  sorry

end LRA.Set.Constructions.TypeSet
