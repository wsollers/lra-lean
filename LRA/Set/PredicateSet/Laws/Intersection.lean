import LRA.Set.PredicateSet.Instances
import LRA.Set.Interface.Intersection

namespace LRA.Set.PredicateSet

universe u

variable {Alpha : Type u}

/--
`IntersectionCommutative` TODO

Predicate logic:

  ∀ A B : LRA.Set.PredicateSet Alpha, A ∩ B = B ∩ A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.PredicateSet.instInter.1 A B = LRA.Set.PredicateSet.instInter.1 B A

Logical form (Lean):

```lean
theorem IntersectionCommutative :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∩ B = B ∩ A
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
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∩ B = B ∩ A := by
  sorry

/--
`IntersectionAssociative` TODO

Predicate logic:

  ∀ A B C : LRA.Set.PredicateSet Alpha, (A ∩ B) ∩ C = A ∩ (B ∩ C)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B C : Alpha → Prop), LRA.Set.PredicateSet.instInter.1 (LRA.Set.PredicateSet.instInter.1 A B) C = LRA.Set.PredicateSet.instInter.1 A (LRA.Set.PredicateSet.instInter.1 B C)

Logical form (Lean):

```lean
theorem IntersectionAssociative :
    ∀ A B C : LRA.Set.PredicateSet Alpha, (A ∩ B) ∩ C = A ∩ (B ∩ C)
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
    ∀ A B C : LRA.Set.PredicateSet Alpha, (A ∩ B) ∩ C = A ∩ (B ∩ C) := by
  sorry

/--
`EmptyIntersection` TODO

Predicate logic:

  ∀ A : LRA.Set.PredicateSet Alpha, ∅ ∈ LRA.Set.PredicateSet Alpha ∩ A = ∅ ∈ LRA.Set.PredicateSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.PredicateSet.instInter.1 LRA.Set.PredicateSet.instEmptyCollection.1 A = LRA.Set.PredicateSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem EmptyIntersection :
    ∀ A : LRA.Set.PredicateSet Alpha,
      (∅ : LRA.Set.PredicateSet Alpha) ∩ A = (∅ : LRA.Set.PredicateSet Alpha)
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
    ∀ A : LRA.Set.PredicateSet Alpha,
      (∅ : LRA.Set.PredicateSet Alpha) ∩ A = (∅ : LRA.Set.PredicateSet Alpha) := by
  sorry

/--
`IntersectionEmpty` TODO

Predicate logic:

  ∀ A : LRA.Set.PredicateSet Alpha, A ∩ ∅ ∈ LRA.Set.PredicateSet Alpha = ∅ ∈ LRA.Set.PredicateSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.PredicateSet.instInter.1 A LRA.Set.PredicateSet.instEmptyCollection.1 = LRA.Set.PredicateSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem IntersectionEmpty :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A ∩ (∅ : LRA.Set.PredicateSet Alpha) = (∅ : LRA.Set.PredicateSet Alpha)
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
    ∀ A : LRA.Set.PredicateSet Alpha,
      A ∩ (∅ : LRA.Set.PredicateSet Alpha) = (∅ : LRA.Set.PredicateSet Alpha) := by
  sorry

/--
`IntersectionIdempotent` TODO

Predicate logic:

  ∀ A : LRA.Set.PredicateSet Alpha, A ∩ A = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.PredicateSet.instInter.1 A A = A

Logical form (Lean):

```lean
theorem IntersectionIdempotent :
    ∀ A : LRA.Set.PredicateSet Alpha, A ∩ A = A
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
    ∀ A : LRA.Set.PredicateSet Alpha, A ∩ A = A := by
  sorry

/--
`IntersectionMonotone` TODO

Predicate logic:

  ∀ A₁ A₂ B₁ B₂ : LRA.Set.PredicateSet Alpha, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A₁ A₂ B₁ B₂ : Alpha → Prop), (LRA.Set.PredicateSet.instHasSubset.1 A₁ A₂ ∧ LRA.Set.PredicateSet.instHasSubset.1 B₁ B₂) → LRA.Set.PredicateSet.instHasSubset.1 (LRA.Set.PredicateSet.instInter.1 A₁ B₁) (LRA.Set.PredicateSet.instInter.1 A₂ B₂)

Logical form (Lean):

```lean
theorem IntersectionMonotone :
    ∀ A₁ A₂ B₁ B₂ : LRA.Set.PredicateSet Alpha,
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
    ∀ A₁ A₂ B₁ B₂ : LRA.Set.PredicateSet Alpha,
      A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂ := by
  sorry

/--
`SubsetIffIntersectionEqLeft` TODO

Predicate logic:

  ∀ A B : LRA.Set.PredicateSet Alpha, A ⊆ B ↔ A ∩ B = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.PredicateSet.instHasSubset.1 A B ↔ LRA.Set.PredicateSet.instInter.1 A B = A

Logical form (Lean):

```lean
theorem SubsetIffIntersectionEqLeft :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ⊆ B ↔ A ∩ B = A
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
    ∀ A B : LRA.Set.PredicateSet Alpha, A ⊆ B ↔ A ∩ B = A := by
  sorry

instance : IntersectionLaws (LRA.Set.PredicateSet Alpha) where
  IntersectionCommutative := LRA.Set.PredicateSet.IntersectionCommutative
  IntersectionAssociative := LRA.Set.PredicateSet.IntersectionAssociative
  EmptyIntersection := LRA.Set.PredicateSet.EmptyIntersection
  IntersectionEmpty := LRA.Set.PredicateSet.IntersectionEmpty
  IntersectionIdempotent := LRA.Set.PredicateSet.IntersectionIdempotent
  IntersectionMonotone := LRA.Set.PredicateSet.IntersectionMonotone
  SubsetIffIntersectionEqLeft :=
    LRA.Set.PredicateSet.SubsetIffIntersectionEqLeft

end LRA.Set.PredicateSet
