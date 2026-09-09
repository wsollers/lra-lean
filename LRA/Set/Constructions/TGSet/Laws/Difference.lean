import LRA.Set.Constructions.TGSet.Instances
import LRA.Set.Interface.Laws.Difference

namespace LRA.Set.Constructions.TGSet

/--
`DifferenceMonotoneLeft` TODO

Predicate logic:

  ∀ (A1 A2 B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instHasSubset.Subset A1 A2 → LRA.Set.Constructions.TGSet.instHasSubset.Subset (LRA.Set.Constructions.TGA1 \ B) (LRA.Set.Constructions.TGA2 \ B)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGSet.instHasSubset.1 A1 A2 → LRA.Set.Constructions.TGSet.instHasSubset.1 (LRA.Set.Constructions.TGA1 \ B) (LRA.Set.Constructions.TGA2 \ B)

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

  ∀ (A B1 B2 : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instHasSubset.Subset B1 B2 → LRA.Set.Constructions.TGSet.instHasSubset.Subset (LRA.Set.Constructions.TGA \ B2) (LRA.Set.Constructions.TGA \ B1)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGSet.instHasSubset.1 B1 B2 → LRA.Set.Constructions.TGSet.instHasSubset.1 (LRA.Set.Constructions.TGA \ B2) (LRA.Set.Constructions.TGA \ B1)

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

  ∀ (A : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGA \ LRA.Set.Constructions.TGSet.instEmptyCollection.emptyCollection = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGA \ LRA.Set.Constructions.TGSet.instEmptyCollection.1 = A

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

  ∀ (A : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGLRA.Set.Constructions.TGSet.instEmptyCollection.emptyCollection \ A = LRA.Set.Constructions.TGSet.instEmptyCollection.emptyCollection

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGLRA.Set.Constructions.TGSet.instEmptyCollection.1 \ A = LRA.Set.Constructions.TGSet.instEmptyCollection.1

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

  ∀ (A : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGA \ A = LRA.Set.Constructions.TGSet.instEmptyCollection.emptyCollection

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGA \ A = LRA.Set.Constructions.TGSet.instEmptyCollection.1

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

  ∀ (A B C : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGA \ LRA.Set.Constructions.TGB ∪ C = LRA.Set.Constructions.TGLRA.Set.Constructions.TGA \ B ∩ LRA.Set.Constructions.TGA \ C

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGA \ LRA.Set.Constructions.TGB ∪ C = LRA.Set.Constructions.TGLRA.Set.Constructions.TGA \ B ∩ LRA.Set.Constructions.TGA \ C

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

  ∀ (A B C : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGA \ LRA.Set.Constructions.TGB ∩ C = LRA.Set.Constructions.TGLRA.Set.Constructions.TGA \ B ∪ LRA.Set.Constructions.TGA \ C

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGA \ LRA.Set.Constructions.TGB ∩ C = LRA.Set.Constructions.TGLRA.Set.Constructions.TGA \ B ∪ LRA.Set.Constructions.TGA \ C

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

  ∀ (A B C : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGLRA.Set.Constructions.TGA ∪ B \ C = LRA.Set.Constructions.TGLRA.Set.Constructions.TGA \ C ∪ LRA.Set.Constructions.TGB \ C

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGLRA.Set.Constructions.TGA ∪ B \ C = LRA.Set.Constructions.TGLRA.Set.Constructions.TGA \ C ∪ LRA.Set.Constructions.TGB \ C

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

  ∀ (A B C : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGLRA.Set.Constructions.TGA ∩ B \ C = LRA.Set.Constructions.TGLRA.Set.Constructions.TGA \ C ∩ LRA.Set.Constructions.TGB \ C

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGLRA.Set.Constructions.TGA ∩ B \ C = LRA.Set.Constructions.TGLRA.Set.Constructions.TGA \ C ∩ LRA.Set.Constructions.TGB \ C

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

  ∀ (A B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instHasSubset.Subset (LRA.Set.Constructions.TGA \ B)A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGSet.instHasSubset.1 (LRA.Set.Constructions.TGA \ B)A

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

  ∀ (A B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGLRA.Set.Constructions.TGA \ B ∩ B = LRA.Set.Constructions.TGSet.instEmptyCollection.emptyCollection

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGLRA.Set.Constructions.TGA \ B ∩ B = LRA.Set.Constructions.TGSet.instEmptyCollection.1

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

end LRA.Set.Constructions.TGSet
