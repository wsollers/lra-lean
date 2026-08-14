import LRA.VolumeI.Order.OrderedSets.Preorder.Characterizations

namespace LRA.VolumeI.Order.OrderedSets.Preorder

/--
Projection accessor: every element is related to itself by a preorder.

Logical form:

```lean
preorder.relation element element
```
-/
theorem PreorderRelatesSelf
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier)
    (element : Carrier) :
    preorder.relation element element :=
  PreorderRelationIsReflexive preorder element

end LRA.VolumeI.Order.OrderedSets.Preorder
