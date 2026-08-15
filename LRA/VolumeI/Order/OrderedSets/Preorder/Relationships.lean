import LRA.VolumeI.Order.OrderedSets.Preorder.Characterizations

namespace LRA.Order.OrderedSets.Preorder

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
    LRA.Order.OrderedSets.OrderRelation Carrier :=
  fun left right =>
    preorder.relation left right /\ Not (preorder.relation right left)

end LRA.Order.OrderedSets.Preorder
