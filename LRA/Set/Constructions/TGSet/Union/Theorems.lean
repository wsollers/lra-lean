import LRA.Set.Constructions.TGSet.Axioms.Union
import LRA.Set.Constructions.TGSet.Definitions
import LRA.Set.Constructions.TGSet.Extensionality.Theorems
import LRA.Set.Constructions.TGSet.Pairing.Theorems

namespace LRA.Set.Constructions.TGSet

/--
`UnionOverExists` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet.Set), Exists fun U => LRA.Set.Constructions.TGSet.IsUnionOf A U

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    Exists fun U => ∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 U x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipTGSet.1 A B ∧ LRA.Set.Constructions.instMembershipTGSet.1 B x)

Logical form (Lean):

```lean
theorem UnionOverExists (A : Set) : exists U : Set, IsUnionOf A U
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
theorem UnionOverExists (A : Set) : exists U : Set, IsUnionOf A U := by
  sorry

/--
`UnionOverIsUnique` TODO

Predicate logic:

  ∀ {A U V : LRA.Set.Constructions.TGSet.Set}, (LRA.Set.Constructions.TGSet.IsUnionOf A U ∧ LRA.Set.Constructions.TGSet.IsUnionOf A V) → V = U

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A U V : Set
  Prove
    ((∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 U x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipTGSet.1 A B ∧ LRA.Set.Constructions.instMembershipTGSet.1 B x)) ∧ (∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 V x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipTGSet.1 A B ∧ LRA.Set.Constructions.instMembershipTGSet.1 B x))) → V = U

Logical form (Lean):

```lean
theorem UnionOverIsUnique {A U V : Set}
    (UIsUnionOf : IsUnionOf A U) (VIsUnionOf : IsUnionOf A V) :
    V = U
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
theorem UnionOverIsUnique {A U V : Set}
    (UIsUnionOf : IsUnionOf A U) (VIsUnionOf : IsUnionOf A V) :
    V = U := by
  sorry

/--
`TheUnionOver` TODO

Predicate logic:

  noncomputable def TheUnionOver (A : Set) : Set :=
    Classical.choose (UnionOverExists A)

Predicate logic (unfolded):

  noncomputable def TheUnionOver (A : Set) : Set :=
    Classical.choose (UnionOverExists A) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheUnionOver (A : Set) : Set :=
  Classical.choose (UnionOverExists A)
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
noncomputable def TheUnionOver (A : Set) : Set :=
  Classical.choose (UnionOverExists A)

/--
`TheUnionOverIsUnionOf` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.IsUnionOf A (LRA.Set.Constructions.TGSet.TheUnionOver A)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    LRA.Set.Constructions.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TGSet.IsUnionOf A) ⋯).1 x ↔ Exists fun B => (LRA.Set.Constructions.instMembershipTGSet.1 A B ∧ LRA.Set.Constructions.instMembershipTGSet.1 B x)

Logical form (Lean):

```lean
theorem TheUnionOverIsUnionOf (A : Set) : IsUnionOf A (TheUnionOver A)
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
theorem TheUnionOverIsUnionOf (A : Set) : IsUnionOf A (TheUnionOver A) := by
  sorry

/--
`TheUnion` TODO

Predicate logic:

  noncomputable def TheUnion (A B : Set) : Set :=
    TheUnionOver (PairSet A B)

Predicate logic (unfolded):

  noncomputable def TheUnion (A B : Set) : Set :=
    TheUnionOver (PairSet A B) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheUnion (A B : Set) : Set :=
  TheUnionOver (PairSet A B)
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
noncomputable def TheUnion (A B : Set) : Set :=
  TheUnionOver (PairSet A B)

/--
`TheUnionMembership` TODO

Predicate logic:

  ∀ (A B x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.mem (LRA.Set.Constructions.TGSet.TheUnion A B) x ↔ Or (LRA.Set.Constructions.instMembershipTGSet.mem A x) (LRA.Set.Constructions.instMembershipTGSet.mem B x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B x : Set
  Prove
    LRA.Set.Constructions.instMembershipTGSet.mem (LRA.Set.Constructions.TGSet.TheUnion A B) x ↔ Or (LRA.Set.Constructions.instMembershipTGSet.mem A x) (LRA.Set.Constructions.instMembershipTGSet.mem B x)

Logical form (Lean):

```lean
theorem TheUnionMembership (A B x : Set) :
    x ∈ TheUnion A B <-> x ∈ A \/ x ∈ B
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
theorem TheUnionMembership (A B x : Set) :
    x ∈ TheUnion A B <-> x ∈ A \/ x ∈ B := by
  sorry

end LRA.Set.Constructions.TGSet

