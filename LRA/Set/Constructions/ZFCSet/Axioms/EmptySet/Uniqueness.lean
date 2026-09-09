import LRA.Set.Constructions.ZFCSet.Axioms.EmptySet.Existence
import LRA.Set.Constructions.ZFCSet.Axioms.Extensionality.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`EmptySetIsUnique` TODO

Predicate logic:

  ∀ {A B : LRA.Set.Constructions.ZFCSet.Axioms.Set}, (LRA.Set.Constructions.ZFCSet.Axioms.IsEmptySet A ∧ LRA.Set.Constructions.ZFCSet.Axioms.IsEmptySet B) → B = A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B : Set
  Prove
    ((∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 A x → False) ∧ (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 B x → False)) → B = A

Logical form (Lean):

```lean
theorem EmptySetIsUnique
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    B = A := by
  have abEqual := Extensionality A
  symm
  rw [abEqual]
  intro arbSet
  constructor
  . -- mp
    intro arbInA
    --have arbNotInA :=
    have contradiction :=  AIsEmpty arbSet arbInA
    cases contradiction

  . -- mpr
    intro arbInB
    have contradiction
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
  have abEqual := Extensionality A
  symm
  rw [abEqual]
  intro arbSet
  constructor
  . -- mp
    intro arbInA
    --have arbNotInA :=
    have contradiction :=  AIsEmpty arbSet arbInA
    cases contradiction

  . -- mpr
    intro arbInB
    have contradiction :=  BIsEmpty arbSet arbInB
    cases contradiction

/--
`EmptySetsAreEqual` TODO

Predicate logic:

  ∀ {A B : LRA.Set.Constructions.ZFCSet.Axioms.Set}, (LRA.Set.Constructions.ZFCSet.Axioms.IsEmptySet A ∧ LRA.Set.Constructions.ZFCSet.Axioms.IsEmptySet B) → A = B

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B : Set
  Prove
    ((∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 A x → False) ∧ (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 B x → False)) → A = B

Logical form (Lean):

```lean
theorem EmptySetsAreEqual
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    A = B := by
  have abEqual := Extensionality A
  rw [abEqual]
  intro arbSet
  constructor
  . -- mp ->
    intro arbInA
    have contradiction :=  AIsEmpty arbSet arbInA
    cases contradiction

  . -- mpr <--
    intro arbInB
    have contradiction
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
theorem EmptySetsAreEqual
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    A = B := by
  have abEqual := Extensionality A
  rw [abEqual]
  intro arbSet
  constructor
  . -- mp ->
    intro arbInA
    have contradiction :=  AIsEmpty arbSet arbInA
    cases contradiction

  . -- mpr <--
    intro arbInB
    have contradiction :=  BIsEmpty arbSet arbInB
    cases contradiction


/--
`EmptySetExistsAndIsUnique` There exists exactly one empty ZFC set, with uniqueness expressed using Lean equality. The identity-polymorphic counterpart is `LRA.Identity.ExactlyOne`.

Predicate logic:

  LRA.Set.Constructions.ZFCSet.Axioms.ExistsAndUnique LRA.Set.Constructions.ZFCSet.Axioms.IsEmptySet

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun x => ∀ (x_1 : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 x x_1 → False) ∧ (∀ (left right : LRA.Set.Constructions.ZFCSet.Axioms.Set), (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 left x → False) → (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 right x → False) → (LRA.Identity.Constructions.Mathlib.instIdentityRelation LRA.Set.Constructions.ZFCSet.Axioms.Set).1 left right))

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
  constructor
  . exact EmptySetExists
  . intro A B AIsEmpty BIsEmpty
    exact EmptySetsAreEqual AIsEmpty BIsEmpty

end LRA.Set.Constructions.ZFCSet.Axioms
