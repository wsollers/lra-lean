import LRA.Set.Constructions.TGSet.Axioms.EmptySet
import LRA.Set.Constructions.TGSet.Definitions
import LRA.Set.Constructions.TGSet.Extensionality.Theorems

namespace LRA.Set.Constructions.TGSet

/--
`EmptySetExists` TODO

Predicate logic:

  Exists fun A => LRA.Set.Constructions.TGSet.IsEmptySet A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun A => ∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 A x → False

Logical form (Lean):

```lean
theorem EmptySetExists : exists A : Set, IsEmptySet A
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
theorem EmptySetExists : exists A : Set, IsEmptySet A := by
  sorry

/--
`EmptySetIsUnique` TODO

Predicate logic:

  ∀ {A B : LRA.Set.Constructions.TGSet.Set}, (LRA.Set.Constructions.TGSet.IsEmptySet A ∧ LRA.Set.Constructions.TGSet.IsEmptySet B) → B = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B : Set
  Prove
    ((∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 A x → False) ∧ (∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 B x → False)) → B = A

Logical form (Lean):

```lean
theorem EmptySetIsUnique {A B : Set} (AIsEmpty : IsEmptySet A) (BIsEmpty : IsEmptySet B) :
    B = A
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
theorem EmptySetIsUnique {A B : Set} (AIsEmpty : IsEmptySet A) (BIsEmpty : IsEmptySet B) :
    B = A := by
  sorry

/--
`EmptySetExistsAndIsUnique` TODO

Predicate logic:

  LRA.Set.Constructions.TGSet.ExistsAndUnique LRA.Set.Constructions.TGSet.IsEmptySet

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun x => ∀ (x_1 : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 x x_1 → False) ∧ (∀ (left right : LRA.Set.Constructions.TGSet.Set), (∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 left x → False) → (∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.instMembershipTGSet.1 right x → False) → (LRA.Identity.Constructions.Mathlib.instIdentityRelation LRA.Set.Constructions.TGSet.Set).1 left right))

Logical form (Lean):

```lean
theorem EmptySetExistsAndIsUnique : ExistsAndUnique IsEmptySet
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
theorem EmptySetExistsAndIsUnique : ExistsAndUnique IsEmptySet := by
  sorry

/--
`TheEmptySet` TODO

Predicate logic:

  noncomputable def TheEmptySet : Set :=
    Classical.choose EmptySetExists

Predicate logic (unfolded):

  noncomputable def TheEmptySet : Set :=
    Classical.choose EmptySetExists (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheEmptySet : Set :=
  Classical.choose EmptySetExists
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
noncomputable def TheEmptySet : Set :=
  Classical.choose EmptySetExists

/--
`TheEmptySetIsEmpty` TODO

Predicate logic:

  LRA.Set.Constructions.TGSet.IsEmptySet LRA.Set.Constructions.TGSet.TheEmptySet

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipTGSet.1 LRA.Set.Constructions.TGSet.TheEmptySet x → False

Logical form (Lean):

```lean
theorem TheEmptySetIsEmpty : IsEmptySet TheEmptySet
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
theorem TheEmptySetIsEmpty : IsEmptySet TheEmptySet := by
  sorry

end LRA.Set.Constructions.TGSet

