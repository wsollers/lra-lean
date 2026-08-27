import LRA.Set.Constructions.TypeSet.Instances
import LRA.Set.Interface.Difference

namespace LRA.Set.Constructions.TypeSet

universe u

variable {Alpha : Type u}

/--
`DifferenceMonotoneLeft` TODO

Predicate logic:

  ∀ A₁ A₂ B : LRA.Set.Constructions.TypeSet Alpha, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A₁ A₂ B : Alpha → Prop), LRA.Set.Constructions.TypeSet.instHasSubset.1 A₁ A₂ → LRA.Set.Constructions.TypeSet.instHasSubset.1 (LRA.Set.Constructions.TypeSet.instSDiff.1 A₁ B) (LRA.Set.Constructions.TypeSet.instSDiff.1 A₂ B)

Logical form (Lean):

```lean
theorem DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : LRA.Set.Constructions.TypeSet Alpha,
      A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B
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
    ∀ A₁ A₂ B : LRA.Set.Constructions.TypeSet Alpha,
      A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B := by
  sorry

/--
`DifferenceAntitoneRight` TODO

Predicate logic:

  ∀ A B₁ B₂ : LRA.Set.Constructions.TypeSet Alpha, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B₁ B₂ : Alpha → Prop), LRA.Set.Constructions.TypeSet.instHasSubset.1 B₁ B₂ → LRA.Set.Constructions.TypeSet.instHasSubset.1 (LRA.Set.Constructions.TypeSet.instSDiff.1 A B₂) (LRA.Set.Constructions.TypeSet.instSDiff.1 A B₁)

Logical form (Lean):

```lean
theorem DifferenceAntitoneRight :
    ∀ A B₁ B₂ : LRA.Set.Constructions.TypeSet Alpha,
      B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁
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
    ∀ A B₁ B₂ : LRA.Set.Constructions.TypeSet Alpha,
      B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁ := by
  sorry

/--
`DifferenceEmpty` TODO

Predicate logic:

  ∀ A : LRA.Set.Constructions.TypeSet Alpha, A \ ∅ ∈ LRA.Set.Constructions.TypeSet Alpha = A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.Constructions.TypeSet.instSDiff.1 A LRA.Set.Constructions.TypeSet.instEmptyCollection.1 = A

Logical form (Lean):

```lean
theorem DifferenceEmpty :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A \ (∅ : LRA.Set.Constructions.TypeSet Alpha) = A
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
theorem DifferenceEmpty :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A \ (∅ : LRA.Set.Constructions.TypeSet Alpha) = A := by
  sorry

/--
`EmptyDifference` TODO

Predicate logic:

  ∀ A : LRA.Set.Constructions.TypeSet Alpha, ∅ ∈ LRA.Set.Constructions.TypeSet Alpha \ A = ∅ ∈ LRA.Set.Constructions.TypeSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.Constructions.TypeSet.instSDiff.1 LRA.Set.Constructions.TypeSet.instEmptyCollection.1 A = LRA.Set.Constructions.TypeSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem EmptyDifference :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      (∅ : LRA.Set.Constructions.TypeSet Alpha) \ A = (∅ : LRA.Set.Constructions.TypeSet Alpha)
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
theorem EmptyDifference :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      (∅ : LRA.Set.Constructions.TypeSet Alpha) \ A = (∅ : LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

/--
`DifferenceSelf` TODO

Predicate logic:

  ∀ A : LRA.Set.Constructions.TypeSet Alpha, A \ A = ∅ ∈ LRA.Set.Constructions.TypeSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A : Alpha → Prop), LRA.Set.Constructions.TypeSet.instSDiff.1 A A = LRA.Set.Constructions.TypeSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem DifferenceSelf :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A \ A = (∅ : LRA.Set.Constructions.TypeSet Alpha)
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
theorem DifferenceSelf :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A \ A = (∅ : LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

/--
`DifferenceUnion` TODO

Predicate logic:

  ∀ A B C : LRA.Set.Constructions.TypeSet Alpha, A \ (B ∪ C) = (A \ B) ∩ (A \ C)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B C : Alpha → Prop), LRA.Set.Constructions.TypeSet.instSDiff.1 A (LRA.Set.Constructions.TypeSet.instUnion.1 B C) = LRA.Set.Constructions.TypeSet.instInter.1 (LRA.Set.Constructions.TypeSet.instSDiff.1 A B) (LRA.Set.Constructions.TypeSet.instSDiff.1 A C)

Logical form (Lean):

```lean
theorem DifferenceUnion :
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha,
      A \ (B ∪ C) = (A \ B) ∩ (A \ C)
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
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha,
      A \ (B ∪ C) = (A \ B) ∩ (A \ C) := by
  sorry

