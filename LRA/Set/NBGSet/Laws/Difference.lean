import LRA.Set.NBGSet.Instances
import LRA.Set.Interface.Difference

namespace LRA.Set.NBGSet

/--
`DifferenceMonotoneLeft` TODO

Predicate logic:

  forall A1 A2 B : Set, A1 ⊆ A2 -> A1 \ B ⊆ A2 \ B

Predicate logic (unfolded):

  ∀ (A1 A2 B : LRA.Set.NBGSet.Set), LRA.Set.NBGSet.instHasSubset.1 A1 A2 → LRA.Set.NBGSet.instHasSubset.1 (LRA.Set.NBGSet.instSDiff.1 A1 B) (LRA.Set.NBGSet.instSDiff.1 A2 B)

Logical form (Lean):

```lean
theorem DifferenceMonotoneLeft :
    forall A1 A2 B : Set, A1 ⊆ A2 -> A1 \ B ⊆ A2 \ B
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
    forall A1 A2 B : Set, A1 ⊆ A2 -> A1 \ B ⊆ A2 \ B := by
  sorry

/--
`DifferenceAntitoneRight` TODO

Predicate logic:

  forall A B1 B2 : Set, B1 ⊆ B2 -> A \ B2 ⊆ A \ B1

Predicate logic (unfolded):

  ∀ (A B1 B2 : LRA.Set.NBGSet.Set), LRA.Set.NBGSet.instHasSubset.1 B1 B2 → LRA.Set.NBGSet.instHasSubset.1 (LRA.Set.NBGSet.instSDiff.1 A B2) (LRA.Set.NBGSet.instSDiff.1 A B1)

Logical form (Lean):

```lean
theorem DifferenceAntitoneRight :
    forall A B1 B2 : Set, B1 ⊆ B2 -> A \ B2 ⊆ A \ B1
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
    forall A B1 B2 : Set, B1 ⊆ B2 -> A \ B2 ⊆ A \ B1 := by
  sorry

/--
`DifferenceEmpty` TODO

Predicate logic:

  forall A : Set, A \ ∅ ∈ Set = A

Predicate logic (unfolded):

  ∀ (A : LRA.Set.NBGSet.Set), LRA.Set.NBGSet.instSDiff.1 A LRA.Set.NBGSet.instEmptyCollection.1 = A

Logical form (Lean):

```lean
theorem DifferenceEmpty : forall A : Set, A \ (∅ : Set) = A
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
theorem DifferenceEmpty : forall A : Set, A \ (∅ : Set) = A := by
  sorry

/--
`EmptyDifference` TODO

Predicate logic:

  forall A : Set, ∅ ∈ Set \ A = ∅ ∈ Set

Predicate logic (unfolded):

  ∀ (A : LRA.Set.NBGSet.Set), LRA.Set.NBGSet.instSDiff.1 LRA.Set.NBGSet.instEmptyCollection.1 A = LRA.Set.NBGSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem EmptyDifference : forall A : Set, (∅ : Set) \ A = (∅ : Set)
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
theorem EmptyDifference : forall A : Set, (∅ : Set) \ A = (∅ : Set) := by
  sorry

/--
`DifferenceSelf` TODO

Predicate logic:

  forall A : Set, A \ A = ∅ ∈ Set

Predicate logic (unfolded):

  ∀ (A : LRA.Set.NBGSet.Set), LRA.Set.NBGSet.instSDiff.1 A A = LRA.Set.NBGSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem DifferenceSelf : forall A : Set, A \ A = (∅ : Set)
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
theorem DifferenceSelf : forall A : Set, A \ A = (∅ : Set) := by
  sorry

/--
`DifferenceUnion` TODO

Predicate logic:

  forall A B C : Set, A \ (B ∪ C) = (A \ B) ∩ (A \ C)

Predicate logic (unfolded):

  ∀ (A B C : LRA.Set.NBGSet.Set), LRA.Set.NBGSet.instSDiff.1 A (LRA.Set.NBGSet.instUnion.1 B C) = LRA.Set.NBGSet.instInter.1 (LRA.Set.NBGSet.instSDiff.1 A B) (LRA.Set.NBGSet.instSDiff.1 A C)

Logical form (Lean):

```lean
theorem DifferenceUnion :
    forall A B C : Set, A \ (B ∪ C) = (A \ B) ∩ (A \ C)
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
    forall A B C : Set, A \ (B ∪ C) = (A \ B) ∩ (A \ C) := by
  sorry

