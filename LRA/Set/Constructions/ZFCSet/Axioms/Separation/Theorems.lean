import LRA.Set.Constructions.ZFCSet.Axioms.Axioms.Separation
import LRA.Set.Constructions.ZFCSet.Axioms.Definitions
import LRA.Set.Constructions.ZFCSet.Axioms.Extensionality.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`SeparatedSubsetExists` TODO

Predicate logic:

  (∀ A ∈ Set), (Set → Prop) → ∃ B ∈ Set, IsSeparatedSubset A property B

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set) (property : LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop), Exists fun B => ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 B x ↔ (LRA.Set.instMembershipZFCSet.1 A x ∧ property x)

Logical form (Lean):

```lean
theorem SeparatedSubsetExists (A : Set) (property : Set → Prop) :
    ∃ B : Set, IsSeparatedSubset A property B
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
theorem SeparatedSubsetExists (A : Set) (property : Set → Prop) :
    ∃ B : Set, IsSeparatedSubset A property B := by
  sorry

/--
`SeparatedSubsetIsUnique` TODO

Predicate logic:

  (IsSeparatedSubset A property B ∧ IsSeparatedSubset A property C) → C = B

Predicate logic (unfolded):

  ∀ {A : LRA.Set.Constructions.ZFCSet.Axioms.Set} {property : LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop} {B C : LRA.Set.Constructions.ZFCSet.Axioms.Set}, (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 B x ↔ (LRA.Set.instMembershipZFCSet.1 A x ∧ property x) ∧ ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 C x ↔ (LRA.Set.instMembershipZFCSet.1 A x ∧ property x)) → C = B

Logical form (Lean):

```lean
theorem SeparatedSubsetIsUnique
    {A : Set} {property : Set → Prop} {B C : Set}
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
theorem SeparatedSubsetIsUnique
    {A : Set} {property : Set → Prop} {B C : Set}
    (BIsSeparatedSubset : IsSeparatedSubset A property B)
    (CIsSeparatedSubset : IsSeparatedSubset A property C) :
    C = B := by
  sorry

/--
`SeparatedSubsetExistsAndIsUnique` TODO

Predicate logic:

  (∀ A ∈ Set), (Set → Prop) → ExistsAndUnique fun B ∈ Set => IsSeparatedSubset A property B

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set) (property : LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop), (Exists fun witness => (fun B => ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 B x ↔ (LRA.Set.instMembershipZFCSet.1 A x ∧ property x)) witness ∧ ∀ (left right : LRA.Set.Constructions.ZFCSet.Axioms.Set), (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 left x ↔ (LRA.Set.instMembershipZFCSet.1 A x ∧ property x)) → (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 right x ↔ (LRA.Set.instMembershipZFCSet.1 A x ∧ property x)) → left = right)

Logical form (Lean):

```lean
theorem SeparatedSubsetExistsAndIsUnique (A : Set) (property : Set → Prop) :
    ExistsAndUnique (fun B : Set => IsSeparatedSubset A property B)
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
theorem SeparatedSubsetExistsAndIsUnique (A : Set) (property : Set → Prop) :
    ExistsAndUnique (fun B : Set => IsSeparatedSubset A property B) := by
  sorry

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

  (∀ A ∈ Set), (Set → Prop) → IsSeparatedSubset A property (TheSeparatedSubset A property)

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set) (property : LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop) (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsSeparatedSubset A property) ⋯).1 x ↔ (LRA.Set.instMembershipZFCSet.1 A x ∧ property x)

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

/--
`EverySeparatedSubsetEqualsTheSeparatedSubset` TODO

Predicate logic:

  (IsSeparatedSubset A property B) → B = TheSeparatedSubset A property

Predicate logic (unfolded):

  ∀ {A : LRA.Set.Constructions.ZFCSet.Axioms.Set} {property : LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop} {B : LRA.Set.Constructions.ZFCSet.Axioms.Set}, (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 B x ↔ (LRA.Set.instMembershipZFCSet.1 A x ∧ property x)) → B = Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsSeparatedSubset A property) ⋯.1

Logical form (Lean):

```lean
theorem EverySeparatedSubsetEqualsTheSeparatedSubset
    {A : Set} {property : Set → Prop} {B : Set}
    (BIsSeparatedSubset : IsSeparatedSubset A property B) :
    B = TheSeparatedSubset A property
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
theorem EverySeparatedSubsetEqualsTheSeparatedSubset
    {A : Set} {property : Set → Prop} {B : Set}
    (BIsSeparatedSubset : IsSeparatedSubset A property B) :
    B = TheSeparatedSubset A property := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
