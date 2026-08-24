import LRA.Set.PredicateSet.Instances
import LRA.Set.Interface.SymmetricDifference

namespace LRA.Set.PredicateSet

universe u

variable {Alpha : Type u}

/--
`SymmetricDifferenceAsUnionDifferences` TODO

Predicate logic:

  ∀ A B : LRA.Set.PredicateSet Alpha, A ∆ B = (A \ B) ∪ (B \ A)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.PredicateSet.instHasSymmDiff.1 A B = LRA.Set.PredicateSet.instUnion.1 (LRA.Set.PredicateSet.instSDiff.1 A B) (LRA.Set.PredicateSet.instSDiff.1 B A)

Logical form (Lean):

```lean
theorem SymmetricDifferenceAsUnionDifferences :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∆ B = (A \ B) ∪ (B \ A)
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
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∆ B = (A \ B) ∪ (B \ A) := by
  sorry

/--
`SymmetricDifferenceAsUnionDifferenceIntersection` TODO

Predicate logic:

  ∀ A B : LRA.Set.PredicateSet Alpha, A ∆ B = (A ∪ B) \ (A ∩ B)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.PredicateSet.instHasSymmDiff.1 A B = LRA.Set.PredicateSet.instSDiff.1 (LRA.Set.PredicateSet.instUnion.1 A B) (LRA.Set.PredicateSet.instInter.1 A B)

Logical form (Lean):

```lean
theorem SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∆ B = (A ∪ B) \ (A ∩ B)
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
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∆ B = (A ∪ B) \ (A ∩ B) := by
  sorry

/--
`SymmetricDifferenceCommutative` TODO

Predicate logic:

  ∀ A B : LRA.Set.PredicateSet Alpha, A ∆ B = B ∆ A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.PredicateSet.instHasSymmDiff.1 A B = LRA.Set.PredicateSet.instHasSymmDiff.1 B A

Logical form (Lean):

```lean
theorem SymmetricDifferenceCommutative :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∆ B = B ∆ A
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
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∆ B = B ∆ A := by
  sorry

/--
`SymmetricDifferenceAssociative` TODO

Predicate logic:

  ∀ A B C : LRA.Set.PredicateSet Alpha, (A ∆ B) ∆ C = A ∆ (B ∆ C)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B C : Alpha → Prop), LRA.Set.PredicateSet.instHasSymmDiff.1 (LRA.Set.PredicateSet.instHasSymmDiff.1 A B) C = LRA.Set.PredicateSet.instHasSymmDiff.1 A (LRA.Set.PredicateSet.instHasSymmDiff.1 B C)

Logical form (Lean):

```lean
theorem SymmetricDifferenceAssociative :
    ∀ A B C : LRA.Set.PredicateSet Alpha,
      (A ∆ B) ∆ C = A ∆ (B ∆ C)
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
    ∀ A B C : LRA.Set.PredicateSet Alpha,
      (A ∆ B) ∆ C = A ∆ (B ∆ C) := by
  sorry

/--
`SymmetricDifferenceEmpty` TODO

Predicate logic:

  ∀ A : LRA.Set.PredicateSet Alpha, A ∆ ∅ ∈ LRA.Set.PredicateSet Alpha = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.PredicateSet.instHasSymmDiff.1 A LRA.Set.PredicateSet.instEmptyCollection.1 = A

Logical form (Lean):

```lean
theorem SymmetricDifferenceEmpty :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A ∆ (∅ : LRA.Set.PredicateSet Alpha) = A
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
theorem SymmetricDifferenceEmpty :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A ∆ (∅ : LRA.Set.PredicateSet Alpha) = A := by
  sorry

/--
`EmptySymmetricDifference` TODO

Predicate logic:

  ∀ A : LRA.Set.PredicateSet Alpha, ∅ ∈ LRA.Set.PredicateSet Alpha ∆ A = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.PredicateSet.instHasSymmDiff.1 LRA.Set.PredicateSet.instEmptyCollection.1 A = A

Logical form (Lean):

```lean
theorem EmptySymmetricDifference :
    ∀ A : LRA.Set.PredicateSet Alpha,
      (∅ : LRA.Set.PredicateSet Alpha) ∆ A = A
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
theorem EmptySymmetricDifference :
    ∀ A : LRA.Set.PredicateSet Alpha,
      (∅ : LRA.Set.PredicateSet Alpha) ∆ A = A := by
  sorry

/--
`SymmetricDifferenceSelf` TODO

Predicate logic:

  ∀ A : LRA.Set.PredicateSet Alpha, A ∆ A = ∅ ∈ LRA.Set.PredicateSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.PredicateSet.instHasSymmDiff.1 A A = LRA.Set.PredicateSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem SymmetricDifferenceSelf :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A ∆ A = (∅ : LRA.Set.PredicateSet Alpha)
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
theorem SymmetricDifferenceSelf :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A ∆ A = (∅ : LRA.Set.PredicateSet Alpha) := by
  sorry

/--
`SymmetricDifferenceEqEmptyIff` TODO

Predicate logic:

  ∀ A B : LRA.Set.PredicateSet Alpha, A ∆ B = ∅ ∈ LRA.Set.PredicateSet Alpha ↔ A = B

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.PredicateSet.instHasSymmDiff.1 A B = LRA.Set.PredicateSet.instEmptyCollection.1 ↔ A = B

Logical form (Lean):

```lean
theorem SymmetricDifferenceEqEmptyIff :
    ∀ A B : LRA.Set.PredicateSet Alpha,
      A ∆ B = (∅ : LRA.Set.PredicateSet Alpha) ↔ A = B
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
    ∀ A B : LRA.Set.PredicateSet Alpha,
      A ∆ B = (∅ : LRA.Set.PredicateSet Alpha) ↔ A = B := by
  sorry

/--
`SymmetricDifferenceSubsetUnion` TODO

Predicate logic:

  ∀ A B : LRA.Set.PredicateSet Alpha, A ∆ B ⊆ A ∪ B

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.PredicateSet.instHasSubset.1 (LRA.Set.PredicateSet.instHasSymmDiff.1 A B) (LRA.Set.PredicateSet.instUnion.1 A B)

Logical form (Lean):

```lean
theorem SymmetricDifferenceSubsetUnion :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∆ B ⊆ A ∪ B
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
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∆ B ⊆ A ∪ B := by
  sorry

instance : SymmDiffLaws (LRA.Set.PredicateSet Alpha) where
  SymmetricDifferenceAsUnionDifferences :=
    LRA.Set.PredicateSet.SymmetricDifferenceAsUnionDifferences
  SymmetricDifferenceAsUnionDifferenceIntersection :=
    LRA.Set.PredicateSet.SymmetricDifferenceAsUnionDifferenceIntersection
  SymmetricDifferenceCommutative :=
    LRA.Set.PredicateSet.SymmetricDifferenceCommutative
  SymmetricDifferenceAssociative :=
    LRA.Set.PredicateSet.SymmetricDifferenceAssociative
  SymmetricDifferenceEmpty :=
    LRA.Set.PredicateSet.SymmetricDifferenceEmpty
  EmptySymmetricDifference :=
    LRA.Set.PredicateSet.EmptySymmetricDifference
  SymmetricDifferenceSelf :=
    LRA.Set.PredicateSet.SymmetricDifferenceSelf
  SymmetricDifferenceEqEmptyIff :=
    LRA.Set.PredicateSet.SymmetricDifferenceEqEmptyIff
  SymmetricDifferenceSubsetUnion :=
    LRA.Set.PredicateSet.SymmetricDifferenceSubsetUnion

end LRA.Set.PredicateSet
