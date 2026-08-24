import LRA.Set.ZFC.Axioms.EmptySet
import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Extensionality.Theorems

namespace LRA.Set.ZFC

/--
`EmptySetExists` TODO

Predicate logic:

  ∃ A ∈ Set, IsEmptySet A

Predicate logic (unfolded):

  Exists fun A => ∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 A x → False

Logical form (Lean):

```lean
theorem EmptySetExists :
    ∃ A : Set, IsEmptySet A
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
theorem EmptySetExists :
    ∃ A : Set, IsEmptySet A := by
  sorry

/--
`EmptySetIsUnique` TODO

Predicate logic:

  (IsEmptySet A ∧ IsEmptySet B) → B = A

Predicate logic (unfolded):

  ∀ {A B : LRA.Set.ZFC.Set}, (∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 A x → False ∧ ∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 B x → False) → B = A

Logical form (Lean):

```lean
theorem EmptySetIsUnique
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
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
theorem EmptySetIsUnique
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    B = A := by
  sorry

/--
`EmptySetsAreEqual` TODO

Predicate logic:

  (IsEmptySet A ∧ IsEmptySet B) → A = B

Predicate logic (unfolded):

  ∀ {A B : LRA.Set.ZFC.Set}, (∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 A x → False ∧ ∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 B x → False) → A = B

Logical form (Lean):

```lean
theorem EmptySetsAreEqual
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    A = B
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
theorem EmptySetsAreEqual
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    A = B := by
  sorry

/--
`EmptySetExistsAndIsUnique` TODO

Predicate logic:

  ExistsAndUnique IsEmptySet

Predicate logic (unfolded):

  (Exists fun witness => ∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 witness x → False ∧ ∀ (left right : LRA.Set.ZFC.Set), (∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 left x → False) → (∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 right x → False) → left = right)

Logical form (Lean):

```lean
theorem EmptySetExistsAndIsUnique :
    ExistsAndUnique IsEmptySet
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
theorem EmptySetExistsAndIsUnique :
    ExistsAndUnique IsEmptySet := by
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

  ∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 LRA.Set.ZFC.TheEmptySet x → False

Logical form (Lean):

```lean
theorem TheEmptySetIsEmpty :
    IsEmptySet TheEmptySet
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
theorem TheEmptySetIsEmpty :
    IsEmptySet TheEmptySet := by
  sorry

/--
`EveryEmptySetEqualsTheEmptySet` TODO

Predicate logic:

  (IsEmptySet A) → A = TheEmptySet

Predicate logic (unfolded):

  ∀ {A : LRA.Set.ZFC.Set}, (∀ (x : LRA.Set.ZFC.Set), LRA.Set.instMembershipZFCSet.1 A x → False) → A = LRA.Set.ZFC.TheEmptySet

Logical form (Lean):

```lean
theorem EveryEmptySetEqualsTheEmptySet
    {A : Set}
    (AIsEmpty : IsEmptySet A) :
    A = TheEmptySet
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
theorem EveryEmptySetEqualsTheEmptySet
    {A : Set}
    (AIsEmpty : IsEmptySet A) :
    A = TheEmptySet := by
  sorry

end LRA.Set.ZFC
