import LRA.Set.Constructions.TGSet.Axioms.Pairing
import LRA.Set.Constructions.TGSet.Definitions
import LRA.Set.Constructions.TGSet.Extensionality.Theorems

namespace LRA.Set.Constructions.TGSet

/--
`PairSetExists` TODO

Predicate logic:

  (∀ x1 x2 ∈ Set), exists P : Set, IsPairSet x1 x2 P

Predicate logic (unfolded):

  ∀ (x1 x2 : LRA.Set.Constructions.TGSet.Set), Exists fun P => ∀ (w : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 P w ↔ Or (w = x1)(w = x2)

Logical form (Lean):

```lean
theorem PairSetExists (x1 x2 : Set) : exists P : Set, IsPairSet x1 x2 P
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
theorem PairSetExists (x1 x2 : Set) : exists P : Set, IsPairSet x1 x2 P := by
  sorry

/--
`PairSetIsUnique` TODO

Predicate logic:

  (IsPairSet x1 x2 P ∧ IsPairSet x1 x2 G) → G = P

Predicate logic (unfolded):

  ∀ {x1 x2 P G : LRA.Set.Constructions.TGSet.Set}, (∀ (w : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 P w ↔ Or (w = x1)(w = x2) ∧ ∀ (w : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 G w ↔ Or (w = x1)(w = x2)) → G = P

Logical form (Lean):

```lean
theorem PairSetIsUnique {x1 x2 P G : Set}
    (PIsPairSet : IsPairSet x1 x2 P) (GIsPairSet : IsPairSet x1 x2 G) :
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
theorem PairSetIsUnique {x1 x2 P G : Set}
    (PIsPairSet : IsPairSet x1 x2 P) (GIsPairSet : IsPairSet x1 x2 G) :
    G = P := by
  sorry

/--
`PairingOutputExistsAndIsUnique` TODO

Predicate logic:

  (∀ x1 x2 ∈ Set), ExistsAndUnique fun P ∈ Set => IsPairSet x1 x2 P

Predicate logic (unfolded):

  ∀ (x1 x2 : LRA.Set.Constructions.TGSet.Set), (Exists fun witness => (fun P => ∀ (w : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 P w ↔ Or (w = x1)(w = x2)) witness ∧ ∀ (left right : LRA.Set.Constructions.TGSet.Set), (∀ (w : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 left w ↔ Or (w = x1)(w = x2)) → (∀ (w : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 right w ↔ Or (w = x1)(w = x2)) → left = right)

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

  (∀ x1 x2 w ∈ Set), w ∈ PairSet x1 x2 <-> w = x1 ∨ w = x2

Predicate logic (unfolded):

  ∀ (x1 x2 w : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TGSet.IsPairSet x1 x2) ⋯).1 w ↔ Or (w = x1)(w = x2)

Logical form (Lean):

```lean
theorem PairSetMembership (x1 x2 w : Set) :
    w ∈ PairSet x1 x2 <-> w = x1 \/ w = x2
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, Or.inl, Or.inr, cases, rcases

-/
theorem PairSetMembership (x1 x2 w : Set) :
    w ∈ PairSet x1 x2 <-> w = x1 \/ w = x2 := by
  sorry

end LRA.Set.Constructions.TGSet

