import LRA.VolumeI.Map.Operation.Laws.Distributive.Definition

namespace LRA.Map.Operation.Laws.Distributive

open LRA.Map.Operation

universe u

/--
**[Theorem — LeftDistributive]**

Apply a left-distributive law to three elements.

Logical form:

```lean
theorem LeftDistributive.apply {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : LeftDistributive outer inner)
    (left right third : Carrier) :
    outer left (inner right third) =
      inner (outer left right) (outer left third)
```
-/
theorem LeftDistributive.apply {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : LeftDistributive outer inner)
    (left right third : Carrier) :
    outer left (inner right third) =
      inner (outer left right) (outer left third) := by
  sorry
/--
**[Theorem — RightDistributive]**

Apply a right-distributive law to three elements.

Logical form:

```lean
theorem RightDistributive.apply {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : RightDistributive outer inner)
    (left right third : Carrier) :
    outer (inner left right) third =
      inner (outer left third) (outer right third)
```
-/
theorem RightDistributive.apply {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : RightDistributive outer inner)
    (left right third : Carrier) :
    outer (inner left right) third =
      inner (outer left third) (outer right third) := by
  sorry
/--
**[Theorem — TwoSidedDistributive]**

A two-sided distributive law supplies a left distributive law.

Logical form:

```lean
theorem TwoSidedDistributive.left {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : TwoSidedDistributive outer inner) :
    LeftDistributive outer inner
```
-/
theorem TwoSidedDistributive.left {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : TwoSidedDistributive outer inner) :
    LeftDistributive outer inner := by
  sorry
/--
**[Theorem — TwoSidedDistributive]**

A two-sided distributive law supplies a right distributive law.

Logical form:

```lean
theorem TwoSidedDistributive.right {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : TwoSidedDistributive outer inner) :
    RightDistributive outer inner
```
-/
theorem TwoSidedDistributive.right {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (law : TwoSidedDistributive outer inner) :
    RightDistributive outer inner := by
  sorry
/--
**[Theorem — TwoSidedDistributive]**

Left and right distributive laws assemble into a two-sided distributive law.

Logical form:

```lean
theorem TwoSidedDistributive.of_left_right {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (leftLaw : LeftDistributive outer inner)
    (rightLaw : RightDistributive outer inner) :
    TwoSidedDistributive outer inner
```
-/
theorem TwoSidedDistributive.of_left_right {Carrier : Type u}
    {outer inner : BinaryEndoOperation Carrier}
    (leftLaw : LeftDistributive outer inner)
    (rightLaw : RightDistributive outer inner) :
    TwoSidedDistributive outer inner := by
  sorry
end LRA.Map.Operation.Laws.Distributive
