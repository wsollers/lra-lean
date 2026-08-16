import LRA.VolumeI.Operations.Definition

namespace LRA.Operation.Laws.Cancellation

open LRA.Operation

universe u

/--
**[Definition — LeftCancellative]**

Left-cancellation law for a binary endo-operation.

Logical form:

```lean
def LeftCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop
```
-/
def LeftCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall fixed first second,
    operation fixed first = operation fixed second -> first = second

/--
**[Definition — RightCancellative]**

Right-cancellation law for a binary endo-operation.

Logical form:

```lean
def RightCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop
```
-/
def RightCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall first second fixed,
    operation first fixed = operation second fixed -> first = second

/--
**[Definition — LeftRegular]**

A fixed element is left-regular when left translation by that element cancels.
-/
def LeftRegular {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (fixed : Carrier) : Prop :=
  forall first second,
    operation fixed first = operation fixed second -> first = second

/--
**[Definition — RightRegular]**

A fixed element is right-regular when right translation by that element cancels.
-/
def RightRegular {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (fixed : Carrier) : Prop :=
  forall first second,
    operation first fixed = operation second fixed -> first = second

/--
**[Definition — LeftCancellativeOn]**

Left cancellation restricted to elements satisfying an eligibility predicate.
-/
def LeftCancellativeOn {Carrier : Type u}
    (eligible : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall fixed, eligible fixed -> LeftRegular operation fixed

/--
**[Definition — RightCancellativeOn]**

Right cancellation restricted to elements satisfying an eligibility predicate.
-/
def RightCancellativeOn {Carrier : Type u}
    (eligible : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall fixed, eligible fixed -> RightRegular operation fixed

/--
**[Definition — TwoSidedCancellativeOn]**

Two-sided cancellation restricted to elements satisfying an eligibility
predicate.
-/
def TwoSidedCancellativeOn {Carrier : Type u}
    (eligible : Carrier -> Prop)
    (operation : BinaryEndoOperation Carrier) : Prop :=
  LeftCancellativeOn eligible operation /\
    RightCancellativeOn eligible operation

/--
**[Definition — TwoSidedCancellative]**

Two-sided cancellation law for a binary endo-operation.

Logical form:

```lean
def TwoSidedCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop
```
-/
def TwoSidedCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  LeftCancellative operation /\ RightCancellative operation

end LRA.Operation.Laws.Cancellation
