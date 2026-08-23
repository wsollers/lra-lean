import LRA.Order.OrderedSets.Preorder.Characterizations
import LRA.Order.OrderedSets.PartialOrder.Definition
import LRA.Relation.Structures.Definition

namespace LRA.Order.OrderedSets.Preorder

universe u

                                                                                
                                                  
def StrictPartByNotConverse
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Order.OrderedSets.OrderRelation Carrier :=
  fun left right =>
    preorder.relation left right /\ Not (preorder.relation right left)

                                                                                   
def PreorderEquivalence
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.Endorelation Carrier :=
  fun left right =>
    preorder.relation left right /\ preorder.relation right left

                                                                    
theorem PreorderEquivalenceIsEquivalence
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.EquivalenceRelation (PreorderEquivalence preorder) := by
  sorry

                                                                             
def PreorderSetoid
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) : Setoid Carrier := by
  refine { r := PreorderEquivalence preorder, iseqv := ?_ }
  sorry

                                                                   
abbrev PreorderQuotient
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) : Type u :=
  Quotient (PreorderSetoid preorder)

                                                            
def PreorderQuotientRelation
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.Endorelation (PreorderQuotient preorder) :=
  fun left right =>
    Quotient.liftOn₂ left right preorder.relation (by
      intro leftRepresentative rightRepresentative
        otherLeftRepresentative otherRightRepresentative
        leftEquivalent rightEquivalent
      apply propext
      sorry)

                                                                              
theorem PreorderQuotientRelationIsPartialOrder
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Order.PartialOrder (PreorderQuotientRelation preorder) := by
  sorry

end LRA.Order.OrderedSets.Preorder
