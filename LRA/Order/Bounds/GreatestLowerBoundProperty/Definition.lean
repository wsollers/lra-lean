import LRA.Order.Bounds.BoundedBelow.Definition
import LRA.Order.Bounds.Infimum.Definition

namespace LRA.Order

universe u v

                                                                  
def GreatestLowerBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  forall subset : SetObject,
    (exists element, element ∈ subset) ->
      BoundedBelow relation subset ->
        exists infimum, Infimum relation subset infimum

end LRA.Order
