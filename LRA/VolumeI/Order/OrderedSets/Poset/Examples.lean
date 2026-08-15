import LRA.VolumeI.Order.OrderedSets.Poset.Definition

namespace LRA.Order.OrderedSets.Poset

/--
`NaturalNumberPoset`

Statement: The natural numbers with their usual non-strict order form a poset.

Logical form:

```lean
LRA.Order.Poset where
  Carrier := Nat
  NonStrictOrder := fun left right => left <= right
```
-/
def NaturalNumberPoset : LRA.Order.Poset where
  Carrier := Nat
  NonStrictOrder := fun left right => left <= right
  NonStrictOrderIsPartialOrder := by
    sorry

/--
Statement: The relation packaged by `NaturalNumberPoset` satisfies the partial-order laws.

Logical form:

```lean
LRA.Order.PartialOrder NaturalNumberPoset.NonStrictOrder
```
-/
example :
    LRA.Order.PartialOrder NaturalNumberPoset.NonStrictOrder := by
  sorry

end LRA.Order.OrderedSets.Poset
