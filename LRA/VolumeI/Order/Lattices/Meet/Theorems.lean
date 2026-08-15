import LRA.VolumeI.Order.Lattices.Meet.Definition

namespace LRA.Order

universe u

/-- Antisymmetry makes a binary meet unique. -/
theorem MeetUnique
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {left right first second : Alpha}
    (firstIsMeet : Meet relation left right first)
    (secondIsMeet : Meet relation left right second) :
    first = second := by
  sorry

/-- The order of the two inputs does not affect the meet predicate. -/
theorem MeetCommutes
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (left right meet : Alpha) :
    Meet relation left right meet ↔ Meet relation right left meet := by
  sorry

end LRA.Order
