import LRA.VolumeI.Map.Operation.Definition

namespace LRA.Map.Operation.Laws.Distributive

open LRA.Map.Operation

universe u

/--
**[Definition — LeftDistributive]**

Left-distributivity of one binary endo-operation over another.

Logical form:

```lean
def LeftDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop
```
-/
def LeftDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  forall left right third,
    outer left (inner right third) =
      inner (outer left right) (outer left third)

/--
**[Definition — RightDistributive]**

Right-distributivity of one binary endo-operation over another.

Logical form:

```lean
def RightDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop
```
-/
def RightDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  forall left right third,
    outer (inner left right) third =
      inner (outer left third) (outer right third)

/--
**[Definition — TwoSidedDistributive]**

Two-sided distributivity of one binary endo-operation over another.

Logical form:

```lean
def TwoSidedDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop
```
-/
def TwoSidedDistributive {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  LeftDistributive outer inner /\ RightDistributive outer inner

end LRA.Map.Operation.Laws.Distributive
