import LRA.VolumeI.Order.OrderedSets.StrictOrder.Definition

namespace LRA.Order.OrderedSets.StrictOrder

/--
Statement: The usual strict order on natural numbers satisfies the strict-order
laws.

Logical form:

```lean
LRA.Order.StrictOrder (fun left right : Nat => left < right)
```
-/
theorem NaturalNumberLessThanIsStrictOrder :
    LRA.Order.StrictOrder (fun left right : Nat => left < right) := by
  sorry

/--
`NaturalNumberStrictOrder`

Statement: The usual `<` relation on natural numbers is a strict order.

Logical form:

```lean
StrictOrderRelation Nat
```
-/
def NaturalNumberStrictOrder :
    StrictOrderRelation Nat where
  relation := fun left right => left < right
  relationIsStrictOrder := NaturalNumberLessThanIsStrictOrder

/--
Statement: The relation packaged by `NaturalNumberStrictOrder` satisfies the strict-order
laws.

Logical form:

```lean
LRA.Order.StrictOrder NaturalNumberStrictOrder.relation
```
-/
example :
    LRA.Order.StrictOrder NaturalNumberStrictOrder.relation := by
  exact NaturalNumberStrictOrder.relationIsStrictOrder

end LRA.Order.OrderedSets.StrictOrder
