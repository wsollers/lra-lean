import LRA.Set.Constructions.ZFCSet.Instances
import LRA.Set.Interface.Laws.Intersection

namespace LRA.Set.Constructions.ZFCSet

/--
`IntersectionCommutative` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCA ∩ B = LRA.Set.Constructions.ZFCB ∩ A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCA ∩ B = LRA.Set.Constructions.ZFCB ∩ A

Logical form (Lean):

```lean
theorem IntersectionCommutative : ∀ A B : Set, A ∩ B = B ∩ A
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
theorem IntersectionCommutative : ∀ A B : Set, A ∩ B = B ∩ A := by
  sorry

/--
`IntersectionAssociative` TODO

Predicate logic:

  ∀ (A B C : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA ∩ B ∩ C = LRA.Set.Constructions.ZFCA ∩ LRA.Set.Constructions.ZFCB ∩ C

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCA ∩ B ∩ C = LRA.Set.Constructions.ZFCA ∩ LRA.Set.Constructions.ZFCB ∩ C

Logical form (Lean):

```lean
theorem IntersectionAssociative :
    ∀ A B C : Set, (A ∩ B) ∩ C = A ∩ (B ∩ C)
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
theorem IntersectionAssociative :
    ∀ A B C : Set, (A ∩ B) ∩ C = A ∩ (B ∩ C) := by
  sorry

/--
`EmptyIntersection` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCSet.instEmptyCollection.emptyCollection ∩ A = LRA.Set.Constructions.ZFCSet.instEmptyCollection.emptyCollection

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCLRA.Set.Constructions.ZFCSet.instEmptyCollection.1 ∩ A = LRA.Set.Constructions.ZFCSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem EmptyIntersection : ∀ A : Set, (∅ : Set) ∩ A = (∅ : Set)
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
theorem EmptyIntersection : ∀ A : Set, (∅ : Set) ∩ A = (∅ : Set) := by
  sorry

/--
`IntersectionEmpty` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCA ∩ LRA.Set.Constructions.ZFCSet.instEmptyCollection.emptyCollection = LRA.Set.Constructions.ZFCSet.instEmptyCollection.emptyCollection

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCA ∩ LRA.Set.Constructions.ZFCSet.instEmptyCollection.1 = LRA.Set.Constructions.ZFCSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem IntersectionEmpty : ∀ A : Set, A ∩ (∅ : Set) = (∅ : Set)
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
theorem IntersectionEmpty : ∀ A : Set, A ∩ (∅ : Set) = (∅ : Set) := by
  sorry

/--
`IntersectionIdempotent` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCA ∩ A = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCA ∩ A = A

Logical form (Lean):

```lean
theorem IntersectionIdempotent : ∀ A : Set, A ∩ A = A
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
theorem IntersectionIdempotent : ∀ A : Set, A ∩ A = A := by
  sorry

/--
`IntersectionMonotone` TODO

Predicate logic:

  ∀ (A₁ A₂ B₁ B₂ : LRA.Set.Constructions.ZFCSet.Set), (LRA.Set.Constructions.ZFCSet.instHasSubset.Subset A₁ A₂ ∧ LRA.Set.Constructions.ZFCSet.instHasSubset.Subset B₁ B₂) → LRA.Set.Constructions.ZFCSet.instHasSubset.Subset (LRA.Set.Constructions.ZFCA₁ ∩ B₁) (LRA.Set.Constructions.ZFCA₂ ∩ B₂)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (LRA.Set.Constructions.ZFCSet.instHasSubset.1 A₁ A₂ ∧ LRA.Set.Constructions.ZFCSet.instHasSubset.1 B₁ B₂) → LRA.Set.Constructions.ZFCSet.instHasSubset.1 (LRA.Set.Constructions.ZFCA₁ ∩ B₁) (LRA.Set.Constructions.ZFCA₂ ∩ B₂)

Logical form (Lean):

```lean
theorem IntersectionMonotone :
    ∀ A₁ A₂ B₁ B₂ : Set, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂
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
theorem IntersectionMonotone :
    ∀ A₁ A₂ B₁ B₂ : Set, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂ := by
  sorry

/--
`SubsetIffIntersectionEqLeft` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSubset.Subset A B ↔ LRA.Set.Constructions.ZFCA ∩ B = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCSet.instHasSubset.Subset A B ↔ LRA.Set.Constructions.ZFCA ∩ B = A

Logical form (Lean):

```lean
theorem SubsetIffIntersectionEqLeft :
    ∀ A B : Set, A ⊆ B ↔ A ∩ B = A
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
theorem SubsetIffIntersectionEqLeft :
    ∀ A B : Set, A ⊆ B ↔ A ∩ B = A := by
  sorry

end LRA.Set.Constructions.ZFCSet
