import LRA.Set.Constructions.TGSet.Instances
import LRA.Set.Interface.Laws.Union

namespace LRA.Set.Constructions.TGSet

/--
`UnionCommutative` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGA ∪ B = LRA.Set.Constructions.TGB ∪ A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGA ∪ B = LRA.Set.Constructions.TGB ∪ A

Logical form (Lean):

```lean
theorem UnionCommutative : forall A B : Set, A ∪ B = B ∪ A
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
theorem UnionCommutative : forall A B : Set, A ∪ B = B ∪ A := by
  sorry

/--
`UnionAssociative` TODO

Predicate logic:

  ∀ (A B C : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGLRA.Set.Constructions.TGA ∪ B ∪ C = LRA.Set.Constructions.TGA ∪ LRA.Set.Constructions.TGB ∪ C

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGLRA.Set.Constructions.TGA ∪ B ∪ C = LRA.Set.Constructions.TGA ∪ LRA.Set.Constructions.TGB ∪ C

Logical form (Lean):

```lean
theorem UnionAssociative :
    forall A B C : Set, (A ∪ B) ∪ C = A ∪ (B ∪ C)
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
theorem UnionAssociative :
    forall A B C : Set, (A ∪ B) ∪ C = A ∪ (B ∪ C) := by
  sorry

/--
`EmptyUnion` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGLRA.Set.Constructions.TGSet.instEmptyCollection.emptyCollection ∪ A = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGLRA.Set.Constructions.TGSet.instEmptyCollection.1 ∪ A = A

Logical form (Lean):

```lean
theorem EmptyUnion : forall A : Set, (∅ : Set) ∪ A = A
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
theorem EmptyUnion : forall A : Set, (∅ : Set) ∪ A = A := by
  sorry

/--
`UnionEmpty` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGA ∪ LRA.Set.Constructions.TGSet.instEmptyCollection.emptyCollection = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGA ∪ LRA.Set.Constructions.TGSet.instEmptyCollection.1 = A

Logical form (Lean):

```lean
theorem UnionEmpty : forall A : Set, A ∪ (∅ : Set) = A
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
theorem UnionEmpty : forall A : Set, A ∪ (∅ : Set) = A := by
  sorry

/--
`UnionIdempotent` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGA ∪ A = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGA ∪ A = A

Logical form (Lean):

```lean
theorem UnionIdempotent : forall A : Set, A ∪ A = A
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
theorem UnionIdempotent : forall A : Set, A ∪ A = A := by
  sorry

/--
`UnionMonotone` TODO

Predicate logic:

  ∀ (A1 A2 B1 B2 : LRA.Set.Constructions.TGSet.Set), (LRA.Set.Constructions.TGSet.instHasSubset.Subset A1 A2 ∧ LRA.Set.Constructions.TGSet.instHasSubset.Subset B1 B2) → LRA.Set.Constructions.TGSet.instHasSubset.Subset (LRA.Set.Constructions.TGA1 ∪ B1) (LRA.Set.Constructions.TGA2 ∪ B2)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (LRA.Set.Constructions.TGSet.instHasSubset.1 A1 A2 ∧ LRA.Set.Constructions.TGSet.instHasSubset.1 B1 B2) → LRA.Set.Constructions.TGSet.instHasSubset.1 (LRA.Set.Constructions.TGA1 ∪ B1) (LRA.Set.Constructions.TGA2 ∪ B2)

Logical form (Lean):

```lean
theorem UnionMonotone :
    forall A1 A2 B1 B2 : Set, A1 ⊆ A2 -> B1 ⊆ B2 -> A1 ∪ B1 ⊆ A2 ∪ B2
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
theorem UnionMonotone :
    forall A1 A2 B1 B2 : Set, A1 ⊆ A2 -> B1 ⊆ B2 -> A1 ∪ B1 ⊆ A2 ∪ B2 := by
  sorry

/--
`SubsetIffUnionEqRight` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instHasSubset.Subset A B ↔ LRA.Set.Constructions.TGA ∪ B = B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGSet.instHasSubset.Subset A B ↔ LRA.Set.Constructions.TGA ∪ B = B

Logical form (Lean):

```lean
theorem SubsetIffUnionEqRight :
    forall A B : Set, A ⊆ B <-> A ∪ B = B
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
theorem SubsetIffUnionEqRight :
    forall A B : Set, A ⊆ B <-> A ∪ B = B := by
  sorry

end LRA.Set.Constructions.TGSet
