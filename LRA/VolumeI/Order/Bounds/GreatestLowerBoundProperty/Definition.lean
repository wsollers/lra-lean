import LRA.VolumeI.Order.Bounds.BoundedBelow.Definition
import LRA.VolumeI.Order.Bounds.Infimum.Definition

namespace LRA.Order

universe u v

/-- Every nonempty bounded-below backend subset has an infimum. -/
def GreatestLowerBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  forall subset : SetObject,
    (exists element, element ∈ subset) ->
      BoundedBelow relation subset ->
        exists infimum, Infimum relation subset infimum

end LRA.Order
