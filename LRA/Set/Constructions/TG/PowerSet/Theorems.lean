import LRA.Set.Constructions.TG.Axioms.PowerSet
import LRA.Set.Constructions.TG.Definitions
import LRA.Set.Constructions.TG.Extensionality.Theorems

namespace LRA.Set.Constructions.TG

/--
`PowerSetOfExists` TODO

Predicate logic:

  (∀ A ∈ Set), exists P : Set, IsPowerSetOf A P

Predicate logic (unfolded):

  ∀ (A : LRA.Set.Constructions.TG.Set), Exists fun P => ∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 P x ↔ ∀ (y : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 x y → LRA.Set.instMembershipTGSet.1 A y

Logical form (Lean):

```lean
theorem PowerSetOfExists (A : Set) : exists P : Set, IsPowerSetOf A P
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
theorem PowerSetOfExists (A : Set) : exists P : Set, IsPowerSetOf A P := by
  sorry

/--
`PowerSetOfIsUnique` TODO

Predicate logic:

  (IsPowerSetOf A P ∧ IsPowerSetOf A Q) → Q = P

Predicate logic (unfolded):

  ∀ {A P Q : LRA.Set.Constructions.TG.Set}, (∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 P x ↔ ∀ (y : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 x y → LRA.Set.instMembershipTGSet.1 A y ∧ ∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 Q x ↔ ∀ (y : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 x y → LRA.Set.instMembershipTGSet.1 A y) → Q = P

Logical form (Lean):

```lean
theorem PowerSetOfIsUnique {A P Q : Set}
    (PIsPowerSetOf : IsPowerSetOf A P) (QIsPowerSetOf : IsPowerSetOf A Q) :
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
theorem PowerSetOfIsUnique {A P Q : Set}
    (PIsPowerSetOf : IsPowerSetOf A P) (QIsPowerSetOf : IsPowerSetOf A Q) :
    Q = P := by
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

  ∀ (A x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.TG.IsPowerSetOf A) ⋯).1 x ↔ ∀ (y : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 x y → LRA.Set.instMembershipTGSet.1 A y

Logical form (Lean):

```lean
theorem ThePowerSetIsPowerSetOf (A : Set) : IsPowerSetOf A (ThePowerSet A)
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
theorem ThePowerSetIsPowerSetOf (A : Set) : IsPowerSetOf A (ThePowerSet A) := by
  sorry

end LRA.Set.Constructions.TG
