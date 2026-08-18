import LRA.Order.OrderedSets.Poset.Characterizations

namespace LRA.Order.OrderedSets.Poset

/--
Every poset order is a preorder.

Logical form:

```lean
LRA.Order.Preorder poset.NonStrictOrder
```
-/
theorem PosetOrderIsPreorder
    (poset : LRA.Order.Poset) :
    LRA.Order.Preorder poset.NonStrictOrder := by
  sorry

end LRA.Order.OrderedSets.Poset
