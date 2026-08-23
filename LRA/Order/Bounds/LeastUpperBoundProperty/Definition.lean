import LRA.Order.Bounds.BoundedAbove.Definition
import LRA.Order.Bounds.Supremum.Definition

namespace LRA.Order

universe u v

                                                                  
def LeastUpperBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  forall subset : SetObject,
    (exists element, element ∈ subset) ->
      BoundedAbove relation subset ->
        exists supremum, Supremum relation subset supremum

end LRA.Order
