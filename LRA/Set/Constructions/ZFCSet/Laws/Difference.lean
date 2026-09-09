import LRA.Set.Constructions.ZFCSet.Instances
import LRA.Set.Interface.Laws.Difference

namespace LRA.Set.Constructions.ZFCSet

/--
`DifferenceMonotoneLeft` TODO

Predicate logic:

  ∀ (A₁ A₂ B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSubset.Subset A₁ A₂ → LRA.Set.Constructions.ZFCSet.instHasSubset.Subset (LRA.Set.Constructions.ZFCA₁ \ B) (LRA.Set.Constructions.ZFCA₂ \ B)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCSet.instHasSubset.1 A₁ A₂ → LRA.Set.Constructions.ZFCSet.instHasSubset.1 (LRA.Set.Constructions.ZFCA₁ \ B) (LRA.Set.Constructions.ZFCA₂ \ B)

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

  ∀ (A B₁ B₂ : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSubset.Subset B₁ B₂ → LRA.Set.Constructions.ZFCSet.instHasSubset.Subset (LRA.Set.Constructions.ZFCA \ B₂) (LRA.Set.Constructions.ZFCA \ B₁)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCSet.instHasSubset.1 B₁ B₂ → LRA.Set.Constructions.ZFCSet.instHasSubset.1 (LRA.Set.Constructions.ZFCA \ B₂) (LRA.Set.Constructions.ZFCA \ B₁)

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

  ∀ (A : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCA \ LRA.Set.Constructions.ZFCSet.instEmptyCollection.emptyCollection = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCA \ LRA.Set.Constructions.ZFCSet.instEmptyCollection.1 = A

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

  ∀ (A : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCSet.instEmptyCollection.emptyCollection \ A = LRA.Set.Constructions.ZFCSet.instEmptyCollection.emptyCollection

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCSet.instEmptyCollection.1 \ A = LRA.Set.Constructions.ZFCSet.instEmptyCollection.1

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

  ∀ (A : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCA \ A = LRA.Set.Constructions.ZFCSet.instEmptyCollection.emptyCollection

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCA \ A = LRA.Set.Constructions.ZFCSet.instEmptyCollection.1

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

  ∀ (A B C : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCA \ LRA.Set.Constructions.ZFCB ∪ C = LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA \ B ∩ LRA.Set.Constructions.ZFCA \ C

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCA \ LRA.Set.Constructions.ZFCB ∪ C = LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA \ B ∩ LRA.Set.Constructions.ZFCA \ C

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

  ∀ (A B C : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCA \ LRA.Set.Constructions.ZFCB ∩ C = LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA \ B ∪ LRA.Set.Constructions.ZFCA \ C

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCA \ LRA.Set.Constructions.ZFCB ∩ C = LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA \ B ∪ LRA.Set.Constructions.ZFCA \ C

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

  ∀ (A B C : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA ∪ B \ C = LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA \ C ∪ LRA.Set.Constructions.ZFCB \ C

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA ∪ B \ C = LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA \ C ∪ LRA.Set.Constructions.ZFCB \ C

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

  ∀ (A B C : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA ∩ B \ C = LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA \ C ∩ LRA.Set.Constructions.ZFCB \ C

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA ∩ B \ C = LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA \ C ∩ LRA.Set.Constructions.ZFCB \ C

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

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSubset.Subset (LRA.Set.Constructions.ZFCA \ B)A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCSet.instHasSubset.1 (LRA.Set.Constructions.ZFCA \ B)A

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

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA \ B ∩ B = LRA.Set.Constructions.ZFCSet.instEmptyCollection.emptyCollection

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA \ B ∩ B = LRA.Set.Constructions.ZFCSet.instEmptyCollection.1

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
