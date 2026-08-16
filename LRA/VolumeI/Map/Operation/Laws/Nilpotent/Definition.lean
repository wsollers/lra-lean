import LRA.VolumeI.Map.Operation.Definition

namespace LRA.Map.Operation.Laws.Nilpotent

open LRA.Map.Operation

universe u

/--
**[Definition — OperationPower]**

Repeated application of a binary operation to the same element, using the
given identity value for exponent zero.
-/
def OperationPower {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element : Carrier) : Nat -> Carrier
  | 0 => identity
  | Nat.succ exponent => operation (OperationPower operation identity element exponent) element

/--
**[Definition — PositivePower]**

Repeated application of a binary operation to the same element, indexed from
the first positive power. Index `0` denotes one occurrence of the element.
-/
def PositivePower {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (element : Carrier) : Nat -> Carrier
  | 0 => element
  | Nat.succ exponent => operation (PositivePower operation element exponent) element

/--
**[Definition — NilpotentElement]**

An element is nilpotent when some positive power is the absorbing zero
element.
-/
def NilpotentElement {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (zero element : Carrier) : Prop :=
  exists positiveExponent : Nat,
    PositivePower operation element positiveExponent = zero

end LRA.Map.Operation.Laws.Nilpotent