/--
`DifferenceIntersection` TODO

Predicate logic:

  ∀ A B C : LRA.Set.Constructions.TypeSet Alpha, A \ (B ∩ C) = (A \ B) ∪ (A \ C)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B C : Alpha → Prop), LRA.Set.Constructions.TypeSet.instSDiff.1 A (LRA.Set.Constructions.TypeSet.instInter.1 B C) = LRA.Set.Constructions.TypeSet.instUnion.1 (LRA.Set.Constructions.TypeSet.instSDiff.1 A B) (LRA.Set.Constructions.TypeSet.instSDiff.1 A C)

Logical form (Lean):

```lean
theorem DifferenceIntersection :
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha,
      A \ (B ∩ C) = (A \ B) ∪ (A \ C)
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
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha,
      A \ (B ∩ C) = (A \ B) ∪ (A \ C) := by
  sorry

/--
`UnionDifferenceDistributes` TODO

Predicate logic:

  ∀ A B C : LRA.Set.Constructions.TypeSet Alpha, (A ∪ B) \ C = (A \ C) ∪ (B \ C)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B C : Alpha → Prop), LRA.Set.Constructions.TypeSet.instSDiff.1 (LRA.Set.Constructions.TypeSet.instUnion.1 A B) C = LRA.Set.Constructions.TypeSet.instUnion.1 (LRA.Set.Constructions.TypeSet.instSDiff.1 A C) (LRA.Set.Constructions.TypeSet.instSDiff.1 B C)

Logical form (Lean):

```lean
theorem UnionDifferenceDistributes :
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha,
      (A ∪ B) \ C = (A \ C) ∪ (B \ C)
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
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha,
      (A ∪ B) \ C = (A \ C) ∪ (B \ C) := by
  sorry

/--
`IntersectionDifferenceDistributes` TODO

Predicate logic:

  ∀ A B C : LRA.Set.Constructions.TypeSet Alpha, (A ∩ B) \ C = (A \ C) ∩ (B \ C)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B C : Alpha → Prop), LRA.Set.Constructions.TypeSet.instSDiff.1 (LRA.Set.Constructions.TypeSet.instInter.1 A B) C = LRA.Set.Constructions.TypeSet.instInter.1 (LRA.Set.Constructions.TypeSet.instSDiff.1 A C) (LRA.Set.Constructions.TypeSet.instSDiff.1 B C)

Logical form (Lean):

```lean
theorem IntersectionDifferenceDistributes :
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha,
      (A ∩ B) \ C = (A \ C) ∩ (B \ C)
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
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha,
      (A ∩ B) \ C = (A \ C) ∩ (B \ C) := by
  sorry

/--
`DifferenceSubsetLeft` TODO

Predicate logic:

  ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A \ B ⊆ A

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.Constructions.TypeSet.instHasSubset.1 (LRA.Set.Constructions.TypeSet.instSDiff.1 A B) A

Logical form (Lean):

```lean
theorem DifferenceSubsetLeft :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A \ B ⊆ A
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
theorem DifferenceSubsetLeft :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A \ B ⊆ A := by
  sorry

/--
`DifferenceDisjointRight` TODO

Predicate logic:

  ∀ A B : LRA.Set.Constructions.TypeSet Alpha, (A \ B) ∩ B = ∅ ∈ LRA.Set.Constructions.TypeSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (A B : Alpha → Prop), LRA.Set.Constructions.TypeSet.instInter.1 (LRA.Set.Constructions.TypeSet.instSDiff.1 A B) B = LRA.Set.Constructions.TypeSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem DifferenceDisjointRight :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha,
      (A \ B) ∩ B = (∅ : LRA.Set.Constructions.TypeSet Alpha)
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
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha,
      (A \ B) ∩ B = (∅ : LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

end LRA.Set.Constructions.TypeSet
