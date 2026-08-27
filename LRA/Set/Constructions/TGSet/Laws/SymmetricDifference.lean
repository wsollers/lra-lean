import LRA.Set.Constructions.TGSet.Instances
import LRA.Set.Interface.SymmetricDifference

namespace LRA.Set.Constructions.TGSet

/--
`SymmetricDifferenceAsUnionDifferences` TODO

Predicate logic:

  forall A B : Set, A ∆ B = (A \ B) ∪ (B \ A)

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instHasSymmDiff.1 A B = LRA.Set.Constructions.TGSet.instUnion.1 (LRA.Set.Constructions.TGSet.instSDiff.1 A B) (LRA.Set.Constructions.TGSet.instSDiff.1 B A)

Logical form (Lean):

```lean
theorem SymmetricDifferenceAsUnionDifferences :
    forall A B : Set, A ∆ B = (A \ B) ∪ (B \ A)
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
theorem SymmetricDifferenceAsUnionDifferences :
    forall A B : Set, A ∆ B = (A \ B) ∪ (B \ A) := by
  sorry

/--
`SymmetricDifferenceAsUnionDifferenceIntersection` TODO

Predicate logic:

  forall A B : Set, A ∆ B = (A ∪ B) \ (A ∩ B)

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instHasSymmDiff.1 A B = LRA.Set.Constructions.TGSet.instSDiff.1 (LRA.Set.Constructions.TGSet.instUnion.1 A B) (LRA.Set.Constructions.TGSet.instInter.1 A B)

Logical form (Lean):

```lean
theorem SymmetricDifferenceAsUnionDifferenceIntersection :
    forall A B : Set, A ∆ B = (A ∪ B) \ (A ∩ B)
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
theorem SymmetricDifferenceAsUnionDifferenceIntersection :
    forall A B : Set, A ∆ B = (A ∪ B) \ (A ∩ B) := by
  sorry

/--
`SymmetricDifferenceCommutative` TODO

Predicate logic:

  forall A B : Set, A ∆ B = B ∆ A

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instHasSymmDiff.1 A B = LRA.Set.Constructions.TGSet.instHasSymmDiff.1 B A

Logical form (Lean):

```lean
theorem SymmetricDifferenceCommutative :
    forall A B : Set, A ∆ B = B ∆ A
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
theorem SymmetricDifferenceCommutative :
    forall A B : Set, A ∆ B = B ∆ A := by
  sorry

/--
`SymmetricDifferenceAssociative` TODO

Predicate logic:

  forall A B C : Set, (A ∆ B) ∆ C = A ∆ (B ∆ C)

Predicate logic (unfolded):

  ∀ (A B C : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instHasSymmDiff.1 (LRA.Set.Constructions.TGSet.instHasSymmDiff.1 A B) C = LRA.Set.Constructions.TGSet.instHasSymmDiff.1 A (LRA.Set.Constructions.TGSet.instHasSymmDiff.1 B C)

Logical form (Lean):

```lean
theorem SymmetricDifferenceAssociative :
    forall A B C : Set, (A ∆ B) ∆ C = A ∆ (B ∆ C)
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
theorem SymmetricDifferenceAssociative :
    forall A B C : Set, (A ∆ B) ∆ C = A ∆ (B ∆ C) := by
  sorry

/--
`SymmetricDifferenceEmpty` TODO

Predicate logic:

  forall A : Set, A ∆ ∅ ∈ Set = A

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instHasSymmDiff.1 A LRA.Set.Constructions.TGSet.instEmptyCollection.1 = A

Logical form (Lean):

```lean
theorem SymmetricDifferenceEmpty : forall A : Set, A ∆ (∅ : Set) = A
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
theorem SymmetricDifferenceEmpty : forall A : Set, A ∆ (∅ : Set) = A := by
  sorry

/--
`EmptySymmetricDifference` TODO

Predicate logic:

  forall A : Set, ∅ ∈ Set ∆ A = A

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instHasSymmDiff.1 LRA.Set.Constructions.TGSet.instEmptyCollection.1 A = A

Logical form (Lean):

```lean
theorem EmptySymmetricDifference : forall A : Set, (∅ : Set) ∆ A = A
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
theorem EmptySymmetricDifference : forall A : Set, (∅ : Set) ∆ A = A := by
  sorry

/--
`SymmetricDifferenceSelf` TODO

Predicate logic:

  forall A : Set, A ∆ A = ∅ ∈ Set

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instHasSymmDiff.1 A A = LRA.Set.Constructions.TGSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem SymmetricDifferenceSelf : forall A : Set, A ∆ A = (∅ : Set)
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
theorem SymmetricDifferenceSelf : forall A : Set, A ∆ A = (∅ : Set) := by
  sorry

/--
`SymmetricDifferenceEqEmptyIff` TODO

Predicate logic:

  forall A B : Set, A ∆ B = ∅ ∈ Set <-> A = B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instHasSymmDiff.1 A B = LRA.Set.Constructions.TGSet.instEmptyCollection.1 ↔ A = B

Logical form (Lean):

```lean
theorem SymmetricDifferenceEqEmptyIff :
    forall A B : Set, A ∆ B = (∅ : Set) <-> A = B
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
theorem SymmetricDifferenceEqEmptyIff :
    forall A B : Set, A ∆ B = (∅ : Set) <-> A = B := by
  sorry

/--
`SymmetricDifferenceSubsetUnion` TODO

Predicate logic:

  forall A B : Set, A ∆ B ⊆ A ∪ B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instHasSubset.1 (LRA.Set.Constructions.TGSet.instHasSymmDiff.1 A B) (LRA.Set.Constructions.TGSet.instUnion.1 A B)

Logical form (Lean):

```lean
theorem SymmetricDifferenceSubsetUnion :
    forall A B : Set, A ∆ B ⊆ A ∪ B
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
theorem SymmetricDifferenceSubsetUnion :
    forall A B : Set, A ∆ B ⊆ A ∪ B := by
  sorry

end LRA.Set.Constructions.TGSet
