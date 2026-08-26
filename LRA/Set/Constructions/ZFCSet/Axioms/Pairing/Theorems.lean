import LRA.Set.Constructions.ZFCSet.Axioms.Axioms.Pairing
import LRA.Set.Constructions.ZFCSet.Axioms.Definitions
import LRA.Set.Constructions.ZFCSet.Axioms.Extensionality.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`PairSetExists` TODO

Predicate logic:

  (∀ x1 x2 ∈ Set), ∃ P ∈ Set, IsPairSet x1 x2 P

Predicate logic (unfolded):

  ∀ (x1 x2 : LRA.Set.Constructions.ZFCSet.Axioms.Set), Exists fun P => ∀ (w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 P w ↔ Or (w = x1)(w = x2)

Logical form (Lean):

```lean
theorem PairSetExists (x1 x2 : Set) :
    ∃ P : Set, IsPairSet x1 x2 P
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem PairSetExists (x1 x2 : Set) :
    ∃ P : Set, IsPairSet x1 x2 P := by
  sorry

/--
`PairSetIsUnique` TODO

Predicate logic:

  (IsPairSet x1 x2 P ∧ IsPairSet x1 x2 G) → G = P

Predicate logic (unfolded):

  ∀ {x1 x2 P G : LRA.Set.Constructions.ZFCSet.Axioms.Set}, (∀ (w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 P w ↔ Or (w = x1)(w = x2) ∧ ∀ (w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 G w ↔ Or (w = x1)(w = x2)) → G = P

Logical form (Lean):

```lean
theorem PairSetIsUnique
    {x1 x2 P G : Set}
    (PIsPairSet : IsPairSet x1 x2 P)
    (GIsPairSet : IsPairSet x1 x2 G) :
    G = P
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
theorem PairSetIsUnique
    {x1 x2 P G : Set}
    (PIsPairSet : IsPairSet x1 x2 P)
    (GIsPairSet : IsPairSet x1 x2 G) :
    G = P := by
  sorry

/--
`PairingOutputExistsAndIsUnique` TODO

Predicate logic:

  (∀ x1 x2 ∈ Set), ExistsAndUnique fun P ∈ Set => IsPairSet x1 x2 P

Predicate logic (unfolded):

  ∀ (x1 x2 : LRA.Set.Constructions.ZFCSet.Axioms.Set), (Exists fun witness => (fun P => ∀ (w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 P w ↔ Or (w = x1)(w = x2)) witness ∧ ∀ (left right : LRA.Set.Constructions.ZFCSet.Axioms.Set), (∀ (w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 left w ↔ Or (w = x1)(w = x2)) → (∀ (w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 right w ↔ Or (w = x1)(w = x2)) → left = right)

Logical form (Lean):

```lean
theorem PairingOutputExistsAndIsUnique (x1 x2 : Set) :
    ExistsAndUnique (fun P : Set => IsPairSet x1 x2 P)
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
theorem PairingOutputExistsAndIsUnique (x1 x2 : Set) :
    ExistsAndUnique (fun P : Set => IsPairSet x1 x2 P) := by
  sorry

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
`PairSetMembership` TODO

Predicate logic:

  (∀ x1 x2 w ∈ Set), w ∈ PairSet x1 x2 ↔ w = x1 ∨ w = x2

Predicate logic (unfolded):

  ∀ (x1 x2 w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsPairSet x1 x2) ⋯).1 w ↔ Or (w = x1)(w = x2)

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

  (IsPairSet x1 x2 P) → P = PairSet x1 x2

Predicate logic (unfolded):

  ∀ {x1 x2 P : LRA.Set.Constructions.ZFCSet.Axioms.Set}, (∀ (w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 P w ↔ Or (w = x1)(w = x2)) → P = Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsPairSet x1 x2) ⋯.1

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

  (∀ x ∈ Set), IsSingletonSet x (TheSingleton x)

Predicate logic (unfolded):

  ∀ (x w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsPairSet x x) ⋯).1 w ↔ w = x

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
