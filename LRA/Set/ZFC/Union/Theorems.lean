import LRA.Set.ZFC.Axioms.Union
import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Extensionality.Theorems
import LRA.Set.ZFC.Pairing.Theorems

namespace LRA.Set.ZFC

/--
`UnionOverExists` TODO

Predicate logic:

  (∀ A ∈ Set), ∃ U ∈ Set, IsUnionOf A U

Predicate logic (unfolded):

  ∀ (A : LRA.Set.ZFC.Set), Exists fun U => ∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 U x ↔ Exists fun B => (LRA.Set.instMembershipZFCSet.1 A B ∧ LRA.Set.instMembershipZFCSet.1 B x)

Logical form (Lean):

```lean
theorem UnionOverExists (A : Set) :
    ∃ U : Set, IsUnionOf A U
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
theorem UnionOverExists (A : Set) :
    ∃ U : Set, IsUnionOf A U := by
  sorry

/--
`UnionOverIsUnique` TODO

Predicate logic:

  (IsUnionOf A U ∧ IsUnionOf A V) → V = U

Predicate logic (unfolded):

  ∀ {A U V : LRA.Set.ZFC.Set}, (∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 U x ↔ Exists fun B => (LRA.Set.instMembershipZFCSet.1 A B ∧ LRA.Set.instMembershipZFCSet.1 B x) ∧ ∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 V x ↔ Exists fun B => (LRA.Set.instMembershipZFCSet.1 A B ∧ LRA.Set.instMembershipZFCSet.1 B x)) → V = U

Logical form (Lean):

```lean
theorem UnionOverIsUnique
    {A U V : Set}
    (UIsUnionOf : IsUnionOf A U)
    (VIsUnionOf : IsUnionOf A V) :
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
theorem UnionOverIsUnique
    {A U V : Set}
    (UIsUnionOf : IsUnionOf A U)
    (VIsUnionOf : IsUnionOf A V) :
    V = U := by
  sorry

/--
`UnionOverExistsAndIsUnique` TODO

Predicate logic:

  (∀ A ∈ Set), ExistsAndUnique fun U ∈ Set => IsUnionOf A U

Predicate logic (unfolded):

  ∀ (A : LRA.Set.ZFC.Set), (Exists fun witness => (fun U => ∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 U x ↔ Exists fun B => (LRA.Set.instMembershipZFCSet.1 A B ∧ LRA.Set.instMembershipZFCSet.1 B x)) witness ∧ ∀ (left right : LRA.Set.ZFC.Set), (∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 left x ↔ Exists fun B => (LRA.Set.instMembershipZFCSet.1 A B ∧ LRA.Set.instMembershipZFCSet.1 B x)) → (∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 right x ↔ Exists fun B => (LRA.Set.instMembershipZFCSet.1 A B ∧ LRA.Set.instMembershipZFCSet.1 B x)) → left = right)

Logical form (Lean):

```lean
theorem UnionOverExistsAndIsUnique (A : Set) :
    ExistsAndUnique (fun U : Set => IsUnionOf A U)
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
theorem UnionOverExistsAndIsUnique (A : Set) :
    ExistsAndUnique (fun U : Set => IsUnionOf A U) := by
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

  ∀ (A x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.ZFC.IsUnionOf A) ⋯).1 x ↔ Exists fun B => (LRA.Set.instMembershipZFCSet.1 A B ∧ LRA.Set.instMembershipZFCSet.1 B x)

Logical form (Lean):

```lean
theorem TheUnionOverIsUnionOf (A : Set) :
    IsUnionOf A (TheUnionOver A)
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
theorem TheUnionOverIsUnionOf (A : Set) :
    IsUnionOf A (TheUnionOver A) := by
  sorry

/--
`EveryUnionOverEqualsTheUnionOver` TODO

Predicate logic:

  (IsUnionOf A U) → U = TheUnionOver A

Predicate logic (unfolded):

  ∀ {A U : LRA.Set.ZFC.Set}, (∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 U x ↔ Exists fun B => (LRA.Set.instMembershipZFCSet.1 A B ∧ LRA.Set.instMembershipZFCSet.1 B x)) → U = Classical.indefiniteDescription (LRA.Set.ZFC.IsUnionOf A) ⋯.1

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

  (∀ A B x ∈ Set), x ∈ TheUnion A B ↔ x ∈ A ∨ x ∈ B

Predicate logic (unfolded):

  ∀ (A B x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.ZFC.IsUnionOf (LRA.Set.ZFC.PairSet A B)) ⋯).1 x ↔ Or (LRA.Set.instMembershipZFCSet.1 A x) (LRA.Set.instMembershipZFCSet.1 B x)

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

end LRA.Set.ZFC
