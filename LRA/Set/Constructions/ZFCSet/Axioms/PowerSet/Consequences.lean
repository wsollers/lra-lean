import LRA.Set.Constructions.ZFCSet.Axioms.PowerSet.Canonical

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`EveryPowerSetOfEqualsThePowerSet` TODO

Predicate logic:

  ∀ {A P : LRA.Set.Constructions.ZFCSet.Axioms.Set}, LRA.Set.Constructions.ZFCSet.Axioms.IsPowerSetOf A P → P = LRA.Set.Constructions.ZFCSet.Axioms.ThePowerSet A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A P : Set
  Prove
    (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 P x ↔ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 x y → LRA.Set.Constructions.instMembershipZFCSet.1 A y) → P = Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsPowerSetOf A) ⋯.1

Logical form (Lean):

```lean
theorem EveryPowerSetOfEqualsThePowerSet
    {A P : Set}
    (PIsPowerSetOf : IsPowerSetOf A P) :
    P = ThePowerSet A
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
theorem EveryPowerSetOfEqualsThePowerSet
    {A P : Set}
    (PIsPowerSetOf : IsPowerSetOf A P) :
    P = ThePowerSet A := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
