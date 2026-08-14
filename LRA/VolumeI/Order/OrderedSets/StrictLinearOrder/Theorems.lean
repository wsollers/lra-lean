import LRA.VolumeI.Order.OrderedSets.StrictLinearOrder.Definition

namespace LRA.VolumeI.Order

universe u

/-- Exact trichotomy by itself forces irreflexivity. -/
theorem ExactlyTrichotomousImpliesIrreflexive
    {Alpha : Type u}
    {relation : LRA.VolumeI.Relations.Endorelation Alpha}
    (relationIsExactlyTrichotomous :
      LRA.VolumeI.Relations.ExactlyTrichotomous relation) :
    LRA.VolumeI.Relations.Irreflexive relation := by
  sorry

end LRA.VolumeI.Order
