import LRA.VolumeI.Order.OrderedSets.StrictOrder.Definition

namespace LRA.VolumeI.Order.OrderedSets.StrictOrder

/--
The relation in a strict order is irreflexive.

Logical form:

```lean
LRA.VolumeI.Order.StrictOrder relation ->
  LRA.VolumeI.Relations.Irreflexive relation
```
-/
theorem StrictOrderIsIrreflexive
    {Carrier : Type u}
    (relation : LRA.VolumeI.Order.OrderedSets.OrderRelation.Relation Carrier)
    (relationIsStrictOrder : LRA.VolumeI.Order.StrictOrder relation) :
    LRA.VolumeI.Relations.Irreflexive relation := by
  sorry

/--
The relation in a strict order is transitive.

Logical form:

```lean
LRA.VolumeI.Order.StrictOrder relation ->
  LRA.VolumeI.Relations.Transitive relation
```
-/
theorem StrictOrderIsTransitive
    {Carrier : Type u}
    (relation : LRA.VolumeI.Order.OrderedSets.OrderRelation.Relation Carrier)
    (relationIsStrictOrder : LRA.VolumeI.Order.StrictOrder relation) :
    LRA.VolumeI.Relations.Transitive relation := by
  sorry

/--
Every strict order is asymmetric.

Logical form:

```lean
LRA.VolumeI.Order.StrictOrder relation ->
  LRA.VolumeI.Relations.Asymmetric relation
```
-/
theorem StrictOrderIsAsymmetric
    {Carrier : Type u}
    (relation : LRA.VolumeI.Order.OrderedSets.OrderRelation.Relation Carrier)
    (relationIsStrictOrder : LRA.VolumeI.Order.StrictOrder relation) :
    LRA.VolumeI.Relations.Asymmetric relation := by
  sorry

/--
Every strict order is antisymmetric, vacuously: mutual strict comparison cannot
occur.

Logical form:

```lean
LRA.VolumeI.Order.StrictOrder relation ->
  LRA.VolumeI.Relations.Antisymmetric relation
```
-/
theorem StrictOrderIsAntisymmetric
    {Carrier : Type u}
    (relation : LRA.VolumeI.Order.OrderedSets.OrderRelation.Relation Carrier)
    (relationIsStrictOrder : LRA.VolumeI.Order.StrictOrder relation) :
    LRA.VolumeI.Relations.Antisymmetric relation := by
  sorry

/--
The relation packaged by a strict-order relation is irreflexive.

Logical form:

```lean
LRA.VolumeI.Relations.Irreflexive order.relation
```
-/
theorem StrictOrderRelationIsIrreflexive
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.VolumeI.Relations.Irreflexive order.relation := by
  sorry

end LRA.VolumeI.Order.OrderedSets.StrictOrder
