import LRA.VolumeI.Order.OrderedSets.StrictOrder.Definition

namespace LRA.Order.OrderedSets.StrictOrder

/--
The relation in a strict order is irreflexive.

Logical form:

```lean
LRA.Order.StrictOrder relation ->
  LRA.Relation.Irreflexive relation
```
-/
theorem StrictOrderIsIrreflexive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsStrictOrder : LRA.Order.StrictOrder relation) :
    LRA.Relation.Irreflexive relation :=
  relationIsStrictOrder.1

/--
The relation in a strict order is transitive.

Logical form:

```lean
LRA.Order.StrictOrder relation ->
  LRA.Relation.Transitive relation
```
-/
theorem StrictOrderIsTransitive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsStrictOrder : LRA.Order.StrictOrder relation) :
    LRA.Relation.Transitive relation :=
  relationIsStrictOrder.2

/--
Every strict order is asymmetric.

Logical form:

```lean
LRA.Order.StrictOrder relation ->
  LRA.Relation.Asymmetric relation
```
-/
theorem StrictOrderIsAsymmetric
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsStrictOrder : LRA.Order.StrictOrder relation) :
    LRA.Relation.Asymmetric relation := by
  sorry

/--
Every strict order is antisymmetric, vacuously: mutual strict comparison cannot
occur.

Logical form:

```lean
LRA.Order.StrictOrder relation ->
  LRA.Relation.Antisymmetric relation
```
-/
theorem StrictOrderIsAntisymmetric
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsStrictOrder : LRA.Order.StrictOrder relation) :
    LRA.Relation.Antisymmetric relation := by
  sorry

/--
The relation packaged by a strict-order relation is irreflexive.

Logical form:

```lean
LRA.Relation.Irreflexive order.relation
```
-/
theorem StrictOrderRelationIsIrreflexive
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Relation.Irreflexive order.relation :=
  StrictOrderIsIrreflexive order.relation order.relationIsStrictOrder

end LRA.Order.OrderedSets.StrictOrder
