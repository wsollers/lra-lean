import LRA.VolumeI.Order.OrderedSets.PartialOrder.NonStrict

namespace LRA.Order.OrderedSets.PartialOrder

/--
The relation in a partial order is reflexive.

Logical form:

```lean
LRA.Order.PartialOrder relation ->
  LRA.Relation.Reflexive relation
```
-/
theorem PartialOrderIsReflexive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.Order.PartialOrder relation) :
    LRA.Relation.Reflexive relation :=
  relationIsPartialOrder.1

/--
The relation in a partial order is antisymmetric.

Logical form:

```lean
LRA.Order.PartialOrder relation ->
  LRA.Relation.Antisymmetric relation
```
-/
theorem PartialOrderIsAntisymmetric
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.Order.PartialOrder relation) :
    LRA.Relation.Antisymmetric relation :=
  relationIsPartialOrder.2.1

/--
The relation in a partial order is transitive.

Logical form:

```lean
LRA.Order.PartialOrder relation ->
  LRA.Relation.Transitive relation
```
-/
theorem PartialOrderIsTransitive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.Order.PartialOrder relation) :
    LRA.Relation.Transitive relation :=
  relationIsPartialOrder.2.2

/--
The relation packaged by a partial-order relation is reflexive.

Logical form:

```lean
LRA.Relation.Reflexive order.relation
```
-/
theorem PartialOrderRelationIsReflexive
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.Relation.Reflexive order.relation :=
  PartialOrderIsReflexive order.relation order.relationIsPartialOrder

/--
The relation packaged by a partial-order relation is antisymmetric.

Logical form:

```lean
LRA.Relation.Antisymmetric order.relation
```
-/
theorem PartialOrderRelationIsAntisymmetric
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.Relation.Antisymmetric order.relation :=
  PartialOrderIsAntisymmetric order.relation order.relationIsPartialOrder

/--
The relation packaged by a partial-order relation is transitive.

Logical form:

```lean
LRA.Relation.Transitive order.relation
```
-/
theorem PartialOrderRelationIsTransitive
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.Relation.Transitive order.relation :=
  PartialOrderIsTransitive order.relation order.relationIsPartialOrder

/--
Compatibility theorem: a non-strict partial order relation is reflexive.

Logical form:

```lean
LRA.Relation.Reflexive order.relation
```
-/
theorem NonStrictRelationIsReflexive
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Relation.Reflexive order.relation :=
  PartialOrderRelationIsReflexive order

end LRA.Order.OrderedSets.PartialOrder
