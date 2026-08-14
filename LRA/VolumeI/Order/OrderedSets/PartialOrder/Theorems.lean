import LRA.VolumeI.Order.OrderedSets.PartialOrder.Characterizations

namespace LRA.VolumeI.Order.OrderedSets.PartialOrder

/--
Projection accessor: every element is related to itself by a non-strict partial
order.

Logical form:

```lean
order.relation element element
```
-/
theorem NonStrictRelatesSelf
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (element : Carrier) :
    order.relation element element := by
  sorry

/--
Projection accessor: two elements mutually related by a non-strict partial
order are equal.

Logical form:

```lean
order.relation left right ->
order.relation right left ->
left = right
```
-/
theorem NonStrictMutualRelationImpliesEqual
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier)
    (leftRelatedToRight : order.relation left right)
    (rightRelatedToLeft : order.relation right left) :
    left = right := by
  sorry

/--
Projection accessor: a strict partial order never relates an element to itself.

Logical form:

```lean
Not (order.relation element element)
```
-/
theorem StrictDoesNotRelateSelf
    {Carrier : Type u}
    (order : StrictPartialOrder Carrier)
    (element : Carrier) :
    Not (order.relation element element) := by
  sorry

end LRA.VolumeI.Order.OrderedSets.PartialOrder
