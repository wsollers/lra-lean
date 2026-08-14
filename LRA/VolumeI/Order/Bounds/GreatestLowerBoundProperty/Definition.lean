import LRA.VolumeI.Order.Bounds.BoundedBelow.Definition
import LRA.VolumeI.Order.Bounds.Infimum.Definition

namespace LRA.VolumeI.Order

universe u v

/-- Every nonempty bounded-below backend subset has an infimum. -/
def GreatestLowerBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.VolumeI.Relations.Endorelation Element) : Prop :=
  forall subset : SetObject,
    (exists element, element ∈ subset) ->
      BoundedBelow relation subset ->
        exists infimum, Infimum relation subset infimum

end LRA.VolumeI.Order
