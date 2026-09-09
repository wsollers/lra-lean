import LRA.Set.Constructions.ZFCSet.Axioms.Pairing.Canonical

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`PairSetMembership` TODO

Predicate logic:

  ∀ (x1 x2 w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem (LRA.Set.Constructions.ZFCSet.Axioms.PairSet x1 x2) w ↔ Or (w = x1)(w = x2)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x1 x2 w : Set
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.mem (LRA.Set.Constructions.ZFCSet.Axioms.PairSet x1 x2) w ↔ Or (w = x1)(w = x2)

Logical form (Lean):

```lean
theorem PairSetMembership (x1 x2 w : Set) :
    w ∈ PairSet x1 x2 ↔ w = x1 ∨ w = x2
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
theorem PairSetMembership (x1 x2 w : Set) :
    w ∈ PairSet x1 x2 ↔ w = x1 ∨ w = x2 := by
  sorry

/--
`EveryPairSetEqualsPairSet` TODO

Predicate logic:

  ∀ {x1 x2 P : LRA.Set.Constructions.ZFCSet.Axioms.Set}, LRA.Set.Constructions.ZFCSet.Axioms.IsPairSet x1 x2 P → P = LRA.Set.Constructions.ZFCSet.Axioms.PairSet x1 x2

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x1 x2 P : Set
  Prove
    (∀ (w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 P w ↔ Or (w = x1)(w = x2)) → P = Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsPairSet x1 x2) ⋯.1

Logical form (Lean):

```lean
theorem EveryPairSetEqualsPairSet
    {x1 x2 P : Set}
    (PIsPairSet : IsPairSet x1 x2 P) :
    P = PairSet x1 x2
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
theorem EveryPairSetEqualsPairSet
    {x1 x2 P : Set}
    (PIsPairSet : IsPairSet x1 x2 P) :
    P = PairSet x1 x2 := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
