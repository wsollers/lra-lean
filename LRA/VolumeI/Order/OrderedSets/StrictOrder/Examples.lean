import LRA.VolumeI.Order.OrderedSets.StrictOrder.Definition

namespace LRA.VolumeI.Order.OrderedSets.StrictOrder

/--
The usual `<` relation on natural numbers is a strict order.

Logical form:

```lean
StrictOrderRelation Nat
```
-/
def NaturalNumberStrictOrder :
    StrictOrderRelation Nat where
  relation := fun left right => left < right
  relationIsStrictOrder := by
    sorry

/--
The relation packaged by `NaturalNumberStrictOrder` satisfies the strict-order
laws.

Logical form:

```lean
LRA.VolumeI.Order.StrictOrder NaturalNumberStrictOrder.relation
```
-/
theorem NaturalNumberRelationIsStrictOrder :
    LRA.VolumeI.Order.StrictOrder NaturalNumberStrictOrder.relation := by
  sorry

end LRA.VolumeI.Order.OrderedSets.StrictOrder
