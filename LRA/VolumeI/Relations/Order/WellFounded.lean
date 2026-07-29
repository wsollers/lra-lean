import LRA.VolumeI.Relations.Basic.Properties
import LRA.VolumeI.Relations.Order.Bounds
import LRA.VolumeI.Relations.Order.OrderStructures.WellOrder

namespace LRA.VolumeI.Relations.Order

universe u

/-- Order-facing synonym for subset-minimal well-foundedness. -/
def WellFoundedRelation {Alpha : LRA.VolumeI.Set.LRACarrier}
    (strictRelation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  LRA.VolumeI.Relations.WellFounded strictRelation

/-- Every nonempty subset of a well-founded relation has a minimal element. -/
theorem MinimalElementPrinciple
    {Alpha : LRA.VolumeI.Set.LRACarrier}
    {strictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (strictRelationIsWellFounded : WellFoundedRelation strictRelation)
    (subset : LRA.VolumeI.Set.LRASet Alpha)
    (subsetIsNonempty : LRA.VolumeI.Set.LRASet.Nonempty subset) :
    exists minimalElement, MinimalElement strictRelation subset minimalElement := by
  exact strictRelationIsWellFounded subset subsetIsNonempty

/-- Every nonempty subset of a well-order has a least element. -/
theorem WellOrderingPrinciple
    {Alpha : LRA.VolumeI.Set.LRACarrier}
    {nonStrictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (nonStrictRelationIsWellOrder : WellOrder nonStrictRelation)
    (subset : LRA.VolumeI.Set.LRASet Alpha)
    (subsetIsNonempty : LRA.VolumeI.Set.LRASet.Nonempty subset) :
    exists leastElement, LeastElement nonStrictRelation subset leastElement :=
  nonStrictRelationIsWellOrder.right subset subsetIsNonempty

end LRA.VolumeI.Relations.Order
