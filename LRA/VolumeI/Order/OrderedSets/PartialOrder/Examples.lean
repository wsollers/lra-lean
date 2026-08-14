import LRA.VolumeI.Order.OrderedSets.PartialOrder.NonStrict

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
  relationIsPartialOrder := by
    sorry

/--
The relation packaged by `NaturalNumberNonStrictPartialOrder` satisfies the
partial-order laws.

Logical form:

```lean
LRA.VolumeI.Order.PartialOrder NaturalNumberNonStrictPartialOrder.relation
```
-/
theorem NaturalNumberNonStrictOrderIsPartialOrder :
    LRA.VolumeI.Order.PartialOrder
      NaturalNumberNonStrictPartialOrder.relation := by
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
  relationIsPartialOrder := by
    sorry

/--
The relation packaged by `BooleanEqualityNonStrictPartialOrder` satisfies the
partial-order laws.

Logical form:

```lean
LRA.VolumeI.Order.PartialOrder BooleanEqualityNonStrictPartialOrder.relation
```
-/
theorem BooleanEqualityRelationIsPartialOrder :
    LRA.VolumeI.Order.PartialOrder
      BooleanEqualityNonStrictPartialOrder.relation := by
  sorry

end LRA.VolumeI.Order.OrderedSets.PartialOrder
