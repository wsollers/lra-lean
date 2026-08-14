import LRA.VolumeI.Order.OrderedSets.PartialOrder.NonStrict

namespace LRA.VolumeI.Order.OrderedSets.PartialOrder

/--
The relation in a partial order is reflexive.

Logical form:

```lean
LRA.VolumeI.Order.PartialOrder relation ->
  LRA.VolumeI.Relations.Reflexive relation
```
-/
theorem PartialOrderIsReflexive
    {Carrier : Type u}
    (relation : LRA.VolumeI.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.VolumeI.Order.PartialOrder relation) :
    LRA.VolumeI.Relations.Reflexive relation :=
  relationIsPartialOrder.1

/--
The relation in a partial order is antisymmetric.

Logical form:

```lean
LRA.VolumeI.Order.PartialOrder relation ->
  LRA.VolumeI.Relations.Antisymmetric relation
```
-/
theorem PartialOrderIsAntisymmetric
    {Carrier : Type u}
    (relation : LRA.VolumeI.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.VolumeI.Order.PartialOrder relation) :
    LRA.VolumeI.Relations.Antisymmetric relation :=
  relationIsPartialOrder.2.1

/--
The relation in a partial order is transitive.

Logical form:

```lean
LRA.VolumeI.Order.PartialOrder relation ->
  LRA.VolumeI.Relations.Transitive relation
```
-/
theorem PartialOrderIsTransitive
    {Carrier : Type u}
    (relation : LRA.VolumeI.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.VolumeI.Order.PartialOrder relation) :
    LRA.VolumeI.Relations.Transitive relation :=
  relationIsPartialOrder.2.2

/--
The relation packaged by a partial-order relation is reflexive.

Logical form:

```lean
LRA.VolumeI.Relations.Reflexive order.relation
```
-/
theorem PartialOrderRelationIsReflexive
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.VolumeI.Relations.Reflexive order.relation :=
  PartialOrderIsReflexive order.relation order.relationIsPartialOrder

/--
The relation packaged by a partial-order relation is antisymmetric.

Logical form:

```lean
LRA.VolumeI.Relations.Antisymmetric order.relation
```
-/
theorem PartialOrderRelationIsAntisymmetric
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.VolumeI.Relations.Antisymmetric order.relation :=
  PartialOrderIsAntisymmetric order.relation order.relationIsPartialOrder

/--
The relation packaged by a partial-order relation is transitive.

Logical form:

```lean
LRA.VolumeI.Relations.Transitive order.relation
```
-/
theorem PartialOrderRelationIsTransitive
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.VolumeI.Relations.Transitive order.relation :=
  PartialOrderIsTransitive order.relation order.relationIsPartialOrder

/--
Compatibility theorem: a non-strict partial order relation is reflexive.

Logical form:

```lean
LRA.VolumeI.Relations.Reflexive order.relation
```
-/
theorem NonStrictRelationIsReflexive
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.VolumeI.Relations.Reflexive order.relation :=
  PartialOrderRelationIsReflexive order

end LRA.VolumeI.Order.OrderedSets.PartialOrder
