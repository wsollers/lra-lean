import LRA.Set.TGSet.Instances
import LRA.Set.Interface.Intersection

namespace LRA.Set.TGSet

/--
`IntersectionCommutative` TODO

Predicate logic:

  forall A B : Set, A ∩ B = B ∩ A

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.TGSet.Set), LRA.Set.TGSet.instInter.1 A B = LRA.Set.TGSet.instInter.1 B A

Logical form (Lean):

```lean
theorem IntersectionCommutative : forall A B : Set, A ∩ B = B ∩ A
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
theorem IntersectionCommutative : forall A B : Set, A ∩ B = B ∩ A := by
  sorry

/--
`IntersectionAssociative` TODO

Predicate logic:

  forall A B C : Set, (A ∩ B) ∩ C = A ∩ (B ∩ C)

Predicate logic (unfolded):

  ∀ (A B C : LRA.Set.TGSet.Set), LRA.Set.TGSet.instInter.1 (LRA.Set.TGSet.instInter.1 A B) C = LRA.Set.TGSet.instInter.1 A (LRA.Set.TGSet.instInter.1 B C)

Logical form (Lean):

```lean
theorem IntersectionAssociative :
    forall A B C : Set, (A ∩ B) ∩ C = A ∩ (B ∩ C)
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
    forall A B C : Set, (A ∩ B) ∩ C = A ∩ (B ∩ C) := by
  sorry

/--
`IntersectionIdempotent` TODO

Predicate logic:

  forall A : Set, A ∩ A = A

Predicate logic (unfolded):

  ∀ (A : LRA.Set.TGSet.Set), LRA.Set.TGSet.instInter.1 A A = A

Logical form (Lean):

```lean
theorem IntersectionIdempotent : forall A : Set, A ∩ A = A
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
theorem IntersectionIdempotent : forall A : Set, A ∩ A = A := by
  sorry

/--
`EmptyIntersection` TODO

Predicate logic:

  forall A : Set, ∅ ∈ Set ∩ A = ∅ ∈ Set

Predicate logic (unfolded):

  ∀ (A : LRA.Set.TGSet.Set), LRA.Set.TGSet.instInter.1 LRA.Set.TGSet.instEmptyCollection.1 A = LRA.Set.TGSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem EmptyIntersection : forall A : Set, (∅ : Set) ∩ A = (∅ : Set)
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
theorem EmptyIntersection : forall A : Set, (∅ : Set) ∩ A = (∅ : Set) := by
  sorry

/--
`IntersectionEmpty` TODO

Predicate logic:

  forall A : Set, A ∩ ∅ ∈ Set = ∅ ∈ Set

Predicate logic (unfolded):

  ∀ (A : LRA.Set.TGSet.Set), LRA.Set.TGSet.instInter.1 A LRA.Set.TGSet.instEmptyCollection.1 = LRA.Set.TGSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem IntersectionEmpty : forall A : Set, A ∩ (∅ : Set) = (∅ : Set)
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
theorem IntersectionEmpty : forall A : Set, A ∩ (∅ : Set) = (∅ : Set) := by
  sorry

/--
`IntersectionMonotone` TODO

Predicate logic:

  forall A1 A2 B1 B2 : Set, A1 ⊆ A2 -> B1 ⊆ B2 -> A1 ∩ B1 ⊆ A2 ∩ B2

Predicate logic (unfolded):

  ∀ (A1 A2 B1 B2 : LRA.Set.TGSet.Set), (LRA.Set.TGSet.instHasSubset.1 A1 A2 ∧ LRA.Set.TGSet.instHasSubset.1 B1 B2) → LRA.Set.TGSet.instHasSubset.1 (LRA.Set.TGSet.instInter.1 A1 B1) (LRA.Set.TGSet.instInter.1 A2 B2)

Logical form (Lean):

```lean
theorem IntersectionMonotone :
    forall A1 A2 B1 B2 : Set, A1 ⊆ A2 -> B1 ⊆ B2 -> A1 ∩ B1 ⊆ A2 ∩ B2
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
    forall A1 A2 B1 B2 : Set, A1 ⊆ A2 -> B1 ⊆ B2 -> A1 ∩ B1 ⊆ A2 ∩ B2 := by
  sorry

/--
`SubsetIffIntersectionEqLeft` TODO

Predicate logic:

  forall A B : Set, A ⊆ B <-> A ∩ B = A

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.TGSet.Set), LRA.Set.TGSet.instHasSubset.1 A B ↔ LRA.Set.TGSet.instInter.1 A B = A

Logical form (Lean):

```lean
theorem SubsetIffIntersectionEqLeft :
    forall A B : Set, A ⊆ B <-> A ∩ B = A
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
    forall A B : Set, A ⊆ B <-> A ∩ B = A := by
  sorry

instance : IntersectionLaws Set where
  IntersectionCommutative := IntersectionCommutative
  IntersectionAssociative := IntersectionAssociative
  IntersectionIdempotent := IntersectionIdempotent
  EmptyIntersection := EmptyIntersection
  IntersectionEmpty := IntersectionEmpty
  IntersectionMonotone := IntersectionMonotone
  SubsetIffIntersectionEqLeft := SubsetIffIntersectionEqLeft

end LRA.Set.TGSet
