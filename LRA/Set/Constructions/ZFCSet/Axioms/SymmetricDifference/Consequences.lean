import LRA.Set.Constructions.ZFCSet.Axioms.SymmetricDifference.Canonical

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`TheSymmetricDifferenceMembership` TODO

Predicate logic:

  ∀ (A B x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem (LRA.Set.Constructions.ZFCSet.Axioms.TheSymmetricDifference A B) x ↔ Or ((LRA.Set.Constructions.instMembershipZFCSet.mem A x ∧ ¬ LRA.Set.Constructions.instMembershipZFCSet.mem B x)) ((LRA.Set.Constructions.instMembershipZFCSet.mem B x ∧ ¬ LRA.Set.Constructions.instMembershipZFCSet.mem A x))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B x : Set
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.mem (LRA.Set.Constructions.ZFCSet.Axioms.TheSymmetricDifference A B) x ↔ Or ((LRA.Set.Constructions.instMembershipZFCSet.mem A x ∧ ¬ LRA.Set.Constructions.instMembershipZFCSet.mem B x)) ((LRA.Set.Constructions.instMembershipZFCSet.mem B x ∧ ¬ LRA.Set.Constructions.instMembershipZFCSet.mem A x))

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

  ∀ {A B D : LRA.Set.Constructions.ZFCSet.Axioms.Set}, LRA.Set.Constructions.ZFCSet.Axioms.IsSymmetricDifferenceOf A B D → D = LRA.Set.Constructions.ZFCSet.Axioms.TheSymmetricDifference A B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B D : Set
  Prove
    (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 D x ↔ Or ((LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ (LRA.Set.Constructions.instMembershipZFCSet.1 B x → False))) ((LRA.Set.Constructions.instMembershipZFCSet.1 B x ∧ (LRA.Set.Constructions.instMembershipZFCSet.1 A x → False)))) → D = Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsUnionOf (LRA.Set.Constructions.ZFCSet.Axioms.PairSet (LRA.Set.Constructions.ZFCSet.Axioms.TheRelativeComplement A B) (LRA.Set.Constructions.ZFCSet.Axioms.TheRelativeComplement B A))) ⋯.1

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
