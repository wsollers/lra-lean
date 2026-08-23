import LRA.Order.Lattices.Meet.Definition
import LRA.Relation.Properties.Definition
import LRA.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u

                                               
theorem MeetUnique
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {left right first second : Alpha}
    (firstIsMeet : Meet relation left right first)
    (secondIsMeet : Meet relation left right second) :
    first = second := by
  sorry

                                                                      
theorem MeetCommutes
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (left right meet : Alpha) :
    Meet relation left right meet ↔ Meet relation right left meet := by
  sorry

                                                                   
theorem MeetIdempotent
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (element : Alpha) :
    Meet relation element element element := by
  sorry

                                                                                         
theorem MeetAssociative
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {left middle right leftMiddle firstAssociation
      middleRight secondAssociation : Alpha}
    (leftMiddleIsMeet : Meet relation left middle leftMiddle)
    (firstAssociationIsMeet : Meet relation leftMiddle right firstAssociation)
    (middleRightIsMeet : Meet relation middle right middleRight)
    (secondAssociationIsMeet : Meet relation left middleRight secondAssociation) :
    firstAssociation = secondAssociation := by
  sorry

end LRA.Order
