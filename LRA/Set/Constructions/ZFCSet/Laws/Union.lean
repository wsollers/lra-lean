import LRA.Set.Constructions.ZFCSet.Instances
import LRA.Set.Interface.Laws.Union

namespace LRA.Set.Constructions.ZFCSet

/--
`UnionCommutative` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCA ∪ B = LRA.Set.Constructions.ZFCB ∪ A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCA ∪ B = LRA.Set.Constructions.ZFCB ∪ A

Logical form (Lean):

```lean
theorem UnionCommutative : ∀ A B : Set, A ∪ B = B ∪ A
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
theorem UnionCommutative : ∀ A B : Set, A ∪ B = B ∪ A := by
  sorry

/--
`UnionAssociative` TODO

Predicate logic:

  ∀ (A B C : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA ∪ B ∪ C = LRA.Set.Constructions.ZFCA ∪ LRA.Set.Constructions.ZFCB ∪ C

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA ∪ B ∪ C = LRA.Set.Constructions.ZFCA ∪ LRA.Set.Constructions.ZFCB ∪ C

Logical form (Lean):

```lean
theorem UnionAssociative :
    ∀ A B C : Set, (A ∪ B) ∪ C = A ∪ (B ∪ C)
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
    ∀ A B C : Set, (A ∪ B) ∪ C = A ∪ (B ∪ C) := by
  sorry

/--
`EmptyUnion` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCSet.instEmptyCollection.emptyCollection ∪ A = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCSet.instEmptyCollection.1 ∪ A = A

Logical form (Lean):

```lean
theorem EmptyUnion : ∀ A : Set, (∅ : Set) ∪ A = A
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
theorem EmptyUnion : ∀ A : Set, (∅ : Set) ∪ A = A := by
  sorry

/--
`UnionEmpty` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCA ∪ LRA.Set.Constructions.ZFCSet.instEmptyCollection.emptyCollection = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCA ∪ LRA.Set.Constructions.ZFCSet.instEmptyCollection.1 = A

Logical form (Lean):

```lean
theorem UnionEmpty : ∀ A : Set, A ∪ (∅ : Set) = A
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
theorem UnionEmpty : ∀ A : Set, A ∪ (∅ : Set) = A := by
  sorry

/--
`UnionIdempotent` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCA ∪ A = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCA ∪ A = A

Logical form (Lean):

```lean
theorem UnionIdempotent : ∀ A : Set, A ∪ A = A
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
theorem UnionIdempotent : ∀ A : Set, A ∪ A = A := by
  sorry

/--
`UnionMonotone` TODO

Predicate logic:

  ∀ (A₁ A₂ B₁ B₂ : LRA.Set.Constructions.ZFCSet.Set), (LRA.Set.Constructions.ZFCSet.instHasSubset.Subset A₁ A₂ ∧ LRA.Set.Constructions.ZFCSet.instHasSubset.Subset B₁ B₂) → LRA.Set.Constructions.ZFCSet.instHasSubset.Subset (LRA.Set.Constructions.ZFCA₁ ∪ B₁) (LRA.Set.Constructions.ZFCA₂ ∪ B₂)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (LRA.Set.Constructions.ZFCSet.instHasSubset.1 A₁ A₂ ∧ LRA.Set.Constructions.ZFCSet.instHasSubset.1 B₁ B₂) → LRA.Set.Constructions.ZFCSet.instHasSubset.1 (LRA.Set.Constructions.ZFCA₁ ∪ B₁) (LRA.Set.Constructions.ZFCA₂ ∪ B₂)

Logical form (Lean):

```lean
theorem UnionMonotone :
    ∀ A₁ A₂ B₁ B₂ : Set, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂
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
    ∀ A₁ A₂ B₁ B₂ : Set, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂ := by
  sorry

/--
`SubsetIffUnionEqRight` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSubset.Subset A B ↔ LRA.Set.Constructions.ZFCA ∪ B = B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCSet.instHasSubset.Subset A B ↔ LRA.Set.Constructions.ZFCA ∪ B = B

Logical form (Lean):

```lean
theorem SubsetIffUnionEqRight :
    ∀ A B : Set, A ⊆ B ↔ A ∪ B = B
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
    ∀ A B : Set, A ⊆ B ↔ A ∪ B = B := by
  sorry

end LRA.Set.Constructions.ZFCSet
