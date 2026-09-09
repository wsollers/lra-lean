import LRA.Set.Constructions.ZFCSet.Axioms.EmptySet.Canonical

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`EveryEmptySetEqualsTheEmptySet` TODO

Predicate logic:

  ∀ {A : LRA.Set.Constructions.ZFCSet.Axioms.Set}, LRA.Set.Constructions.ZFCSet.Axioms.IsEmptySet A → A = LRA.Set.Constructions.ZFCSet.Axioms.TheEmptySet

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
  Prove
    (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 A x → False) → A = LRA.Set.Constructions.ZFCSet.Axioms.TheEmptySet

Logical form (Lean):

```lean
theorem EveryEmptySetEqualsTheEmptySet
    {A : Set}
    (AIsEmpty : IsEmptySet A) :
    A = TheEmptySet := by
  have aIsES := Extensionality A
  rw [aIsES]
  intro arbitrarySet
  constructor
  . -- mp ->
    intro arbInA
    have contradiction := AIsEmpty arbitrarySet arbInA
    cases contradiction
  . -- mpr <-
    intro arbInEmptySet
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
theorem EveryEmptySetEqualsTheEmptySet
    {A : Set}
    (AIsEmpty : IsEmptySet A) :
    A = TheEmptySet := by
  have aIsES := Extensionality A
  rw [aIsES]
  intro arbitrarySet
  constructor
  . -- mp ->
    intro arbInA
    have contradiction := AIsEmpty arbitrarySet arbInA
    cases contradiction
  . -- mpr <-
    intro arbInEmptySet
    have contradiction := TheEmptySetIsEmpty arbitrarySet arbInEmptySet
    cases contradiction



end LRA.Set.Constructions.ZFCSet.Axioms
