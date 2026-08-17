import LRA.Order.OrderedSets.PartialOrder.Characterizations
import LRA.Order.OrderedSets.Preorder.Relationships
import LRA.Order.OrderedSets.StrictOrder.Definition
import LRA.Order.Relation.StrictPart.Definition
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Order.OrderedSets.PartialOrder

universe u

/-- The strict part of a non-strict partial order. -/
def StrictPart
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.OrderedSets.OrderRelation Carrier :=
  LRA.Order.StrictPart order.relation

/-- The strict part unfolds to non-strict comparison plus inequality. -/
theorem StrictPartIff
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier) :
    StrictPart order left right <->
      order.relation left right /\ left ≠ right := by
  sorry

/-- The strict part agrees with non-strict comparison plus failure of converse comparison. -/
theorem StrictPartIffNotConverse
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier) :
    StrictPart order left right <->
      order.relation left right /\ Not (order.relation right left) := by
  sorry

/-- The strict part relation of a non-strict partial order satisfies the strict-order laws. -/
theorem StrictPartRelationIsStrictOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.StrictOrder (StrictPart order) := by
  sorry

/-- The strict part bundled as a strict order. -/
def StrictPartAsStrictOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.OrderedSets.StrictOrder.StrictOrderRelation Carrier where
  relation := StrictPart order
  relationIsStrictOrder := StrictPartRelationIsStrictOrder order

/-- The strict part of a non-strict partial order is a strict order. -/
theorem StrictPartIsStrictOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.StrictOrder (StrictPart order) := by
  exact StrictPartRelationIsStrictOrder order

/-- The converse relation of a non-strict partial order satisfies the partial-order laws. -/
theorem DualRelationIsPartialOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.PartialOrder
      (LRA.Relation.Converse order.relation) := by
  sorry

/-- The dual of a non-strict partial order reverses the comparison relation. -/
def Dual
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    NonStrictPartialOrder Carrier where
  relation := LRA.Relation.Converse order.relation
  relationIsPartialOrder := DualRelationIsPartialOrder order

/-- The dual relation of a partial order is again a partial order. -/
theorem DualIsPartialOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.PartialOrder
      (LRA.Relation.Converse order.relation) := by
  exact DualRelationIsPartialOrder order

end LRA.Order.OrderedSets.PartialOrder
