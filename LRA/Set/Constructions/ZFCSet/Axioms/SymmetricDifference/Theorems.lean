import LRA.Set.Constructions.ZFCSet.Axioms.Union.Theorems
import LRA.Set.Constructions.ZFCSet.Axioms.RelativeComplement.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`TheSymmetricDifference` TODO

Predicate logic:

  noncomputable def TheSymmetricDifference (A B : Set) : Set :=
  TheUnion (TheRelativeComplement A B) (TheRelativeComplement B A)

Predicate logic (unfolded):

  noncomputable def TheSymmetricDifference (A B : Set) : Set :=
  TheUnion (TheRelativeComplement A B) (TheRelativeComplement B A) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheSymmetricDifference (A B : Set) : Set :=
  TheUnion (TheRelativeComplement A B) (TheRelativeComplement B A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def TheSymmetricDifference (A B : Set) : Set :=
  TheUnion (TheRelativeComplement A B) (TheRelativeComplement B A)

/--
`TheSymmetricDifferenceIsSymmetricDifferenceOf` TODO

Predicate logic:

  (∀ A B ∈ Set), IsSymmetricDifferenceOf A B (TheSymmetricDifference A B)

Predicate logic (unfolded):

  ∀ (A B x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsUnionOf (LRA.Set.Constructions.ZFCSet.Axioms.PairSet (LRA.Set.Constructions.ZFCSet.Axioms.TheRelativeComplement A B) (LRA.Set.Constructions.ZFCSet.Axioms.TheRelativeComplement B A))) ⋯).val x ↔ Or ((LRA.Set.instMembershipZFCSet.1 A x ∧ LRA.Set.instMembershipZFCSet.1 B x → False)) ((LRA.Set.instMembershipZFCSet.1 B x ∧ LRA.Set.instMembershipZFCSet.1 A x → False))

Logical form (Lean):

```lean
theorem TheSymmetricDifferenceIsSymmetricDifferenceOf (A B : Set) :
    IsSymmetricDifferenceOf A B (TheSymmetricDifference A B)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem TheSymmetricDifferenceIsSymmetricDifferenceOf (A B : Set) :
    IsSymmetricDifferenceOf A B (TheSymmetricDifference A B) := by
  sorry

/--
`TheSymmetricDifferenceMembership` TODO

Predicate logic:

  (∀ A B x ∈ Set), x ∈ TheSymmetricDifference A B ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)

Predicate logic (unfolded):

  ∀ (A B x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsUnionOf (LRA.Set.Constructions.ZFCSet.Axioms.PairSet (LRA.Set.Constructions.ZFCSet.Axioms.TheRelativeComplement A B) (LRA.Set.Constructions.ZFCSet.Axioms.TheRelativeComplement B A))) ⋯).1 x ↔ Or ((LRA.Set.instMembershipZFCSet.1 A x ∧ LRA.Set.instMembershipZFCSet.1 B x → False)) ((LRA.Set.instMembershipZFCSet.1 B x ∧ LRA.Set.instMembershipZFCSet.1 A x → False))

Logical form (Lean):

```lean
theorem TheSymmetricDifferenceMembership (A B x : Set) :
    x ∈ TheSymmetricDifference A B ↔
      (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases, Or.inl, Or.inr

-/
theorem TheSymmetricDifferenceMembership (A B x : Set) :
    x ∈ TheSymmetricDifference A B ↔
      (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A) := by
  sorry

/--
`EverySymmetricDifferenceEqualsTheSymmetricDifference` TODO

Predicate logic:

  (IsSymmetricDifferenceOf A B D) → D = TheSymmetricDifference A B

Predicate logic (unfolded):

  ∀ {A B D : LRA.Set.Constructions.ZFCSet.Axioms.Set}, (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 D x ↔ Or ((LRA.Set.instMembershipZFCSet.1 A x ∧ LRA.Set.instMembershipZFCSet.1 B x → False)) ((LRA.Set.instMembershipZFCSet.1 B x ∧ LRA.Set.instMembershipZFCSet.1 A x → False))) → D = Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsUnionOf (LRA.Set.Constructions.ZFCSet.Axioms.PairSet (LRA.Set.Constructions.ZFCSet.Axioms.TheRelativeComplement A B) (LRA.Set.Constructions.ZFCSet.Axioms.TheRelativeComplement B A))) ⋯.1

Logical form (Lean):

```lean
theorem EverySymmetricDifferenceEqualsTheSymmetricDifference
    {A B D : Set}
    (DIsSymmetricDifferenceOf : IsSymmetricDifferenceOf A B D) :
    D = TheSymmetricDifference A B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem EverySymmetricDifferenceEqualsTheSymmetricDifference
    {A B D : Set}
    (DIsSymmetricDifferenceOf : IsSymmetricDifferenceOf A B D) :
    D = TheSymmetricDifference A B := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
