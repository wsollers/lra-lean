import LRA.Order.OrderedSets.PartialOrder.Relationships
import LRA.Order.OrderedSets.StrictOrder.Characterizations
import LRA.Order.Relation.LessThanOrEqual.Definition

namespace LRA.Order.OrderedSets.StrictOrder

universe u

/-- The reflexive closure of a strict order. -/
def ReflexiveClosure
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Order.OrderedSets.OrderRelation Carrier :=
  LRA.Order.LessThanOrEqual order.relation

/-- The reflexive closure unfolds to strict comparison or equality. -/
theorem ReflexiveClosureIff
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier)
    (left right : Carrier) :
    ReflexiveClosure order left right <->
      order.relation left right \/ left = right := by
  sorry

/-- The reflexive closure relation of a strict order satisfies the partial-order laws. -/
theorem ReflexiveClosureRelationIsPartialOrder
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Order.PartialOrder (ReflexiveClosure order) := by
  sorry

/-- The reflexive closure of a strict order bundled as a non-strict partial order. -/
def ReflexiveClosureAsPartialOrder
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier where
  relation := ReflexiveClosure order
  relationIsPartialOrder := ReflexiveClosureRelationIsPartialOrder order

/-- The reflexive closure of a strict order satisfies the partial-order laws. -/
theorem ReflexiveClosureIsPartialOrder
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Order.PartialOrder (ReflexiveClosure order) := by
  exact ReflexiveClosureRelationIsPartialOrder order

/-- Taking reflexive closure and then strict part returns the original strict relation. -/
theorem StrictPartOfReflexiveClosureIff
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier)
    (left right : Carrier) :
    LRA.Order.OrderedSets.PartialOrder.StrictPart
      (ReflexiveClosureAsPartialOrder order) left right <->
      order.relation left right := by
  sorry

/-- Taking strict part and then reflexive closure returns the original non-strict relation. -/
theorem ReflexiveClosureOfStrictPartIff
    {Carrier : Type u}
    (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder
      Carrier)
    (left right : Carrier) :
    ReflexiveClosure
        (LRA.Order.OrderedSets.PartialOrder.StrictPartAsStrictOrder
          order) left right <->
      order.relation left right := by
  sorry

end LRA.Order.OrderedSets.StrictOrder
