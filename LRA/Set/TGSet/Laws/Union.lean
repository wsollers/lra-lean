import LRA.Set.TGSet.Instances
import LRA.Set.Interface.Union

namespace LRA.Set.TGSet

/--
`UnionCommutative` TODO

Predicate logic:

  forall A B : Set, A ∪ B = B ∪ A

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.TGSet.Set), LRA.Set.TGSet.instUnion.1 A B = LRA.Set.TGSet.instUnion.1 B A

Logical form (Lean):

```lean
theorem UnionCommutative : forall A B : Set, A ∪ B = B ∪ A
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
theorem UnionCommutative : forall A B : Set, A ∪ B = B ∪ A := by
  sorry

/--
`UnionAssociative` TODO

Predicate logic:

  forall A B C : Set, (A ∪ B) ∪ C = A ∪ (B ∪ C)

Predicate logic (unfolded):

  ∀ (A B C : LRA.Set.TGSet.Set), LRA.Set.TGSet.instUnion.1 (LRA.Set.TGSet.instUnion.1 A B) C = LRA.Set.TGSet.instUnion.1 A (LRA.Set.TGSet.instUnion.1 B C)

Logical form (Lean):

```lean
theorem UnionAssociative :
    forall A B C : Set, (A ∪ B) ∪ C = A ∪ (B ∪ C)
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
    forall A B C : Set, (A ∪ B) ∪ C = A ∪ (B ∪ C) := by
  sorry

/--
`EmptyUnion` TODO

Predicate logic:

  forall A : Set, ∅ ∈ Set ∪ A = A

Predicate logic (unfolded):

  ∀ (A : LRA.Set.TGSet.Set), LRA.Set.TGSet.instUnion.1 LRA.Set.TGSet.instEmptyCollection.1 A = A

Logical form (Lean):

```lean
theorem EmptyUnion : forall A : Set, (∅ : Set) ∪ A = A
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
theorem EmptyUnion : forall A : Set, (∅ : Set) ∪ A = A := by
  sorry

/--
`UnionEmpty` TODO

Predicate logic:

  forall A : Set, A ∪ ∅ ∈ Set = A

Predicate logic (unfolded):

  ∀ (A : LRA.Set.TGSet.Set), LRA.Set.TGSet.instUnion.1 A LRA.Set.TGSet.instEmptyCollection.1 = A

Logical form (Lean):

```lean
theorem UnionEmpty : forall A : Set, A ∪ (∅ : Set) = A
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
theorem UnionEmpty : forall A : Set, A ∪ (∅ : Set) = A := by
  sorry

/--
`UnionIdempotent` TODO

Predicate logic:

  forall A : Set, A ∪ A = A

Predicate logic (unfolded):

  ∀ (A : LRA.Set.TGSet.Set), LRA.Set.TGSet.instUnion.1 A A = A

Logical form (Lean):

```lean
theorem UnionIdempotent : forall A : Set, A ∪ A = A
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
theorem UnionIdempotent : forall A : Set, A ∪ A = A := by
  sorry

/--
`UnionMonotone` TODO

Predicate logic:

  forall A1 A2 B1 B2 : Set, A1 ⊆ A2 -> B1 ⊆ B2 -> A1 ∪ B1 ⊆ A2 ∪ B2

Predicate logic (unfolded):

  ∀ (A1 A2 B1 B2 : LRA.Set.TGSet.Set), (LRA.Set.TGSet.instHasSubset.1 A1 A2 ∧ LRA.Set.TGSet.instHasSubset.1 B1 B2) → LRA.Set.TGSet.instHasSubset.1 (LRA.Set.TGSet.instUnion.1 A1 B1) (LRA.Set.TGSet.instUnion.1 A2 B2)

Logical form (Lean):

```lean
theorem UnionMonotone :
    forall A1 A2 B1 B2 : Set, A1 ⊆ A2 -> B1 ⊆ B2 -> A1 ∪ B1 ⊆ A2 ∪ B2
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
    forall A1 A2 B1 B2 : Set, A1 ⊆ A2 -> B1 ⊆ B2 -> A1 ∪ B1 ⊆ A2 ∪ B2 := by
  sorry

/--
`SubsetIffUnionEqRight` TODO

Predicate logic:

  forall A B : Set, A ⊆ B <-> A ∪ B = B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.TGSet.Set), LRA.Set.TGSet.instHasSubset.1 A B ↔ LRA.Set.TGSet.instUnion.1 A B = B

Logical form (Lean):

```lean
theorem SubsetIffUnionEqRight :
    forall A B : Set, A ⊆ B <-> A ∪ B = B
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
    forall A B : Set, A ⊆ B <-> A ∪ B = B := by
  sorry

instance : UnionLaws Set where
  UnionCommutative := UnionCommutative
  UnionAssociative := UnionAssociative
  EmptyUnion := EmptyUnion
  UnionEmpty := UnionEmpty
  UnionIdempotent := UnionIdempotent
  UnionMonotone := UnionMonotone
  SubsetIffUnionEqRight := SubsetIffUnionEqRight

end LRA.Set.TGSet
