import LRA.Set.Constructions.ZFCSet.Axioms.Union.Canonical

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`EveryUnionOverEqualsTheUnionOver` TODO

Predicate logic:

  ∀ {A U : LRA.Set.Constructions.ZFCSet.Axioms.Set}, LRA.Set.Constructions.ZFCSet.Axioms.IsUnionOf A U → U = LRA.Set.Constructions.ZFCSet.Axioms.TheUnionOver A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A U : Set
  Prove
    (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 U x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipZFCSet.1 A B ∧ LRA.Set.Constructions.instMembershipZFCSet.1 B x)) → U = Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsUnionOf A) ⋯.1

Logical form (Lean):

```lean
theorem EveryUnionOverEqualsTheUnionOver
    {A U : Set}
    (UIsUnionOf : IsUnionOf A U) :
    U = TheUnionOver A
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
theorem EveryUnionOverEqualsTheUnionOver
    {A U : Set}
    (UIsUnionOf : IsUnionOf A U) :
    U = TheUnionOver A := by
  sorry

/--
`TheUnionMembership` TODO

Predicate logic:

  ∀ (A B x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem (LRA.Set.Constructions.ZFCSet.Axioms.TheUnion A B) x ↔ Or (LRA.Set.Constructions.instMembershipZFCSet.mem A x) (LRA.Set.Constructions.instMembershipZFCSet.mem B x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B x : Set
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.mem (LRA.Set.Constructions.ZFCSet.Axioms.TheUnion A B) x ↔ Or (LRA.Set.Constructions.instMembershipZFCSet.mem A x) (LRA.Set.Constructions.instMembershipZFCSet.mem B x)

Logical form (Lean):

```lean
theorem TheUnionMembership (A B x : Set) :
    x ∈ TheUnion A B ↔ x ∈ A ∨ x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, Or.inl, Or.inr, cases, rcases

-/
theorem TheUnionMembership (A B x : Set) :
    x ∈ TheUnion A B ↔ x ∈ A ∨ x ∈ B := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
