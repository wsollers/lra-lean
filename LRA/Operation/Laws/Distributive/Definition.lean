import LRA.Operation.Definition

namespace LRA.Operation.Laws.Distributive

open LRA.Operation

universe u

/--
`LeftDistributive` TODO

Predicate logic:

  ∀ {Carrier : Type u} (outer inner : LRA.Operation.BinaryEndoOperation Carrier) (left right third : Carrier), outer left (inner right third) = inner (outer left right) (outer left third)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (outer inner : Carrier → Carrier → Carrier) (left right third : Carrier), outer left (inner right third) = inner (outer left right) (outer left third)

Logical form (Lean):

```lean
def LeftDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  forall left right third,
    outer left (inner right third) =
      inner (outer left right) (outer left third)
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
def LeftDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  forall left right third,
    outer left (inner right third) =
      inner (outer left right) (outer left third)

/--
`RightDistributive` TODO

Predicate logic:

  ∀ {Carrier : Type u} (outer inner : LRA.Operation.BinaryEndoOperation Carrier) (left right third : Carrier), outer (inner left right) third = inner (outer left third) (outer right third)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (outer inner : Carrier → Carrier → Carrier) (left right third : Carrier), outer (inner left right) third = inner (outer left third) (outer right third)

Logical form (Lean):

```lean
def RightDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  forall left right third,
    outer (inner left right) third =
      inner (outer left third) (outer right third)
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
def RightDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  forall left right third,
    outer (inner left right) third =
      inner (outer left third) (outer right third)

/--
`TwoSidedDistributive` TODO

Predicate logic:

  ∀ {Carrier : Type u} (outer inner : LRA.Operation.BinaryEndoOperation Carrier), (LRA.Operation.Laws.Distributive.LeftDistributive outer inner ∧ LRA.Operation.Laws.Distributive.RightDistributive outer inner)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (outer inner : Carrier → Carrier → Carrier), (∀ (left right third : Carrier), outer left (inner right third) = inner (outer left right) (outer left third) ∧ ∀ (left right third : Carrier), outer (inner left right) third = inner (outer left third) (outer right third))

Logical form (Lean):

```lean
def TwoSidedDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  LeftDistributive outer inner /\ RightDistributive outer inner
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
def TwoSidedDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  LeftDistributive outer inner /\ RightDistributive outer inner

end LRA.Operation.Laws.Distributive
