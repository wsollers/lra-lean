import LRA.Set.Constructions.ZFCSet.Axioms.Axioms.PowerSet
import LRA.Set.Constructions.ZFCSet.Axioms.Definitions
import LRA.Set.Constructions.ZFCSet.Axioms.Extensionality.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`PowerSetOfExists` TODO

Predicate logic:

  (∀ A ∈ Set), ∃ P ∈ Set, IsPowerSetOf A P

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set), Exists fun P => ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 P x ↔ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 x y → LRA.Set.instMembershipZFCSet.1 A y

Logical form (Lean):

```lean
theorem PowerSetOfExists (A : Set) :
    ∃ P : Set, IsPowerSetOf A P
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
theorem PowerSetOfExists (A : Set) :
    ∃ P : Set, IsPowerSetOf A P := by
  sorry

/--
`PowerSetOfIsUnique` TODO

Predicate logic:

  (IsPowerSetOf A P ∧ IsPowerSetOf A Q) → Q = P

Predicate logic (unfolded):

  ∀ {A P Q : LRA.Set.Constructions.ZFCSet.Axioms.Set}, (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 P x ↔ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 x y → LRA.Set.instMembershipZFCSet.1 A y ∧ ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 Q x ↔ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 x y → LRA.Set.instMembershipZFCSet.1 A y) → Q = P

Logical form (Lean):

```lean
theorem PowerSetOfIsUnique
    {A P Q : Set}
    (PIsPowerSetOf : IsPowerSetOf A P)
    (QIsPowerSetOf : IsPowerSetOf A Q) :
    Q = P
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
theorem PowerSetOfIsUnique
    {A P Q : Set}
    (PIsPowerSetOf : IsPowerSetOf A P)
    (QIsPowerSetOf : IsPowerSetOf A Q) :
    Q = P := by
  sorry

/--
`PowerSetOfExistsAndIsUnique` TODO

Predicate logic:

  (∀ A ∈ Set), ExistsAndUnique fun P ∈ Set => IsPowerSetOf A P

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set), (Exists fun witness => (fun P => ∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 P x ↔ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 x y → LRA.Set.instMembershipZFCSet.1 A y) witness ∧ ∀ (left right : LRA.Set.Constructions.ZFCSet.Axioms.Set), (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 left x ↔ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 x y → LRA.Set.instMembershipZFCSet.1 A y) → (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 right x ↔ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 x y → LRA.Set.instMembershipZFCSet.1 A y) → left = right)

Logical form (Lean):

```lean
theorem PowerSetOfExistsAndIsUnique (A : Set) :
    ExistsAndUnique (fun P : Set => IsPowerSetOf A P)
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
theorem PowerSetOfExistsAndIsUnique (A : Set) :
    ExistsAndUnique (fun P : Set => IsPowerSetOf A P) := by
  sorry

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

  (∀ A ∈ Set), IsPowerSetOf A (ThePowerSet A)

Predicate logic (unfolded):

  ∀ (A x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsPowerSetOf A) ⋯).1 x ↔ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 x y → LRA.Set.instMembershipZFCSet.1 A y

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

/--
`EveryPowerSetOfEqualsThePowerSet` TODO

Predicate logic:

  (IsPowerSetOf A P) → P = ThePowerSet A

Predicate logic (unfolded):

  ∀ {A P : LRA.Set.Constructions.ZFCSet.Axioms.Set}, (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 P x ↔ ∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.instMembershipZFCSet.1 x y → LRA.Set.instMembershipZFCSet.1 A y) → P = Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsPowerSetOf A) ⋯.1

Logical form (Lean):

```lean
theorem EveryPowerSetOfEqualsThePowerSet
    {A P : Set}
    (PIsPowerSetOf : IsPowerSetOf A P) :
    P = ThePowerSet A
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
theorem EveryPowerSetOfEqualsThePowerSet
    {A P : Set}
    (PIsPowerSetOf : IsPowerSetOf A P) :
    P = ThePowerSet A := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
