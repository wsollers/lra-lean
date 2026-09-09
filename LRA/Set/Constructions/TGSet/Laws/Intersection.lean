import LRA.Set.Constructions.TGSet.Instances
import LRA.Set.Interface.Laws.Intersection

namespace LRA.Set.Constructions.TGSet

/--
`IntersectionCommutative` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGA ∩ B = LRA.Set.Constructions.TGB ∩ A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGA ∩ B = LRA.Set.Constructions.TGB ∩ A

Logical form (Lean):

```lean
theorem IntersectionCommutative : forall A B : Set, A ∩ B = B ∩ A
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
theorem IntersectionCommutative : forall A B : Set, A ∩ B = B ∩ A := by
  sorry

/--
`IntersectionAssociative` TODO

Predicate logic:

  ∀ (A B C : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGLRA.Set.Constructions.TGA ∩ B ∩ C = LRA.Set.Constructions.TGA ∩ LRA.Set.Constructions.TGB ∩ C

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGLRA.Set.Constructions.TGA ∩ B ∩ C = LRA.Set.Constructions.TGA ∩ LRA.Set.Constructions.TGB ∩ C

Logical form (Lean):

```lean
theorem IntersectionAssociative :
    forall A B C : Set, (A ∩ B) ∩ C = A ∩ (B ∩ C)
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
    forall A B C : Set, (A ∩ B) ∩ C = A ∩ (B ∩ C) := by
  sorry

/--
`IntersectionIdempotent` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGA ∩ A = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGA ∩ A = A

Logical form (Lean):

```lean
theorem IntersectionIdempotent : forall A : Set, A ∩ A = A
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
theorem IntersectionIdempotent : forall A : Set, A ∩ A = A := by
  sorry

/--
`EmptyIntersection` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGLRA.Set.Constructions.TGSet.instEmptyCollection.emptyCollection ∩ A = LRA.Set.Constructions.TGSet.instEmptyCollection.emptyCollection

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGLRA.Set.Constructions.TGSet.instEmptyCollection.1 ∩ A = LRA.Set.Constructions.TGSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem EmptyIntersection : forall A : Set, (∅ : Set) ∩ A = (∅ : Set)
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
theorem EmptyIntersection : forall A : Set, (∅ : Set) ∩ A = (∅ : Set) := by
  sorry

/--
`IntersectionEmpty` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGA ∩ LRA.Set.Constructions.TGSet.instEmptyCollection.emptyCollection = LRA.Set.Constructions.TGSet.instEmptyCollection.emptyCollection

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGA ∩ LRA.Set.Constructions.TGSet.instEmptyCollection.1 = LRA.Set.Constructions.TGSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem IntersectionEmpty : forall A : Set, A ∩ (∅ : Set) = (∅ : Set)
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
theorem IntersectionEmpty : forall A : Set, A ∩ (∅ : Set) = (∅ : Set) := by
  sorry

/--
`IntersectionMonotone` TODO

Predicate logic:

  ∀ (A1 A2 B1 B2 : LRA.Set.Constructions.TGSet.Set), (LRA.Set.Constructions.TGSet.instHasSubset.Subset A1 A2 ∧ LRA.Set.Constructions.TGSet.instHasSubset.Subset B1 B2) → LRA.Set.Constructions.TGSet.instHasSubset.Subset (LRA.Set.Constructions.TGA1 ∩ B1) (LRA.Set.Constructions.TGA2 ∩ B2)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (LRA.Set.Constructions.TGSet.instHasSubset.1 A1 A2 ∧ LRA.Set.Constructions.TGSet.instHasSubset.1 B1 B2) → LRA.Set.Constructions.TGSet.instHasSubset.1 (LRA.Set.Constructions.TGA1 ∩ B1) (LRA.Set.Constructions.TGA2 ∩ B2)

Logical form (Lean):

```lean
theorem IntersectionMonotone :
    forall A1 A2 B1 B2 : Set, A1 ⊆ A2 -> B1 ⊆ B2 -> A1 ∩ B1 ⊆ A2 ∩ B2
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
    forall A1 A2 B1 B2 : Set, A1 ⊆ A2 -> B1 ⊆ B2 -> A1 ∩ B1 ⊆ A2 ∩ B2 := by
  sorry

/--
`SubsetIffIntersectionEqLeft` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instHasSubset.Subset A B ↔ LRA.Set.Constructions.TGA ∩ B = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGSet.instHasSubset.Subset A B ↔ LRA.Set.Constructions.TGA ∩ B = A

Logical form (Lean):

```lean
theorem SubsetIffIntersectionEqLeft :
    forall A B : Set, A ⊆ B <-> A ∩ B = A
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
    forall A B : Set, A ⊆ B <-> A ∩ B = A := by
  sorry

end LRA.Set.Constructions.TGSet
