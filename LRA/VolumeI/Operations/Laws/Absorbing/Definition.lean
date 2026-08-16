import LRA.VolumeI.Operations.Definition

namespace LRA.Operation.Laws.Absorbing

open LRA.Operation

universe u

/--
**[Definition — LeftAbsorbing]**

Left-absorbing law for a binary endo-operation.

Logical form:

```lean
def LeftAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (absorber : Carrier) : Prop
```
-/
def LeftAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (absorber : Carrier) : Prop :=
  forall element, operation absorber element = absorber

/--
**[Definition — RightAbsorbing]**

Right-absorbing law for a binary endo-operation.

Logical form:

```lean
def RightAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (absorber : Carrier) : Prop
```
-/
def RightAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (absorber : Carrier) : Prop :=
  forall element, operation element absorber = absorber

/--
**[Definition — TwoSidedAbsorbing]**

Two-sided absorbing law for a binary endo-operation.

Logical form:

```lean
def TwoSidedAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (absorber : Carrier) : Prop
```
-/
def TwoSidedAbsorbing {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (absorber : Carrier) : Prop :=
  LeftAbsorbing operation absorber /\ RightAbsorbing operation absorber

end LRA.Operation.Laws.Absorbing
