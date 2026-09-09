import LRA.Set.Constructions.TypeSet.Instances
import LRA.Set.Interface.Laws.Difference

namespace LRA.Set.Constructions.TypeSet

universe u

variable {Alpha : Type u}

/--
`DifferenceMonotoneLeft` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A₁ A₂ B : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeSet.instHasSubset.Subset A₁ A₂ → LRA.Set.Constructions.TypeSet.instHasSubset.Subset (LRA.Set.Constructions.TypeA₁ \ B) (LRA.Set.Constructions.TypeA₂ \ B)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeSet.instHasSubset.1 A₁ A₂ → LRA.Set.Constructions.TypeSet.instHasSubset.1 (LRA.Set.Constructions.TypeA₁ \ B) (LRA.Set.Constructions.TypeA₂ \ B)

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

  ∀ {Alpha : Type u} (A B₁ B₂ : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeSet.instHasSubset.Subset B₁ B₂ → LRA.Set.Constructions.TypeSet.instHasSubset.Subset (LRA.Set.Constructions.TypeA \ B₂) (LRA.Set.Constructions.TypeA \ B₁)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeSet.instHasSubset.1 B₁ B₂ → LRA.Set.Constructions.TypeSet.instHasSubset.1 (LRA.Set.Constructions.TypeA \ B₂) (LRA.Set.Constructions.TypeA \ B₁)

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

  ∀ {Alpha : Type u} (A : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeA \ LRA.Set.Constructions.TypeSet.instEmptyCollection.emptyCollection = A

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeA \ LRA.Set.Constructions.TypeSet.instEmptyCollection.1 = A

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

  ∀ {Alpha : Type u} (A : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeSet.instEmptyCollection.emptyCollection \ A = LRA.Set.Constructions.TypeSet.instEmptyCollection.emptyCollection

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeSet.instEmptyCollection.1 \ A = LRA.Set.Constructions.TypeSet.instEmptyCollection.1

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

  ∀ {Alpha : Type u} (A : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeA \ A = LRA.Set.Constructions.TypeSet.instEmptyCollection.emptyCollection

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeA \ A = LRA.Set.Constructions.TypeSet.instEmptyCollection.1

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

  ∀ {Alpha : Type u} (A B C : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeA \ LRA.Set.Constructions.TypeB ∪ C = LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA \ B ∩ LRA.Set.Constructions.TypeA \ C

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeA \ LRA.Set.Constructions.TypeB ∪ C = LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA \ B ∩ LRA.Set.Constructions.TypeA \ C

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

  ∀ {Alpha : Type u} (A B C : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeA \ LRA.Set.Constructions.TypeB ∩ C = LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA \ B ∪ LRA.Set.Constructions.TypeA \ C

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeA \ LRA.Set.Constructions.TypeB ∩ C = LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA \ B ∪ LRA.Set.Constructions.TypeA \ C

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

  ∀ {Alpha : Type u} (A B C : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA ∪ B \ C = LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA \ C ∪ LRA.Set.Constructions.TypeB \ C

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA ∪ B \ C = LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA \ C ∪ LRA.Set.Constructions.TypeB \ C

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

  ∀ {Alpha : Type u} (A B C : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA ∩ B \ C = LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA \ C ∩ LRA.Set.Constructions.TypeB \ C

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA ∩ B \ C = LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA \ C ∩ LRA.Set.Constructions.TypeB \ C

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

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeSet.instHasSubset.Subset (LRA.Set.Constructions.TypeA \ B)A

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeSet.instHasSubset.1 (LRA.Set.Constructions.TypeA \ B)A

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

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA \ B ∩ B = LRA.Set.Constructions.TypeSet.instEmptyCollection.emptyCollection

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA \ B ∩ B = LRA.Set.Constructions.TypeSet.instEmptyCollection.1

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
