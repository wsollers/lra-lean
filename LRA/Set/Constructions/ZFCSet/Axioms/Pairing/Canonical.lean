import LRA.Set.Constructions.ZFCSet.Axioms.Pairing.Uniqueness

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`PairSet` TODO

Predicate logic:

  noncomputable def PairSet (x1 x2 : Set) : Set :=
    Classical.choose (PairSetExists x1 x2)

Predicate logic (unfolded):

  noncomputable def PairSet (x1 x2 : Set) : Set :=
    Classical.choose (PairSetExists x1 x2) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def PairSet (x1 x2 : Set) : Set :=
  Classical.choose (PairSetExists x1 x2)
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
noncomputable def PairSet (x1 x2 : Set) : Set :=
  Classical.choose (PairSetExists x1 x2)

/--
`TheSingleton` TODO

Predicate logic:

  noncomputable def TheSingleton (x : Set) : Set :=
    PairSet x x

Predicate logic (unfolded):

  noncomputable def TheSingleton (x : Set) : Set :=
    PairSet x x (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheSingleton (x : Set) : Set :=
  PairSet x x
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
noncomputable def TheSingleton (x : Set) : Set :=
  PairSet x x

/--
`TheSingletonIsSingletonSet` TODO

Predicate logic:

  ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.ZFCSet.Axioms.IsSingletonSet x (LRA.Set.Constructions.ZFCSet.Axioms.TheSingleton x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    x : Set
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsPairSet x x) ⋯).1 w ↔ w = x

Logical form (Lean):

```lean
theorem TheSingletonIsSingletonSet (x : Set) :
    IsSingletonSet x (TheSingleton x)
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
theorem TheSingletonIsSingletonSet (x : Set) :
    IsSingletonSet x (TheSingleton x) := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
