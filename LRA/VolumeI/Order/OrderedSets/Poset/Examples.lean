import LRA.VolumeI.Order.OrderedSets.Poset.Definition

namespace LRA.VolumeI.Order.OrderedSets.Poset

/--
The natural numbers with their usual non-strict order form a poset.

Logical form:

```lean
LRA.VolumeI.Order.Poset where
  Carrier := Nat
  NonStrictOrder := fun left right => left <= right
```
-/
def NaturalNumberPoset : LRA.VolumeI.Order.Poset where
  Carrier := Nat
  NonStrictOrder := fun left right => left <= right
  NonStrictOrderIsPartialOrder := by
    sorry

end LRA.VolumeI.Order.OrderedSets.Poset
