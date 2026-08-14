import LRA.VolumeI.Order.OrderedSets.Preorder.Characterizations

namespace LRA.VolumeI.Order.OrderedSets.Preorder

universe u

/--
The preorder-compatible strict part relates `left` to `right` when `left` is
below `right`, but `right` is not below `left`.

Logical form:

```lean
fun left right => preorder.relation left right /\ Not (preorder.relation right left)
```
-/
def StrictPartByNotConverse
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.VolumeI.Order.OrderedSets.OrderRelation.Relation Carrier :=
  fun left right =>
    preorder.relation left right /\ Not (preorder.relation right left)

end LRA.VolumeI.Order.OrderedSets.Preorder
