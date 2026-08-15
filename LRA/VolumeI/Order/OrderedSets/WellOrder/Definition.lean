import LRA.VolumeI.Order.Bounds.LeastElement.Definition
import LRA.VolumeI.Order.OrderedSets.LinearOrder.Definition

namespace LRA.Order

universe u v

/-- Well-order laws for a non-strict order. `SetObject` is explicit because
the backend whose subsets are quantified over is part of the assertion.

Linearity remains explicit: deriving it from least elements of two-point
subsets would assume the backend represents every pair subset. -/
def WellOrder
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  LinearOrder relation /\
    forall subset : SetObject,
      (exists element, element ∈ subset) ->
        exists least, LeastElement relation subset least

end LRA.Order
