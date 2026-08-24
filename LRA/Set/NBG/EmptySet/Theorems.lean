import LRA.Set.NBG.Axioms.EmptySet
import LRA.Set.NBG.Definitions
import LRA.Set.NBG.Extensionality.Theorems

namespace LRA.Set.NBG

/--
`EmptySetExists` TODO

Predicate logic:

  exists A : Set, IsEmptySet A

Predicate logic (unfolded):

  Exists fun A => ∀ (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 A x → False

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

  ∀ {A B : LRA.Set.NBG.Set}, (∀ (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 A x → False ∧ ∀ (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 B x → False) → B = A

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

  (Exists fun witness => ∀ (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 witness x → False ∧ ∀ (left right : LRA.Set.NBG.Set), (∀ (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 left x → False) → (∀ (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 right x → False) → left = right)

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

  ∀ (x : LRA.Set.NBG.Set), LRA.Set.instMembershipNBGSet.1 LRA.Set.NBG.TheEmptySet x → False

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

end LRA.Set.NBG
