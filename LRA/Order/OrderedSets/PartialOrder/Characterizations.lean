import LRA.Order.OrderedSets.PartialOrder.NonStrict

namespace LRA.Order.OrderedSets.PartialOrder

/-- The relation in a partial order is reflexive. -/
theorem PartialOrderIsReflexive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.Order.PartialOrder relation) :
    LRA.Relation.Reflexive relation :=
  relationIsPartialOrder.1

/-- The relation in a partial order is antisymmetric. -/
theorem PartialOrderIsAntisymmetric
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.Order.PartialOrder relation) :
    LRA.Relation.Antisymmetric relation :=
  relationIsPartialOrder.2.1

/-- The relation in a partial order is transitive. -/
theorem PartialOrderIsTransitive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.Order.PartialOrder relation) :
    LRA.Relation.Transitive relation :=
  relationIsPartialOrder.2.2

/-- The relation packaged by a partial-order relation is reflexive. -/
theorem PartialOrderRelationIsReflexive
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.Relation.Reflexive order.relation :=
  PartialOrderIsReflexive order.relation order.relationIsPartialOrder

/-- The relation packaged by a partial-order relation is antisymmetric. -/
theorem PartialOrderRelationIsAntisymmetric
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.Relation.Antisymmetric order.relation :=
  PartialOrderIsAntisymmetric order.relation order.relationIsPartialOrder

/-- The relation packaged by a partial-order relation is transitive. -/
theorem PartialOrderRelationIsTransitive
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.Relation.Transitive order.relation :=
  PartialOrderIsTransitive order.relation order.relationIsPartialOrder

end LRA.Order.OrderedSets.PartialOrder