/--
`DifferenceIntersection` TODO

Predicate logic:

  forall A B C : Set, A \ (B ∩ C) = (A \ B) ∪ (A \ C)

Predicate logic (unfolded):

  ∀ (A B C : LRA.Set.NBGSet.Set), LRA.Set.NBGSet.instSDiff.1 A (LRA.Set.NBGSet.instInter.1 B C) = LRA.Set.NBGSet.instUnion.1 (LRA.Set.NBGSet.instSDiff.1 A B) (LRA.Set.NBGSet.instSDiff.1 A C)

Logical form (Lean):

```lean
theorem DifferenceIntersection :
    forall A B C : Set, A \ (B ∩ C) = (A \ B) ∪ (A \ C)
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
    forall A B C : Set, A \ (B ∩ C) = (A \ B) ∪ (A \ C) := by
  sorry

/--
`UnionDifferenceDistributes` TODO

Predicate logic:

  forall A B C : Set, (A ∪ B) \ C = (A \ C) ∪ (B \ C)

Predicate logic (unfolded):

  ∀ (A B C : LRA.Set.NBGSet.Set), LRA.Set.NBGSet.instSDiff.1 (LRA.Set.NBGSet.instUnion.1 A B) C = LRA.Set.NBGSet.instUnion.1 (LRA.Set.NBGSet.instSDiff.1 A C) (LRA.Set.NBGSet.instSDiff.1 B C)

Logical form (Lean):

```lean
theorem UnionDifferenceDistributes :
    forall A B C : Set, (A ∪ B) \ C = (A \ C) ∪ (B \ C)
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
    forall A B C : Set, (A ∪ B) \ C = (A \ C) ∪ (B \ C) := by
  sorry

/--
`IntersectionDifferenceDistributes` TODO

Predicate logic:

  forall A B C : Set, (A ∩ B) \ C = (A \ C) ∩ (B \ C)

Predicate logic (unfolded):

  ∀ (A B C : LRA.Set.NBGSet.Set), LRA.Set.NBGSet.instSDiff.1 (LRA.Set.NBGSet.instInter.1 A B) C = LRA.Set.NBGSet.instInter.1 (LRA.Set.NBGSet.instSDiff.1 A C) (LRA.Set.NBGSet.instSDiff.1 B C)

Logical form (Lean):

```lean
theorem IntersectionDifferenceDistributes :
    forall A B C : Set, (A ∩ B) \ C = (A \ C) ∩ (B \ C)
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
    forall A B C : Set, (A ∩ B) \ C = (A \ C) ∩ (B \ C) := by
  sorry

/--
`DifferenceSubsetLeft` TODO

Predicate logic:

  forall A B : Set, A \ B ⊆ A

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.NBGSet.Set), LRA.Set.NBGSet.instHasSubset.1 (LRA.Set.NBGSet.instSDiff.1 A B) A

Logical form (Lean):

```lean
theorem DifferenceSubsetLeft : forall A B : Set, A \ B ⊆ A
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
theorem DifferenceSubsetLeft : forall A B : Set, A \ B ⊆ A := by
  sorry

/--
`DifferenceDisjointRight` TODO

Predicate logic:

  forall A B : Set, (A \ B) ∩ B = ∅ ∈ Set

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.NBGSet.Set), LRA.Set.NBGSet.instInter.1 (LRA.Set.NBGSet.instSDiff.1 A B) B = LRA.Set.NBGSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem DifferenceDisjointRight :
    forall A B : Set, (A \ B) ∩ B = (∅ : Set)
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
    forall A B : Set, (A \ B) ∩ B = (∅ : Set) := by
  sorry

instance : DifferenceLaws Set where
  DifferenceMonotoneLeft := DifferenceMonotoneLeft
  DifferenceAntitoneRight := DifferenceAntitoneRight
  DifferenceEmpty := DifferenceEmpty
  EmptyDifference := EmptyDifference
  DifferenceSelf := DifferenceSelf
  DifferenceUnion := DifferenceUnion
  DifferenceIntersection := DifferenceIntersection
  UnionDifferenceDistributes := UnionDifferenceDistributes
  IntersectionDifferenceDistributes := IntersectionDifferenceDistributes
  DifferenceSubsetLeft := DifferenceSubsetLeft
  DifferenceDisjointRight := DifferenceDisjointRight

end LRA.Set.NBGSet
