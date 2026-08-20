import LRA.Order.OrderedSets.PartialOrder.Characterizations
import LRA.Order.OrderedSets.Poset.Definition

namespace LRA.Order.OrderedSets.Poset

/--
The order relation packaged by a poset is a partial order.

Logical form:

```lean
LRA.Order.PartialOrder poset.NonStrictOrder
```
-/
theorem PosetOrderIsPartialOrder
    (poset : LRA.Order.Poset) :
    LRA.Order.PartialOrder poset.NonStrictOrder := by
  sorry

/--
The order relation packaged by a poset is reflexive.

Logical form:

```lean
LRA.Relation.Reflexive poset.NonStrictOrder
```
-/
theorem PosetOrderIsReflexive
    (poset : LRA.Order.Poset) :
    LRA.Relation.Reflexive poset.NonStrictOrder := by
  sorry

/--
The order relation packaged by a poset is antisymmetric.

Logical form:

```lean
LRA.Relation.Antisymmetric poset.NonStrictOrder
```
-/
theorem PosetOrderIsAntisymmetric
    (poset : LRA.Order.Poset) :
    LRA.Relation.Antisymmetric poset.NonStrictOrder := by
  sorry

/--
The order relation packaged by a poset is transitive.

Logical form:

```lean
LRA.Relation.Transitive poset.NonStrictOrder
```
-/
theorem PosetOrderIsTransitive
    (poset : LRA.Order.Poset) :
    LRA.Relation.Transitive poset.NonStrictOrder := by
  sorry

end LRA.Order.OrderedSets.Poset
