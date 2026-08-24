import LRA.Operation.Definition

namespace LRA.Operation.Laws.Identity

open LRA.Operation

universe u

/--
`LeftIdentity` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (identity element : Carrier), operation identity element = element

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (identity element : Carrier), operation identity element = element

Logical form (Lean):

```lean
def LeftIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  forall element, operation identity element = element
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def LeftIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  forall element, operation identity element = element

/--
`RightIdentity` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (identity element : Carrier), operation element identity = element

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (identity element : Carrier), operation element identity = element

Logical form (Lean):

```lean
def RightIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  forall element, operation element identity = element
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def RightIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  forall element, operation element identity = element

/--
`TwoSidedIdentity` TODO

Predicate logic:

  ∀ {Carrier : Type u} (operation : LRA.Operation.BinaryEndoOperation Carrier) (identity : Carrier), (LRA.Operation.Laws.Identity.LeftIdentity operation identity ∧ LRA.Operation.Laws.Identity.RightIdentity operation identity)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (operation : Carrier → Carrier → Carrier) (identity : Carrier), (∀ (element : Carrier), operation identity element = element ∧ ∀ (element : Carrier), operation element identity = element)

Logical form (Lean):

```lean
def TwoSidedIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  LeftIdentity operation identity /\ RightIdentity operation identity
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def TwoSidedIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  LeftIdentity operation identity /\ RightIdentity operation identity

end LRA.Operation.Laws.Identity
