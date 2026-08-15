import LRA.VolumeI.Order.Bounds.BoundedAbove.Definition
import LRA.VolumeI.Order.Bounds.Supremum.Definition

namespace LRA.Order

universe u v

/-- Every nonempty bounded-above backend subset has a supremum. -/
def LeastUpperBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  forall subset : SetObject,
    (exists element, element ∈ subset) ->
      BoundedAbove relation subset ->
        exists supremum, Supremum relation subset supremum

end LRA.Order
