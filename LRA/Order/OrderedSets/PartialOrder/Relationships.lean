import LRA.Order.OrderedSets.PartialOrder.Characterizations
import LRA.Order.OrderedSets.Preorder.Relationships
import LRA.Order.OrderedSets.StrictOrder.Definition
import LRA.Order.Relation.StrictPart.Definition
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Order.OrderedSets.PartialOrder

universe u

                                                     
def StrictPart
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.OrderedSets.OrderRelation Carrier :=
  LRA.Order.StrictPart order.relation

                                                                        
theorem StrictPartIff
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier) :
    StrictPart order left right <->
      order.relation left right /\ left ≠ right := by
  sorry

                                                                                             
theorem StrictPartIffNotConverse
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier) :
    StrictPart order left right <->
      order.relation left right /\ Not (order.relation right left) := by
  sorry

                                                                                              
theorem StrictPartRelationIsStrictOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.StrictOrder (StrictPart order) := by
  sorry

                                                 
def StrictPartAsStrictOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.OrderedSets.StrictOrder.StrictOrderRelation Carrier where
  relation := StrictPart order
  relationIsStrictOrder := StrictPartRelationIsStrictOrder order

                                                                       
theorem StrictPartIsStrictOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.StrictOrder (StrictPart order) := by
  sorry

                                                                                            
theorem DualRelationIsPartialOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.PartialOrder
      (LRA.Relation.Converse order.relation) := by
  sorry

                                                                               
def Dual
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    NonStrictPartialOrder Carrier where
  relation := LRA.Relation.Converse order.relation
  relationIsPartialOrder := DualRelationIsPartialOrder order

                                                                     
theorem DualIsPartialOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.PartialOrder
      (LRA.Relation.Converse order.relation) := by
  sorry

end LRA.Order.OrderedSets.PartialOrder
