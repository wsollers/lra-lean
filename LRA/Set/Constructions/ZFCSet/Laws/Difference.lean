import LRA.Set.Constructions.ZFCSet.Instances
import LRA.Set.Interface.Laws.Difference

namespace LRA.Set.Constructions.ZFCSet

/--
`DifferenceMonotoneLeft` TODO

Predicate logic:

  ∀ A₁ A₂ B : Set, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B

Predicate logic (unfolded):

  ∀ (A₁ A₂ B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSubset.1 A₁ A₂ → LRA.Set.Constructions.ZFCSet.instHasSubset.1 (LRA.Set.Constructions.ZFCSet.instSDiff.1 A₁ B) (LRA.Set.Constructions.ZFCSet.instSDiff.1 A₂ B)

Logical form (Lean):

```lean
theorem DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : Set, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B
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
theorem DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : Set, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B := by
  sorry

/--
`DifferenceAntitoneRight` TODO

Predicate logic:

  ∀ A B₁ B₂ : Set, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁

Predicate logic (unfolded):

  ∀ (A B₁ B₂ : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSubset.1 B₁ B₂ → LRA.Set.Constructions.ZFCSet.instHasSubset.1 (LRA.Set.Constructions.ZFCSet.instSDiff.1 A B₂) (LRA.Set.Constructions.ZFCSet.instSDiff.1 A B₁)

Logical form (Lean):

```lean
theorem DifferenceAntitoneRight :
    ∀ A B₁ B₂ : Set, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁
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
theorem DifferenceAntitoneRight :
    ∀ A B₁ B₂ : Set, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁ := by
  sorry

/--
`DifferenceEmpty` TODO

Predicate logic:

  ∀ A : Set, A \ ∅ ∈ Set = A

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instSDiff.1 A LRA.Set.Constructions.ZFCSet.instEmptyCollection.1 = A

Logical form (Lean):

```lean
theorem DifferenceEmpty : ∀ A : Set, A \ (∅ : Set) = A
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
theorem DifferenceEmpty : ∀ A : Set, A \ (∅ : Set) = A := by
  sorry

/--
`EmptyDifference` TODO

Predicate logic:

  ∀ A : Set, ∅ ∈ Set \ A = ∅ ∈ Set

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instSDiff.1 LRA.Set.Constructions.ZFCSet.instEmptyCollection.1 A = LRA.Set.Constructions.ZFCSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem EmptyDifference : ∀ A : Set, (∅ : Set) \ A = (∅ : Set)
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
theorem EmptyDifference : ∀ A : Set, (∅ : Set) \ A = (∅ : Set) := by
  sorry

/--
`DifferenceSelf` TODO

Predicate logic:

  ∀ A : Set, A \ A = ∅ ∈ Set

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instSDiff.1 A A = LRA.Set.Constructions.ZFCSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem DifferenceSelf : ∀ A : Set, A \ A = (∅ : Set)
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
theorem DifferenceSelf : ∀ A : Set, A \ A = (∅ : Set) := by
  sorry

/--
`DifferenceUnion` TODO

Predicate logic:

  ∀ A B C : Set, A \ (B ∪ C) = (A \ B) ∩ (A \ C)

Predicate logic (unfolded):

  ∀ (A B C : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instSDiff.1 A (LRA.Set.Constructions.ZFCSet.instUnion.1 B C) = LRA.Set.Constructions.ZFCSet.instInter.1 (LRA.Set.Constructions.ZFCSet.instSDiff.1 A B) (LRA.Set.Constructions.ZFCSet.instSDiff.1 A C)

Logical form (Lean):

```lean
theorem DifferenceUnion :
    ∀ A B C : Set, A \ (B ∪ C) = (A \ B) ∩ (A \ C)
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
theorem DifferenceUnion :
    ∀ A B C : Set, A \ (B ∪ C) = (A \ B) ∩ (A \ C) := by
  sorry

/--
`DifferenceIntersection` TODO

Predicate logic:

  ∀ A B C : Set, A \ (B ∩ C) = (A \ B) ∪ (A \ C)

Predicate logic (unfolded):

  ∀ (A B C : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instSDiff.1 A (LRA.Set.Constructions.ZFCSet.instInter.1 B C) = LRA.Set.Constructions.ZFCSet.instUnion.1 (LRA.Set.Constructions.ZFCSet.instSDiff.1 A B) (LRA.Set.Constructions.ZFCSet.instSDiff.1 A C)

Logical form (Lean):

```lean
theorem DifferenceIntersection :
    ∀ A B C : Set, A \ (B ∩ C) = (A \ B) ∪ (A \ C)
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
theorem DifferenceIntersection :
    ∀ A B C : Set, A \ (B ∩ C) = (A \ B) ∪ (A \ C) := by
  sorry

/--
`UnionDifferenceDistributes` TODO

Predicate logic:

  ∀ A B C : Set, (A ∪ B) \ C = (A \ C) ∪ (B \ C)

Predicate logic (unfolded):

  ∀ (A B C : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instSDiff.1 (LRA.Set.Constructions.ZFCSet.instUnion.1 A B) C = LRA.Set.Constructions.ZFCSet.instUnion.1 (LRA.Set.Constructions.ZFCSet.instSDiff.1 A C) (LRA.Set.Constructions.ZFCSet.instSDiff.1 B C)

Logical form (Lean):

```lean
theorem UnionDifferenceDistributes :
    ∀ A B C : Set, (A ∪ B) \ C = (A \ C) ∪ (B \ C)
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
theorem UnionDifferenceDistributes :
    ∀ A B C : Set, (A ∪ B) \ C = (A \ C) ∪ (B \ C) := by
  sorry

/--
`IntersectionDifferenceDistributes` TODO

Predicate logic:

  ∀ A B C : Set, (A ∩ B) \ C = (A \ C) ∩ (B \ C)

Predicate logic (unfolded):

  ∀ (A B C : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instSDiff.1 (LRA.Set.Constructions.ZFCSet.instInter.1 A B) C = LRA.Set.Constructions.ZFCSet.instInter.1 (LRA.Set.Constructions.ZFCSet.instSDiff.1 A C) (LRA.Set.Constructions.ZFCSet.instSDiff.1 B C)

Logical form (Lean):

```lean
theorem IntersectionDifferenceDistributes :
    ∀ A B C : Set, (A ∩ B) \ C = (A \ C) ∩ (B \ C)
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
theorem IntersectionDifferenceDistributes :
    ∀ A B C : Set, (A ∩ B) \ C = (A \ C) ∩ (B \ C) := by
  sorry

/--
`DifferenceSubsetLeft` TODO

Predicate logic:

  ∀ A B : Set, A \ B ⊆ A

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSubset.1 (LRA.Set.Constructions.ZFCSet.instSDiff.1 A B) A

Logical form (Lean):

```lean
theorem DifferenceSubsetLeft : ∀ A B : Set, A \ B ⊆ A
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
theorem DifferenceSubsetLeft : ∀ A B : Set, A \ B ⊆ A := by
  sorry

/--
`DifferenceDisjointRight` TODO

Predicate logic:

  ∀ A B : Set, (A \ B) ∩ B = ∅ ∈ Set

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instInter.1 (LRA.Set.Constructions.ZFCSet.instSDiff.1 A B) B = LRA.Set.Constructions.ZFCSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem DifferenceDisjointRight :
    ∀ A B : Set, (A \ B) ∩ B = (∅ : Set)
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
theorem DifferenceDisjointRight :
    ∀ A B : Set, (A \ B) ∩ B = (∅ : Set) := by
  sorry

end LRA.Set.Constructions.ZFCSet
