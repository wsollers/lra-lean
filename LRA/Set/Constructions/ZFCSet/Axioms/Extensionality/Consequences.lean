import LRA.Set.Constructions.ZFCSet.Axioms.Extensionality.Axiom

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`SetEqualityIffSameMembers` TODO

Predicate logic:

  ∀ (A B : LRA.Set.Constructions.ZFCSet), A = B ↔ ∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem A x ↔ LRA.Set.Constructions.instMembershipZFCSet.mem B x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A B : LRA.Set.Constructions.ZFCSet
  Prove
    A = B ↔ ∀ (x : LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.instMembershipZFCSet.mem A x ↔ LRA.Set.Constructions.instMembershipZFCSet.mem B x

Logical form (Lean):

```lean
theorem SetEqualityIffSameMembers (A B : LRA.Set.Constructions.ZFCSet) :
    A = B ↔
      ∀ x : LRA.Set.Constructions.ZFCSet, x ∈ A ↔ x ∈ B := by
  constructor
  . -- mp ->
    intro AEqualsB
    intro element
    constructor
    . -- mp.mp ->
      rw [AEqualsB]
      intro b
      exact b

    . -- mp.mpr
      rw [AEqualsB]
      intro b
      exact b
  . -- mpr <-
    intro hypothesis
    have AEqB
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem SetEqualityIffSameMembers (A B : LRA.Set.Constructions.ZFCSet) :
    A = B ↔
      ∀ x : LRA.Set.Constructions.ZFCSet, x ∈ A ↔ x ∈ B := by
  constructor
  . -- mp ->
    intro AEqualsB
    intro element
    constructor
    . -- mp.mp ->
      rw [AEqualsB]
      intro b
      exact b

    . -- mp.mpr
      rw [AEqualsB]
      intro b
      exact b
  . -- mpr <-
    intro hypothesis
    have AEqB := Extensionality A B
    exact AEqB hypothesis


end LRA.Set.Constructions.ZFCSet.Axioms
