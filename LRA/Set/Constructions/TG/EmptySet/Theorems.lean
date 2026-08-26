import LRA.Set.Constructions.TG.Axioms.EmptySet
import LRA.Set.Constructions.TG.Definitions
import LRA.Set.Constructions.TG.Extensionality.Theorems

namespace LRA.Set.Constructions.TG

/--
`EmptySetExists` TODO

Predicate logic:

  exists A : Set, IsEmptySet A

Predicate logic (unfolded):

  Exists fun A => ∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 A x → False

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

  (IsEmptySet A ∧ IsEmptySet B) → B = A

Predicate logic (unfolded):

  ∀ {A B : LRA.Set.Constructions.TG.Set}, (∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 A x → False ∧ ∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 B x → False) → B = A

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

  ExistsAndUnique IsEmptySet

Predicate logic (unfolded):

  (Exists fun witness => ∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 witness x → False ∧ ∀ (left right : LRA.Set.Constructions.TG.Set), (∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 left x → False) → (∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 right x → False) → left = right)

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

  IsEmptySet TheEmptySet

Predicate logic (unfolded):

  ∀ (x : LRA.Set.Constructions.TG.Set), LRA.Set.instMembershipTGSet.1 LRA.Set.Constructions.TG.TheEmptySet x → False

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

end LRA.Set.Constructions.TG
