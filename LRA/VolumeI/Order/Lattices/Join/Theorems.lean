import LRA.VolumeI.Order.Lattices.Join.Definition

namespace LRA.VolumeI.Order

universe u

/-- Antisymmetry makes a binary join unique. -/
theorem JoinUnique
    {Alpha : Type u}
    {relation : LRA.VolumeI.Relations.Endorelation Alpha}
    (relationIsAntisymmetric : LRA.VolumeI.Relations.Antisymmetric relation)
    {left right first second : Alpha}
    (firstIsJoin : Join relation left right first)
    (secondIsJoin : Join relation left right second) :
    first = second := by
  sorry

/-- The order of the two inputs does not affect the join predicate. -/
theorem JoinCommutes
    {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha)
    (left right join : Alpha) :
    Join relation left right join ↔ Join relation right left join := by
  sorry

end LRA.VolumeI.Order
