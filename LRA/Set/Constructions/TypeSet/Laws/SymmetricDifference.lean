import LRA.Set.Constructions.TypeSet.Instances
import LRA.Set.Interface.Laws.SymmetricDifference

namespace LRA.Set.Constructions.TypeSet

universe u

variable {Alpha : Type u}

/--
`SymmetricDifferenceAsUnionDifferences` TODO

Predicate logic:

  ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∆ B = (A \ B) ∪ (B \ A)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.Constructions.TypeSet.instHasSymmDiff.1 A B = LRA.Set.Constructions.TypeSet.instUnion.1 (LRA.Set.Constructions.TypeSet.instSDiff.1 A B) (LRA.Set.Constructions.TypeSet.instSDiff.1 B A)

Logical form (Lean):

```lean
theorem SymmetricDifferenceAsUnionDifferences :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∆ B = (A \ B) ∪ (B \ A)
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
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∆ B = (A \ B) ∪ (B \ A) := by
  sorry

/--
`SymmetricDifferenceAsUnionDifferenceIntersection` TODO

Predicate logic:

  ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∆ B = (A ∪ B) \ (A ∩ B)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.Constructions.TypeSet.instHasSymmDiff.1 A B = LRA.Set.Constructions.TypeSet.instSDiff.1 (LRA.Set.Constructions.TypeSet.instUnion.1 A B) (LRA.Set.Constructions.TypeSet.instInter.1 A B)

Logical form (Lean):

```lean
theorem SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∆ B = (A ∪ B) \ (A ∩ B)
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
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∆ B = (A ∪ B) \ (A ∩ B) := by
  sorry

/--
`SymmetricDifferenceCommutative` TODO

Predicate logic:

  ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∆ B = B ∆ A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.Constructions.TypeSet.instHasSymmDiff.1 A B = LRA.Set.Constructions.TypeSet.instHasSymmDiff.1 B A

Logical form (Lean):

```lean
theorem SymmetricDifferenceCommutative :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∆ B = B ∆ A
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
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∆ B = B ∆ A := by
  sorry

/--
`SymmetricDifferenceAssociative` TODO

Predicate logic:

  ∀ A B C : LRA.Set.Constructions.TypeSet Alpha, (A ∆ B) ∆ C = A ∆ (B ∆ C)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B C : Alpha → Prop), LRA.Set.Constructions.TypeSet.instHasSymmDiff.1 (LRA.Set.Constructions.TypeSet.instHasSymmDiff.1 A B) C = LRA.Set.Constructions.TypeSet.instHasSymmDiff.1 A (LRA.Set.Constructions.TypeSet.instHasSymmDiff.1 B C)

Logical form (Lean):

```lean
theorem SymmetricDifferenceAssociative :
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha,
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
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha,
      (A ∆ B) ∆ C = A ∆ (B ∆ C) := by
  sorry

/--
`SymmetricDifferenceEmpty` TODO

Predicate logic:

  ∀ A : LRA.Set.Constructions.TypeSet Alpha, A ∆ ∅ ∈ LRA.Set.Constructions.TypeSet Alpha = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.Constructions.TypeSet.instHasSymmDiff.1 A LRA.Set.Constructions.TypeSet.instEmptyCollection.1 = A

Logical form (Lean):

```lean
theorem SymmetricDifferenceEmpty :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A ∆ (∅ : LRA.Set.Constructions.TypeSet Alpha) = A
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
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A ∆ (∅ : LRA.Set.Constructions.TypeSet Alpha) = A := by
  sorry

/--
`EmptySymmetricDifference` TODO

Predicate logic:

  ∀ A : LRA.Set.Constructions.TypeSet Alpha, ∅ ∈ LRA.Set.Constructions.TypeSet Alpha ∆ A = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.Constructions.TypeSet.instHasSymmDiff.1 LRA.Set.Constructions.TypeSet.instEmptyCollection.1 A = A

Logical form (Lean):

```lean
theorem EmptySymmetricDifference :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      (∅ : LRA.Set.Constructions.TypeSet Alpha) ∆ A = A
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
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      (∅ : LRA.Set.Constructions.TypeSet Alpha) ∆ A = A := by
  sorry

/--
`SymmetricDifferenceSelf` TODO

Predicate logic:

  ∀ A : LRA.Set.Constructions.TypeSet Alpha, A ∆ A = ∅ ∈ LRA.Set.Constructions.TypeSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.Constructions.TypeSet.instHasSymmDiff.1 A A = LRA.Set.Constructions.TypeSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem SymmetricDifferenceSelf :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A ∆ A = (∅ : LRA.Set.Constructions.TypeSet Alpha)
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
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A ∆ A = (∅ : LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

/--
`SymmetricDifferenceEqEmptyIff` TODO

Predicate logic:

  ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∆ B = ∅ ∈ LRA.Set.Constructions.TypeSet Alpha ↔ A = B

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.Constructions.TypeSet.instHasSymmDiff.1 A B = LRA.Set.Constructions.TypeSet.instEmptyCollection.1 ↔ A = B

Logical form (Lean):

```lean
theorem SymmetricDifferenceEqEmptyIff :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha,
      A ∆ B = (∅ : LRA.Set.Constructions.TypeSet Alpha) ↔ A = B
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
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha,
      A ∆ B = (∅ : LRA.Set.Constructions.TypeSet Alpha) ↔ A = B := by
  sorry

/--
`SymmetricDifferenceSubsetUnion` TODO

Predicate logic:

  ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∆ B ⊆ A ∪ B

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.Constructions.TypeSet.instHasSubset.1 (LRA.Set.Constructions.TypeSet.instHasSymmDiff.1 A B) (LRA.Set.Constructions.TypeSet.instUnion.1 A B)

Logical form (Lean):

```lean
theorem SymmetricDifferenceSubsetUnion :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∆ B ⊆ A ∪ B
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
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∆ B ⊆ A ∪ B := by
  sorry

end LRA.Set.Constructions.TypeSet
