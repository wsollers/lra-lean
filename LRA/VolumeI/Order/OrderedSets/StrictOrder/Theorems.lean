import LRA.VolumeI.Order.OrderedSets.StrictOrder.Characterizations

namespace LRA.Order.OrderedSets.StrictOrder

/--
A strict order never relates an element to itself.

Logical form:

```lean
Not (order.relation element element)
```
-/
theorem StrictOrderDoesNotRelateSelf
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier)
    (element : Carrier) :
    Not (order.relation element element) :=
  StrictOrderRelationIsIrreflexive order element

/--
A strict order has no two-element cycle.

Logical form:

```lean
order.relation left right -> Not (order.relation right left)
```
-/
theorem StrictOrderHasNoTwoElementCycles
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier)
    (left right : Carrier)
    (leftRelatedToRight : order.relation left right) :
    Not (order.relation right left) :=
  StrictOrderIsAsymmetric order.relation order.relationIsStrictOrder
    left right leftRelatedToRight

end LRA.Order.OrderedSets.StrictOrder
