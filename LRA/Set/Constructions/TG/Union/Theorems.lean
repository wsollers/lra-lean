import LRA.Set.Constructions.TG.Axioms.Union
import LRA.Set.Constructions.TG.Definitions
import LRA.Set.Constructions.TG.Extensionality.Theorems
import LRA.Set.Constructions.TG.Pairing.Theorems

namespace LRA.Set.Constructions.TG

/--
`UnionOverExists` TODO

Predicate logic:

  (∀ A ∈ Set), exists U : Set, IsUnionOf A U

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.TG.Set), Exists fun U => ∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 U x ↔ Exists fun B => (LRA.Set.instMembershipTGSet.1 A B ∧ LRA.Set.instMembershipTGSet.1 B x)

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

  (IsUnionOf A U ∧ IsUnionOf A V) → V = U

Predicate logic (unfolded):

  ∀ {A U V : LRA.Set.Constructions.TG.Set}, (∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 U x ↔ Exists fun B => (LRA.Set.instMembershipTGSet.1 A B ∧ LRA.Set.instMembershipTGSet.1 B x) ∧ ∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 V x ↔ Exists fun B => (LRA.Set.instMembershipTGSet.1 A B ∧ LRA.Set.instMembershipTGSet.1 B x)) → V = U

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

  (∀ A ∈ Set), IsUnionOf A (TheUnionOver A)

Predicate logic (unfolded):

  ∀ (A x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TG.IsUnionOf A) ⋯).1 x ↔ Exists fun B => (LRA.Set.instMembershipTGSet.1 A B ∧ LRA.Set.instMembershipTGSet.1 B x)

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

  (∀ A B x ∈ Set), x ∈ TheUnion A B <-> x ∈ A ∨ x ∈ B

Predicate logic (unfolded):

  ∀ (A B x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TG.IsUnionOf (LRA.Set.Constructions.TG.PairSet A B)) ⋯).1 x ↔ Or (LRA.Set.instMembershipTGSet.1 A x) (LRA.Set.instMembershipTGSet.1 B x)

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

end LRA.Set.Constructions.TG
