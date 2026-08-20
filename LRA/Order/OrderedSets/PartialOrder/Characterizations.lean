import LRA.Order.OrderedSets.PartialOrder.NonStrict

namespace LRA.Order.OrderedSets.PartialOrder

/-- The relation in a partial order is reflexive. -/
theorem PartialOrderIsReflexive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.Order.PartialOrder relation) :
    LRA.Relation.Reflexive relation := by
  sorry

/-- The relation in a partial order is antisymmetric. -/
theorem PartialOrderIsAntisymmetric
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.Order.PartialOrder relation) :
    LRA.Relation.Antisymmetric relation := by
  sorry

/-- The relation in a partial order is transitive. -/
theorem PartialOrderIsTransitive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.Order.PartialOrder relation) :
    LRA.Relation.Transitive relation := by
  sorry

/-- The relation packaged by a partial-order relation is reflexive. -/
theorem PartialOrderRelationIsReflexive
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.Relation.Reflexive order.relation := by
  sorry

/-- The relation packaged by a partial-order relation is antisymmetric. -/
theorem PartialOrderRelationIsAntisymmetric
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.Relation.Antisymmetric order.relation := by
  sorry

/-- The relation packaged by a partial-order relation is transitive. -/
theorem PartialOrderRelationIsTransitive
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.Relation.Transitive order.relation := by
  sorry

end LRA.Order.OrderedSets.PartialOrder
