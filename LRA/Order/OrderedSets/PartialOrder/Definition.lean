import LRA.Order.OrderedSets.Preorder.Definition

namespace LRA.Order

universe u

/-- A partial order is reflexive, antisymmetric, and transitive. -/
def PartialOrder {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  LRA.Relation.Reflexive relation ∧
    LRA.Relation.Antisymmetric relation ∧
      LRA.Relation.Transitive relation

end LRA.Order

namespace LRA.Order.OrderedSets.PartialOrder

universe u

/-- A partial-order relation bundled with its partial-order law. -/
structure PartialOrderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  relationIsPartialOrder : LRA.Order.PartialOrder relation

end LRA.Order.OrderedSets.PartialOrder
