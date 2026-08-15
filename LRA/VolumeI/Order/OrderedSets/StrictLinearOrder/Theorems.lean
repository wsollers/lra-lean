import LRA.VolumeI.Order.OrderedSets.StrictLinearOrder.Definition

namespace LRA.Order

universe u

/-- Exact trichotomy by itself forces irreflexivity. -/
theorem ExactlyTrichotomousImpliesIrreflexive
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsExactlyTrichotomous :
      LRA.Relation.ExactlyTrichotomous relation) :
    LRA.Relation.Irreflexive relation := by
  sorry

end LRA.Order
