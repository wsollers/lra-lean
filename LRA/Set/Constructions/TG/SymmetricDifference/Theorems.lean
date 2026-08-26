import LRA.Set.Constructions.TG.Union.Theorems
import LRA.Set.Constructions.TG.RelativeComplement.Theorems

namespace LRA.Set.Constructions.TG

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

  ∀ (A B x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TG.IsUnionOf (LRA.Set.Constructions.TG.PairSet (LRA.Set.Constructions.TG.TheRelativeComplement A B) (LRA.Set.Constructions.TG.TheRelativeComplement B A))) ⋯).val x ↔ Or ((LRA.Set.instMembershipTGSet.1 A x ∧ LRA.Set.instMembershipTGSet.1 B x → False)) ((LRA.Set.instMembershipTGSet.1 B x ∧ LRA.Set.instMembershipTGSet.1 A x → False))

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

  (∀ A B x ∈ Set), x ∈ TheSymmetricDifference A B <-> (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)

Predicate logic (unfolded):

  ∀ (A B x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TG.IsUnionOf (LRA.Set.Constructions.TG.PairSet (LRA.Set.Constructions.TG.TheRelativeComplement A B) (LRA.Set.Constructions.TG.TheRelativeComplement B A))) ⋯).1 x ↔ Or ((LRA.Set.instMembershipTGSet.1 A x ∧ LRA.Set.instMembershipTGSet.1 B x → False)) ((LRA.Set.instMembershipTGSet.1 B x ∧ LRA.Set.instMembershipTGSet.1 A x → False))

Logical form (Lean):

```lean
theorem TheSymmetricDifferenceMembership (A B x : Set) :
    x ∈ TheSymmetricDifference A B <-> (x ∈ A /\ x ∉ B) \/ (x ∈ B /\ x ∉ A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, Or.inl, Or.inr

-/
theorem TheSymmetricDifferenceMembership (A B x : Set) :
    x ∈ TheSymmetricDifference A B <-> (x ∈ A /\ x ∉ B) \/ (x ∈ B /\ x ∉ A) := by
  sorry

end LRA.Set.Constructions.TG
