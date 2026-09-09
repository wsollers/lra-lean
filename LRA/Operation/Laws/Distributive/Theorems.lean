import LRA.Operation.Laws.Distributive.Definition

namespace LRA.Operation.Laws.Distributive

open LRA.Operation

universe u

/--
`LeftDistributive.apply` TODO

Predicate logic:

  ∀ {Carrier : Type u} {outer inner : LRA.Operation.BinaryEndoOperation Carrier}, LRA.Operation.Laws.Distributive.LeftDistributive outer inner → ∀ (left right third : Carrier), outer left (inner right third) = inner (outer left right) (outer left third)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    outer inner : BinaryEndoOperation Carrier
    law : LeftDistributive outer inner
    left right third : Carrier
  Prove
    (∀ (left right third : Carrier), outer left (inner right third) = inner (outer left right) (outer left third)) → ∀ (left right third : Carrier), outer left (inner right third) = inner (outer left right) (outer left third)

Logical form (Lean):

```lean
theorem LeftDistributive.apply {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : LeftDistributive outer inner)
    (left right third : Carrier) :
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

Related proof moves: TODO

-/
theorem LeftDistributive.apply {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : LeftDistributive outer inner)
    (left right third : Carrier) :
    outer left (inner right third) =
      inner (outer left right) (outer left third) := by
  sorry
/--
`RightDistributive.apply` TODO

Predicate logic:

  ∀ {Carrier : Type u} {outer inner : LRA.Operation.BinaryEndoOperation Carrier}, LRA.Operation.Laws.Distributive.RightDistributive outer inner → ∀ (left right third : Carrier), outer (inner left right) third = inner (outer left third) (outer right third)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    outer inner : BinaryEndoOperation Carrier
    law : RightDistributive outer inner
    left right third : Carrier
  Prove
    (∀ (left right third : Carrier), outer (inner left right) third = inner (outer left third) (outer right third)) → ∀ (left right third : Carrier), outer (inner left right) third = inner (outer left third) (outer right third)

Logical form (Lean):

```lean
theorem RightDistributive.apply {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : RightDistributive outer inner)
    (left right third : Carrier) :
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

Related proof moves: TODO

-/
theorem RightDistributive.apply {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : RightDistributive outer inner)
    (left right third : Carrier) :
    outer (inner left right) third =
      inner (outer left third) (outer right third) := by
  sorry
/--
`TwoSidedDistributive.left` TODO

Predicate logic:

  ∀ {Carrier : Type u} {outer inner : LRA.Operation.BinaryEndoOperation Carrier}, LRA.Operation.Laws.Distributive.TwoSidedDistributive outer inner → LRA.Operation.Laws.Distributive.LeftDistributive outer inner

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    outer inner : BinaryEndoOperation Carrier
    law : TwoSidedDistributive outer inner
  Prove
    ((∀ (left right third : Carrier), outer left (inner right third) = inner (outer left right) (outer left third)) ∧ (∀ (left right third : Carrier), outer (inner left right) third = inner (outer left third) (outer right third))) → ∀ (left right third : Carrier), outer left (inner right third) = inner (outer left right) (outer left third)

Logical form (Lean):

```lean
theorem TwoSidedDistributive.left {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : TwoSidedDistributive outer inner) :
    LeftDistributive outer inner
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
theorem TwoSidedDistributive.left {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : TwoSidedDistributive outer inner) :
    LeftDistributive outer inner := by
  sorry
/--
`TwoSidedDistributive.right` TODO

Predicate logic:

  ∀ {Carrier : Type u} {outer inner : LRA.Operation.BinaryEndoOperation Carrier}, LRA.Operation.Laws.Distributive.TwoSidedDistributive outer inner → LRA.Operation.Laws.Distributive.RightDistributive outer inner

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    outer inner : BinaryEndoOperation Carrier
    law : TwoSidedDistributive outer inner
  Prove
    ((∀ (left right third : Carrier), outer left (inner right third) = inner (outer left right) (outer left third)) ∧ (∀ (left right third : Carrier), outer (inner left right) third = inner (outer left third) (outer right third))) → ∀ (left right third : Carrier), outer (inner left right) third = inner (outer left third) (outer right third)

Logical form (Lean):

```lean
theorem TwoSidedDistributive.right {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : TwoSidedDistributive outer inner) :
    RightDistributive outer inner
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
theorem TwoSidedDistributive.right {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : TwoSidedDistributive outer inner) :
    RightDistributive outer inner := by
  sorry
/--
`TwoSidedDistributive.of_left_right` TODO

Predicate logic:

  ∀ {Carrier : Type u} {outer inner : LRA.Operation.BinaryEndoOperation Carrier}, (LRA.Operation.Laws.Distributive.LeftDistributive outer inner ∧ LRA.Operation.Laws.Distributive.RightDistributive outer inner) → LRA.Operation.Laws.Distributive.TwoSidedDistributive outer inner

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    outer inner : BinaryEndoOperation Carrier
    leftLaw : LeftDistributive outer inner
    rightLaw : RightDistributive outer inner
  Prove
    ((∀ (left right third : Carrier), outer left (inner right third) = inner (outer left right) (outer left third)) ∧ (∀ (left right third : Carrier), outer (inner left right) third = inner (outer left third) (outer right third))) → ((∀ (left right third : Carrier), outer left (inner right third) = inner (outer left right) (outer left third)) ∧ (∀ (left right third : Carrier), outer (inner left right) third = inner (outer left third) (outer right third)))

Logical form (Lean):

```lean
theorem TwoSidedDistributive.of_left_right {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (leftLaw : LeftDistributive outer inner)
    (rightLaw : RightDistributive outer inner) :
    TwoSidedDistributive outer inner
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
theorem TwoSidedDistributive.of_left_right {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (leftLaw : LeftDistributive outer inner)
    (rightLaw : RightDistributive outer inner) :
    TwoSidedDistributive outer inner := by
  sorry
end LRA.Operation.Laws.Distributive
