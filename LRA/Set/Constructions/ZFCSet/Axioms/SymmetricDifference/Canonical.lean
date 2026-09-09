import LRA.Set.Constructions.ZFCSet.Axioms.SymmetricDifference.Definitions
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

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.ZFCSet.Axioms.IsSymmetricDifferenceOf A B (LRA.Set.Constructions.ZFCSet.Axioms.TheSymmetricDifference A B)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B : Set
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsUnionOf (LRA.Set.Constructions.ZFCSet.Axioms.PairSet (LRA.Set.Constructions.ZFCSet.Axioms.TheRelativeComplement A B) (LRA.Set.Constructions.ZFCSet.Axioms.TheRelativeComplement B A))) ⋯).val x ↔ Or ((LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ (LRA.Set.Constructions.instMembershipZFCSet.1 B x → False))) ((LRA.Set.Constructions.instMembershipZFCSet.1 B x ∧ (LRA.Set.Constructions.instMembershipZFCSet.1 A x → False)))

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

end LRA.Set.Constructions.ZFCSet.Axioms
