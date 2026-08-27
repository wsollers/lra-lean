import LRA.Set.Constructions.ZFCSet.Instances
import LRA.Set.Interface.SymmetricDifference

namespace LRA.Set.Constructions.ZFCSet

/--
`SymmetricDifferenceAsUnionDifferences` TODO

Predicate logic:

  ∀ A B : Set, A ∆ B = (A \ B) ∪ (B \ A)

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSymmDiff.1 A B = LRA.Set.Constructions.ZFCSet.instUnion.1 (LRA.Set.Constructions.ZFCSet.instSDiff.1 A B) (LRA.Set.Constructions.ZFCSet.instSDiff.1 B A)

Logical form (Lean):

```lean
theorem SymmetricDifferenceAsUnionDifferences :
    ∀ A B : Set, A ∆ B = (A \ B) ∪ (B \ A)
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
    ∀ A B : Set, A ∆ B = (A \ B) ∪ (B \ A) := by
  sorry

/--
`SymmetricDifferenceAsUnionDifferenceIntersection` TODO

Predicate logic:

  ∀ A B : Set, A ∆ B = (A ∪ B) \ (A ∩ B)

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSymmDiff.1 A B = LRA.Set.Constructions.ZFCSet.instSDiff.1 (LRA.Set.Constructions.ZFCSet.instUnion.1 A B) (LRA.Set.Constructions.ZFCSet.instInter.1 A B)

Logical form (Lean):

```lean
theorem SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : Set, A ∆ B = (A ∪ B) \ (A ∩ B)
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
    ∀ A B : Set, A ∆ B = (A ∪ B) \ (A ∩ B) := by
  sorry

/--
`SymmetricDifferenceCommutative` TODO

Predicate logic:

  ∀ A B : Set, A ∆ B = B ∆ A

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSymmDiff.1 A B = LRA.Set.Constructions.ZFCSet.instHasSymmDiff.1 B A

Logical form (Lean):

```lean
theorem SymmetricDifferenceCommutative :
    ∀ A B : Set, A ∆ B = B ∆ A
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
    ∀ A B : Set, A ∆ B = B ∆ A := by
  sorry

/--
`SymmetricDifferenceAssociative` TODO

Predicate logic:

  ∀ A B C : Set, (A ∆ B) ∆ C = A ∆ (B ∆ C)

Predicate logic (unfolded):

  ∀ (A B C : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSymmDiff.1 (LRA.Set.Constructions.ZFCSet.instHasSymmDiff.1 A B) C = LRA.Set.Constructions.ZFCSet.instHasSymmDiff.1 A (LRA.Set.Constructions.ZFCSet.instHasSymmDiff.1 B C)

Logical form (Lean):

```lean
theorem SymmetricDifferenceAssociative :
    ∀ A B C : Set, (A ∆ B) ∆ C = A ∆ (B ∆ C)
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
    ∀ A B C : Set, (A ∆ B) ∆ C = A ∆ (B ∆ C) := by
  sorry

/--
`SymmetricDifferenceEmpty` TODO

Predicate logic:

  ∀ A : Set, A ∆ ∅ ∈ Set = A

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSymmDiff.1 A LRA.Set.Constructions.ZFCSet.instEmptyCollection.1 = A

Logical form (Lean):

```lean
theorem SymmetricDifferenceEmpty : ∀ A : Set, A ∆ (∅ : Set) = A
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
theorem SymmetricDifferenceEmpty : ∀ A : Set, A ∆ (∅ : Set) = A := by
  sorry

/--
`EmptySymmetricDifference` TODO

Predicate logic:

  ∀ A : Set, ∅ ∈ Set ∆ A = A

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSymmDiff.1 LRA.Set.Constructions.ZFCSet.instEmptyCollection.1 A = A

Logical form (Lean):

```lean
theorem EmptySymmetricDifference : ∀ A : Set, (∅ : Set) ∆ A = A
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
theorem EmptySymmetricDifference : ∀ A : Set, (∅ : Set) ∆ A = A := by
  sorry

/--
`SymmetricDifferenceSelf` TODO

Predicate logic:

  ∀ A : Set, A ∆ A = ∅ ∈ Set

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSymmDiff.1 A A = LRA.Set.Constructions.ZFCSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem SymmetricDifferenceSelf : ∀ A : Set, A ∆ A = (∅ : Set)
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
theorem SymmetricDifferenceSelf : ∀ A : Set, A ∆ A = (∅ : Set) := by
  sorry

/--
`SymmetricDifferenceEqEmptyIff` TODO

Predicate logic:

  ∀ A B : Set, A ∆ B = ∅ ∈ Set ↔ A = B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSymmDiff.1 A B = LRA.Set.Constructions.ZFCSet.instEmptyCollection.1 ↔ A = B

Logical form (Lean):

```lean
theorem SymmetricDifferenceEqEmptyIff :
    ∀ A B : Set, A ∆ B = (∅ : Set) ↔ A = B
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
    ∀ A B : Set, A ∆ B = (∅ : Set) ↔ A = B := by
  sorry

/--
`SymmetricDifferenceSubsetUnion` TODO

Predicate logic:

  ∀ A B : Set, A ∆ B ⊆ A ∪ B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSubset.1 (LRA.Set.Constructions.ZFCSet.instHasSymmDiff.1 A B) (LRA.Set.Constructions.ZFCSet.instUnion.1 A B)

Logical form (Lean):

```lean
theorem SymmetricDifferenceSubsetUnion :
    ∀ A B : Set, A ∆ B ⊆ A ∪ B
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
    ∀ A B : Set, A ∆ B ⊆ A ∪ B := by
  sorry

end LRA.Set.Constructions.ZFCSet
