import LRA.VolumeI.Relations.Basic.Properties
import LRA.VolumeI.Relations.Order.Bounds
import LRA.VolumeI.Relations.Order.OrderStructures.WellOrder

namespace LRA.VolumeI.Relations.Order

universe u

/-- Order-facing synonym for subset-minimal well-foundedness. -/
def WellFoundedRelation
    (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (strictRelation : LRA.VolumeI.Relations.Endorelation interface.Element) : Prop :=
  LRA.VolumeI.Relations.WellFounded interface strictRelation

/-- Every nonempty subset of a well-founded relation has a minimal element. -/
theorem MinimalElementPrinciple
    {interface : LRA.VolumeI.Set.SetInterface.{u, u}}
    {strictRelation : LRA.VolumeI.Relations.Endorelation interface.Element}
    (strictRelationIsWellFounded : WellFoundedRelation interface strictRelation)
    (subset : interface.SetObject)
    (subsetIsNonempty : exists element, interface.member element subset) :
    exists minimalElement,
      LRA.VolumeI.Relations.MinimalElement interface strictRelation subset minimalElement := by
  exact strictRelationIsWellFounded subset subsetIsNonempty

/-- Every nonempty subset of a well-order has a least element. -/
theorem WellOrderingPrinciple
    {interface : LRA.VolumeI.Set.SetInterface.{u, u}}
    {nonStrictRelation : LRA.VolumeI.Relations.Endorelation interface.Element}
    (nonStrictRelationIsWellOrder : WellOrder interface nonStrictRelation)
    (subset : interface.SetObject)
    (subsetIsNonempty : exists element, interface.member element subset) :
    exists leastElement, LeastElement interface nonStrictRelation subset leastElement :=
  nonStrictRelationIsWellOrder.right subset subsetIsNonempty

end LRA.VolumeI.Relations.Order
