import LRA.Set.Constructions.ZFCSet.Instances
import LRA.Set.Interface.Laws.Intersection

namespace LRA.Set.Constructions.ZFCSet

/--
`IntersectionCommutative` TODO

Predicate logic:

  ∀ A B : Set, A ∩ B = B ∩ A

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instInter.1 A B = LRA.Set.Constructions.ZFCSet.instInter.1 B A

Logical form (Lean):

```lean
theorem IntersectionCommutative : ∀ A B : Set, A ∩ B = B ∩ A
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
theorem IntersectionCommutative : ∀ A B : Set, A ∩ B = B ∩ A := by
  sorry

/--
`IntersectionAssociative` TODO

Predicate logic:

  ∀ A B C : Set, (A ∩ B) ∩ C = A ∩ (B ∩ C)

Predicate logic (unfolded):

  ∀ (A B C : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instInter.1 (LRA.Set.Constructions.ZFCSet.instInter.1 A B) C = LRA.Set.Constructions.ZFCSet.instInter.1 A (LRA.Set.Constructions.ZFCSet.instInter.1 B C)

Logical form (Lean):

```lean
theorem IntersectionAssociative :
    ∀ A B C : Set, (A ∩ B) ∩ C = A ∩ (B ∩ C)
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
    ∀ A B C : Set, (A ∩ B) ∩ C = A ∩ (B ∩ C) := by
  sorry

/--
`EmptyIntersection` TODO

Predicate logic:

  ∀ A : Set, ∅ ∈ Set ∩ A = ∅ ∈ Set

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instInter.1 LRA.Set.Constructions.ZFCSet.instEmptyCollection.1 A = LRA.Set.Constructions.ZFCSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem EmptyIntersection : ∀ A : Set, (∅ : Set) ∩ A = (∅ : Set)
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
theorem EmptyIntersection : ∀ A : Set, (∅ : Set) ∩ A = (∅ : Set) := by
  sorry

/--
`IntersectionEmpty` TODO

Predicate logic:

  ∀ A : Set, A ∩ ∅ ∈ Set = ∅ ∈ Set

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instInter.1 A LRA.Set.Constructions.ZFCSet.instEmptyCollection.1 = LRA.Set.Constructions.ZFCSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem IntersectionEmpty : ∀ A : Set, A ∩ (∅ : Set) = (∅ : Set)
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
theorem IntersectionEmpty : ∀ A : Set, A ∩ (∅ : Set) = (∅ : Set) := by
  sorry

/--
`IntersectionIdempotent` TODO

Predicate logic:

  ∀ A : Set, A ∩ A = A

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instInter.1 A A = A

Logical form (Lean):

```lean
theorem IntersectionIdempotent : ∀ A : Set, A ∩ A = A
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
theorem IntersectionIdempotent : ∀ A : Set, A ∩ A = A := by
  sorry

/--
`IntersectionMonotone` TODO

Predicate logic:

  ∀ A₁ A₂ B₁ B₂ : Set, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂

Predicate logic (unfolded):

  ∀ (A₁ A₂ B₁ B₂ : LRA.Set.Constructions.ZFCSet.Set), (LRA.Set.Constructions.ZFCSet.instHasSubset.1 A₁ A₂ ∧ LRA.Set.Constructions.ZFCSet.instHasSubset.1 B₁ B₂) → LRA.Set.Constructions.ZFCSet.instHasSubset.1 (LRA.Set.Constructions.ZFCSet.instInter.1 A₁ B₁) (LRA.Set.Constructions.ZFCSet.instInter.1 A₂ B₂)

Logical form (Lean):

```lean
theorem IntersectionMonotone :
    ∀ A₁ A₂ B₁ B₂ : Set, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂
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
    ∀ A₁ A₂ B₁ B₂ : Set, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂ := by
  sorry

/--
`SubsetIffIntersectionEqLeft` TODO

Predicate logic:

  ∀ A B : Set, A ⊆ B ↔ A ∩ B = A

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSubset.1 A B ↔ LRA.Set.Constructions.ZFCSet.instInter.1 A B = A

Logical form (Lean):

```lean
theorem SubsetIffIntersectionEqLeft :
    ∀ A B : Set, A ⊆ B ↔ A ∩ B = A
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
    ∀ A B : Set, A ⊆ B ↔ A ∩ B = A := by
  sorry

instance : IntersectionLaws Set where
  IntersectionCommutative := IntersectionCommutative
  IntersectionAssociative := IntersectionAssociative
  EmptyIntersection := EmptyIntersection
  IntersectionEmpty := IntersectionEmpty
  IntersectionIdempotent := IntersectionIdempotent
  IntersectionMonotone := IntersectionMonotone
  SubsetIffIntersectionEqLeft := SubsetIffIntersectionEqLeft

end LRA.Set.Constructions.ZFCSet
