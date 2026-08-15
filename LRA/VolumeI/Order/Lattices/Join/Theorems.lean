import LRA.VolumeI.Order.Lattices.Join.Definition

namespace LRA.Order

universe u

/-- Antisymmetry makes a binary join unique. -/
theorem JoinUnique
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {left right first second : Alpha}
    (firstIsJoin : Join relation left right first)
    (secondIsJoin : Join relation left right second) :
    first = second := by
  sorry

/-- The order of the two inputs does not affect the join predicate. -/
theorem JoinCommutes
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (left right join : Alpha) :
    Join relation left right join ↔ Join relation right left join := by
  sorry

/-- Reflexivity makes an element the join of itself with itself. -/
theorem JoinIdempotent
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (element : Alpha) :
    Join relation element element element := by
  sorry

/-- Whenever the displayed joins exist in a partial order, the two associations agree. -/
theorem JoinAssociative
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {left middle right leftMiddle firstAssociation
      middleRight secondAssociation : Alpha}
    (leftMiddleIsJoin : Join relation left middle leftMiddle)
    (firstAssociationIsJoin :
      Join relation leftMiddle right firstAssociation)
    (middleRightIsJoin : Join relation middle right middleRight)
    (secondAssociationIsJoin :
      Join relation left middleRight secondAssociation) :
    firstAssociation = secondAssociation := by
  sorry

end LRA.Order
