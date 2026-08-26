import LRA.Set.Constructions.NBGSet.Axioms.Axioms.Separation
import LRA.Set.Constructions.NBGSet.Axioms.Definitions
import LRA.Set.Constructions.NBGSet.Axioms.Extensionality.Theorems

namespace LRA.Set.Constructions.NBGSet.Axioms

/--
`SeparatedSubsetExists` TODO

Predicate logic:

  (∀ A ∈ Set), exists B : Set, IsSeparatedSubset A property B

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.NBGSet.Axioms.Set) (property : LRA.Set.Constructions.NBGSet.Axioms.Set → Prop), Exists fun B => ∀ (x : LRA.Set.Constructions.NBGSet.Axioms.Set), LRA.Set.instMembershipNBGSet.1 B x ↔ (LRA.Set.instMembershipNBGSet.1 A x ∧ property x)

Logical form (Lean):

```lean
theorem SeparatedSubsetExists (A : Set) (property : Set -> Prop) :
    exists B : Set, IsSeparatedSubset A property B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem SeparatedSubsetExists (A : Set) (property : Set -> Prop) :
    exists B : Set, IsSeparatedSubset A property B := by
  sorry

/--
`SeparatedSubsetIsUnique` TODO

Predicate logic:

  (IsSeparatedSubset A property B ∧ IsSeparatedSubset A property C) → C = B

Predicate logic (unfolded):

  ∀ {A : LRA.Set.Constructions.NBGSet.Axioms.Set} {property : LRA.Set.Constructions.NBGSet.Axioms.Set → Prop} {B C : LRA.Set.Constructions.NBGSet.Axioms.Set}, (∀ (x : LRA.Set.Constructions.NBGSet.Axioms.Set), LRA.Set.instMembershipNBGSet.1 B x ↔ (LRA.Set.instMembershipNBGSet.1 A x ∧ property x) ∧ ∀ (x : LRA.Set.Constructions.NBGSet.Axioms.Set), LRA.Set.instMembershipNBGSet.1 C x ↔ (LRA.Set.instMembershipNBGSet.1 A x ∧ property x)) → C = B

Logical form (Lean):

```lean
theorem SeparatedSubsetIsUnique {A : Set} {property : Set -> Prop} {B C : Set}
    (BIsSeparatedSubset : IsSeparatedSubset A property B)
    (CIsSeparatedSubset : IsSeparatedSubset A property C) :
    C = B
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
theorem SeparatedSubsetIsUnique {A : Set} {property : Set -> Prop} {B C : Set}
    (BIsSeparatedSubset : IsSeparatedSubset A property B)
    (CIsSeparatedSubset : IsSeparatedSubset A property C) :
    C = B := by
  sorry

/--
`TheSeparatedSubset` TODO

Predicate logic:

  noncomputable def TheSeparatedSubset (A : Set) (property : Set -> Prop) : Set :=
  Classical.choose (SeparatedSubsetExists A property)

Predicate logic (unfolded):

  noncomputable def TheSeparatedSubset (A : Set) (property : Set -> Prop) : Set :=
  Classical.choose (SeparatedSubsetExists A property) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheSeparatedSubset (A : Set) (property : Set -> Prop) : Set :=
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
noncomputable def TheSeparatedSubset (A : Set) (property : Set -> Prop) : Set :=
  Classical.choose (SeparatedSubsetExists A property)

/--
`TheSeparatedSubsetIsSeparatedSubset` TODO

Predicate logic:

  (∀ A ∈ Set), IsSeparatedSubset A property (TheSeparatedSubset A property)

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.NBGSet.Axioms.Set) (property : LRA.Set.Constructions.NBGSet.Axioms.Set → Prop) (x : LRA.Set.Constructions.NBGSet.Axioms.Set), LRA.Set.instMembershipNBGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.NBGSet.Axioms.IsSeparatedSubset A property) ⋯).1 x ↔ (LRA.Set.instMembershipNBGSet.1 A x ∧ property x)

Logical form (Lean):

```lean
theorem TheSeparatedSubsetIsSeparatedSubset (A : Set) (property : Set -> Prop) :
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
theorem TheSeparatedSubsetIsSeparatedSubset (A : Set) (property : Set -> Prop) :
    IsSeparatedSubset A property (TheSeparatedSubset A property) := by
  sorry

end LRA.Set.Constructions.NBGSet.Axioms
