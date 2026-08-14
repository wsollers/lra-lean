import LRA.VolumeI.Order.OrderedSets.PartialOrder.NonStrict
import LRA.VolumeI.Order.OrderedSets.PartialOrder.Strict

namespace LRA.VolumeI.Order.OrderedSets.PartialOrder

/--
The usual `<=` relation on natural numbers is a non-strict partial order.

Logical form:

```lean
NonStrictPartialOrder Nat
```
-/
def NaturalNumberNonStrictPartialOrder :
    NonStrictPartialOrder Nat where
  relation := fun left right => left <= right
  isPartialOrder := by
    sorry

/--
The usual `<` relation on natural numbers is a strict partial order.

Logical form:

```lean
StrictPartialOrder Nat
```
-/
def NaturalNumberStrictPartialOrder :
    StrictPartialOrder Nat where
  relation := fun left right => left < right
  isStrictPartialOrder := by
    sorry

/--
Equality on booleans is a non-strict partial order.

Logical form:

```lean
NonStrictPartialOrder Bool
```
-/
def BooleanEqualityNonStrictPartialOrder :
    NonStrictPartialOrder Bool where
  relation := fun left right => left = right
  isPartialOrder := by
    sorry

end LRA.VolumeI.Order.OrderedSets.PartialOrder
