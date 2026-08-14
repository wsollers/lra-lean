import LRA.VolumeI.Order.OrderedSets.Poset.Characterizations

namespace LRA.VolumeI.Order.OrderedSets.Poset

/--
Every poset order is a preorder.

Logical form:

```lean
LRA.VolumeI.Order.Preorder poset.NonStrictOrder
```
-/
theorem PosetOrderIsPreorder
    (poset : LRA.VolumeI.Order.Poset) :
    LRA.VolumeI.Order.Preorder poset.NonStrictOrder :=
  And.intro
    (PosetOrderIsReflexive poset)
    (PosetOrderIsTransitive poset)

end LRA.VolumeI.Order.OrderedSets.Poset
