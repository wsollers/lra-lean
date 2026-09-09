import LRA.Set.Constructions.TypeSet.Instances
import LRA.Set.Interface.Laws.Intersection

namespace LRA.Set.Constructions.TypeSet

universe u

variable {Alpha : Type u}

/--
`IntersectionCommutative` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeA ∩ B = LRA.Set.Constructions.TypeB ∩ A

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeA ∩ B = LRA.Set.Constructions.TypeB ∩ A

Logical form (Lean):

```lean
theorem IntersectionCommutative :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∩ B = B ∩ A
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
theorem IntersectionCommutative :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ∩ B = B ∩ A := by
  sorry

/--
`IntersectionAssociative` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B C : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA ∩ B ∩ C = LRA.Set.Constructions.TypeA ∩ LRA.Set.Constructions.TypeB ∩ C

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeA ∩ B ∩ C = LRA.Set.Constructions.TypeA ∩ LRA.Set.Constructions.TypeB ∩ C

Logical form (Lean):

```lean
theorem IntersectionAssociative :
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha, (A ∩ B) ∩ C = A ∩ (B ∩ C)
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
    ∀ A B C : LRA.Set.Constructions.TypeSet Alpha, (A ∩ B) ∩ C = A ∩ (B ∩ C) := by
  sorry

/--
`EmptyIntersection` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeSet.instEmptyCollection.emptyCollection ∩ A = LRA.Set.Constructions.TypeSet.instEmptyCollection.emptyCollection

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeLRA.Set.Constructions.TypeSet.instEmptyCollection.1 ∩ A = LRA.Set.Constructions.TypeSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem EmptyIntersection :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      (∅ : LRA.Set.Constructions.TypeSet Alpha) ∩ A = (∅ : LRA.Set.Constructions.TypeSet Alpha)
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
theorem EmptyIntersection :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      (∅ : LRA.Set.Constructions.TypeSet Alpha) ∩ A = (∅ : LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

/--
`IntersectionEmpty` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeA ∩ LRA.Set.Constructions.TypeSet.instEmptyCollection.emptyCollection = LRA.Set.Constructions.TypeSet.instEmptyCollection.emptyCollection

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeA ∩ LRA.Set.Constructions.TypeSet.instEmptyCollection.1 = LRA.Set.Constructions.TypeSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem IntersectionEmpty :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A ∩ (∅ : LRA.Set.Constructions.TypeSet Alpha) = (∅ : LRA.Set.Constructions.TypeSet Alpha)
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
theorem IntersectionEmpty :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha,
      A ∩ (∅ : LRA.Set.Constructions.TypeSet Alpha) = (∅ : LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

/--
`IntersectionIdempotent` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeA ∩ A = A

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeA ∩ A = A

Logical form (Lean):

```lean
theorem IntersectionIdempotent :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha, A ∩ A = A
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
theorem IntersectionIdempotent :
    ∀ A : LRA.Set.Constructions.TypeSet Alpha, A ∩ A = A := by
  sorry

/--
`IntersectionMonotone` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A₁ A₂ B₁ B₂ : LRA.Set.Constructions.TypeSet Alpha), (LRA.Set.Constructions.TypeSet.instHasSubset.Subset A₁ A₂ ∧ LRA.Set.Constructions.TypeSet.instHasSubset.Subset B₁ B₂) → LRA.Set.Constructions.TypeSet.instHasSubset.Subset (LRA.Set.Constructions.TypeA₁ ∩ B₁) (LRA.Set.Constructions.TypeA₂ ∩ B₂)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    (LRA.Set.Constructions.TypeSet.instHasSubset.1 A₁ A₂ ∧ LRA.Set.Constructions.TypeSet.instHasSubset.1 B₁ B₂) → LRA.Set.Constructions.TypeSet.instHasSubset.1 (LRA.Set.Constructions.TypeA₁ ∩ B₁) (LRA.Set.Constructions.TypeA₂ ∩ B₂)

Logical form (Lean):

```lean
theorem IntersectionMonotone :
    ∀ A₁ A₂ B₁ B₂ : LRA.Set.Constructions.TypeSet Alpha,
      A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂
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
    ∀ A₁ A₂ B₁ B₂ : LRA.Set.Constructions.TypeSet Alpha,
      A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂ := by
  sorry

/--
`SubsetIffIntersectionEqLeft` TODO

Predicate logic:

  ∀ {Alpha : Type u} (A B : LRA.Set.Constructions.TypeSet Alpha), LRA.Set.Constructions.TypeSet.instHasSubset.Subset A B ↔ LRA.Set.Constructions.TypeA ∩ B = A

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TypeSet.instHasSubset.Subset A B ↔ LRA.Set.Constructions.TypeA ∩ B = A

Logical form (Lean):

```lean
theorem SubsetIffIntersectionEqLeft :
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ⊆ B ↔ A ∩ B = A
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
    ∀ A B : LRA.Set.Constructions.TypeSet Alpha, A ⊆ B ↔ A ∩ B = A := by
  sorry

end LRA.Set.Constructions.TypeSet
