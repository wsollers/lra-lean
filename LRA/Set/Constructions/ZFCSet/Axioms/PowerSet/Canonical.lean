import LRA.Set.Constructions.ZFCSet.Axioms.PowerSet.Uniqueness

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`ThePowerSet` TODO

Predicate logic:

  noncomputable def ThePowerSet (A : Set) : Set :=
    Classical.choose (PowerSetOfExists A)

Predicate logic (unfolded):

  noncomputable def ThePowerSet (A : Set) : Set :=
    Classical.choose (PowerSetOfExists A) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def ThePowerSet (A : Set) : Set :=
  Classical.choose (PowerSetOfExists A)
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
noncomputable def ThePowerSet (A : Set) : Set :=
  Classical.choose (PowerSetOfExists A)

/--
`ThePowerSetIsPowerSetOf` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.ZFCSet.Axioms.IsPowerSetOf A (LRA.Set.Constructions.ZFCSet.Axioms.ThePowerSet A)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsPowerSetOf A) ⋯).1 x ↔ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 x y → LRA.Set.Constructions.instMembershipZFCSet.1 A y

Logical form (Lean):

```lean
theorem ThePowerSetIsPowerSetOf (A : Set) :
    IsPowerSetOf A (ThePowerSet A)
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
theorem ThePowerSetIsPowerSetOf (A : Set) :
    IsPowerSetOf A (ThePowerSet A) := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
