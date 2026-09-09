import LRA.Set.Constructions.ZFCSet.Axioms.Separation.Uniqueness

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`TheSeparatedSubset` TODO

Predicate logic:

  noncomputable def TheSeparatedSubset (A : Set) (property : Set → Prop) : Set :=
    Classical.choose (SeparatedSubsetExists A property)

Predicate logic (unfolded):

  noncomputable def TheSeparatedSubset (A : Set) (property : Set → Prop) : Set :=
    Classical.choose (SeparatedSubsetExists A property) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheSeparatedSubset (A : Set) (property : Set → Prop) : Set :=
  Classical.choose (SeparatedSubsetExists A property)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
noncomputable def TheSeparatedSubset (A : Set) (property : Set → Prop) : Set :=
  Classical.choose (SeparatedSubsetExists A property)

/--
`TheSeparatedSubsetIsSeparatedSubset` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set) (property : LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop), LRA.Set.Constructions.ZFCSet.Axioms.IsSeparatedSubset A property (LRA.Set.Constructions.ZFCSet.Axioms.TheSeparatedSubset A property)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
    property : Set → Prop
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsSeparatedSubset A property) ⋯).1 x ↔ (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ property x)

Logical form (Lean):

```lean
theorem TheSeparatedSubsetIsSeparatedSubset (A : Set) (property : Set → Prop) :
    IsSeparatedSubset A property (TheSeparatedSubset A property)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem TheSeparatedSubsetIsSeparatedSubset (A : Set) (property : Set → Prop) :
    IsSeparatedSubset A property (TheSeparatedSubset A property) := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
