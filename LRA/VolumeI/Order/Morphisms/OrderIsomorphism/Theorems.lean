import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.Supremum.Definition
import LRA.VolumeI.Order.Morphisms.OrderIsomorphism.Definition

namespace LRA.Order

universe u v

/-- Order isomorphisms carry suprema to suprema of image subsets. -/
theorem OrderIsomorphismPreservesSupremum
    {Alpha : Type u} {Beta : Type v}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {forward : Alpha -> Beta} {inverse : Beta -> Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation forward inverse)
    {subset : Set Alpha} {supremum : Alpha}
    (supremumIsSupremum : Supremum sourceRelation subset supremum) :
    Supremum targetRelation
      {target | exists source, source ∈ subset /\ forward source = target}
      (forward supremum) := by
  sorry

end LRA.Order
