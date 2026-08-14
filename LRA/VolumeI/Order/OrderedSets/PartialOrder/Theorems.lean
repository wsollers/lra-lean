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
There are no nontrivial two-element cycles in a partial order: if two elements
are mutually related, the cycle collapses to equality.

Logical form:

```lean
order.relation left right -> order.relation right left -> left = right
```
-/
theorem PartialOrderHasNoNontrivialTwoElementCycles
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier)
    (leftRelatedToRight : order.relation left right)
    (rightRelatedToLeft : order.relation right left) :
    left = right := by
  sorry

end LRA.VolumeI.Order.OrderedSets.PartialOrder
