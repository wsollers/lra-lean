import LRA.Set.NBG.Axioms.PowerSet
import LRA.Set.NBG.Definitions
import LRA.Set.NBG.Extensionality.Theorems

namespace LRA.Set.NBG

/--
`PowerSetOfExists` TODO

Predicate logic:

  (∀ A ∈ Set), exists P : Set, IsPowerSetOf A P

Predicate logic (unfolded):

  ∀ (A : LRA.Set.NBG.Set), Exists fun P => ∀ (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 P x ↔ ∀ (y : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 x y → LRA.Set.instMembershipNBGSet.1 A y

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

  ∀ {A P Q : LRA.Set.NBG.Set}, (∀ (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 P x ↔ ∀ (y : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 x y → LRA.Set.instMembershipNBGSet.1 A y ∧ ∀ (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 Q x ↔ ∀ (y : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 x y → LRA.Set.instMembershipNBGSet.1 A y) → Q = P

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

  ∀ (A x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 (Classical.indefiniteDescription (LRA.Set.NBG.IsPowerSetOf A) ⋯).1 x ↔ ∀ (y : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 x y → LRA.Set.instMembershipNBGSet.1 A y

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

end LRA.Set.NBG
