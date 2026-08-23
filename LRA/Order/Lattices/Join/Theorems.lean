import LRA.Order.Lattices.Join.Definition
import LRA.Relation.Properties.Definition
import LRA.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u

                                               
theorem JoinUnique
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {left right first second : Alpha}
    (firstIsJoin : Join relation left right first)
    (secondIsJoin : Join relation left right second) :
    first = second := by
  sorry

                                                                      
theorem JoinCommutes
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (left right join : Alpha) :
    Join relation left right join ↔ Join relation right left join := by
  sorry

                                                                   
theorem JoinIdempotent
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (element : Alpha) :
    Join relation element element element := by
  sorry

                                                                                         
theorem JoinAssociative
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {left middle right leftMiddle firstAssociation
      middleRight secondAssociation : Alpha}
    (leftMiddleIsJoin : Join relation left middle leftMiddle)
    (firstAssociationIsJoin : Join relation leftMiddle right firstAssociation)
    (middleRightIsJoin : Join relation middle right middleRight)
    (secondAssociationIsJoin : Join relation left middleRight secondAssociation) :
    firstAssociation = secondAssociation := by
  sorry

end LRA.Order
