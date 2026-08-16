import LRA.VolumeI.Map.Operation.Definition

namespace LRA.Map.Operation.Laws.Identity

open LRA.Map.Operation

universe u

/--
**[Definition — LeftIdentity]**

Left-identity law for a binary endo-operation.

Logical form:

```lean
def LeftIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop
```
-/
def LeftIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  forall element, operation identity element = element

/--
**[Definition — RightIdentity]**

Right-identity law for a binary endo-operation.

Logical form:

```lean
def RightIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop
```
-/
def RightIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  forall element, operation element identity = element

/--
**[Definition — TwoSidedIdentity]**

Two-sided identity law for a binary endo-operation.

Logical form:

```lean
def TwoSidedIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop
```
-/
def TwoSidedIdentity {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  LeftIdentity operation identity /\ RightIdentity operation identity

end LRA.Map.Operation.Laws.Identity
