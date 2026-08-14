import LRA.VolumeI.Order.OrderedSets.TotalOrder.Definition

namespace LRA.VolumeI.Order

universe u

/-- A total relation is reflexive. -/
theorem TotalImpliesReflexive
    {Alpha : Type u}
    {relation : LRA.VolumeI.Relations.Endorelation Alpha}
    (relationIsTotal : LRA.VolumeI.Relations.Total relation) :
    LRA.VolumeI.Relations.Reflexive relation := by
  sorry

end LRA.VolumeI.Order
