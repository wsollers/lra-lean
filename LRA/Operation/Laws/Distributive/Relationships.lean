import LRA.Operation.Laws.Distributive.Theorems
import LRA.Operation.Laws.Commutative.Definition

namespace LRA.Operation.Laws.Distributive

open LRA.Operation

universe u

/--
`Commutative.left_distributive_to_right_distributive` TODO

Predicate logic:

  RightDistributive outer inner

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {outer inner : Carrier → Carrier → Carrier}, (∀ (first second : Carrier), outer first second = outer second first ∧ ∀ (left right third : Carrier), outer left (inner right third) = inner (outer left right) (outer left third)) → ∀ (left right third : Carrier), outer (inner left right) third = inner (outer left third) (outer right third)

Logical form (Lean):

```lean
theorem Commutative.left_distributive_to_right_distributive {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (outerCommutative :
      LRA.Operation.Laws.Commutative.Commutative outer)
    (leftLaw : LeftDistributive outer inner) :
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
theorem Commutative.left_distributive_to_right_distributive {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (outerCommutative :
      LRA.Operation.Laws.Commutative.Commutative outer)
    (leftLaw : LeftDistributive outer inner) :
    RightDistributive outer inner := by
  sorry
/--
`Commutative.right_distributive_to_left_distributive` TODO

Predicate logic:

  LeftDistributive outer inner

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {outer inner : Carrier → Carrier → Carrier}, (∀ (first second : Carrier), outer first second = outer second first ∧ ∀ (left right third : Carrier), outer (inner left right) third = inner (outer left third) (outer right third)) → ∀ (left right third : Carrier), outer left (inner right third) = inner (outer left right) (outer left third)

Logical form (Lean):

```lean
theorem Commutative.right_distributive_to_left_distributive {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (outerCommutative :
      LRA.Operation.Laws.Commutative.Commutative outer)
    (rightLaw : RightDistributive outer inner) :
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
theorem Commutative.right_distributive_to_left_distributive {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (outerCommutative :
      LRA.Operation.Laws.Commutative.Commutative outer)
    (rightLaw : RightDistributive outer inner) :
    LeftDistributive outer inner := by
  sorry
end LRA.Operation.Laws.Distributive
