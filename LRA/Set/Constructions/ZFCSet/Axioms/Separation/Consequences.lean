import LRA.Set.Constructions.ZFCSet.Axioms.Separation.Canonical

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`EverySeparatedSubsetEqualsTheSeparatedSubset` TODO

Predicate logic:

  ∀ {A : LRA.Set.Constructions.ZFCSet.Axioms.Set} {property : LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop} {B : LRA.Set.Constructions.ZFCSet.Axioms.Set}, LRA.Set.Constructions.ZFCSet.Axioms.IsSeparatedSubset A property B → B = LRA.Set.Constructions.ZFCSet.Axioms.TheSeparatedSubset A property

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
    property : Set → Prop
    B : Set
  Prove
    (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 B x ↔ (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ property x)) → B = Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsSeparatedSubset A property) ⋯.1

Logical form (Lean):

```lean
theorem EverySeparatedSubsetEqualsTheSeparatedSubset
    {A : Set} {property : Set → Prop} {B : Set}
    (BIsSeparatedSubset : IsSeparatedSubset A property B) :
    B = TheSeparatedSubset A property
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
theorem EverySeparatedSubsetEqualsTheSeparatedSubset
    {A : Set} {property : Set → Prop} {B : Set}
    (BIsSeparatedSubset : IsSeparatedSubset A property B) :
    B = TheSeparatedSubset A property := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
