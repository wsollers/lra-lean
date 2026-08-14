import LRA.VolumeI.Order.Bounds.LowerBound.Definition

namespace LRA.VolumeI.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- A least element of a subset with respect to a non-strict order.

Logical form:

```lean
def LeastElement
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (least : Element) : Prop :=
  least ∈ subset /\ LowerBound relation subset least
```
-/
def LeastElement
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (least : Element) : Prop :=
  least ∈ subset /\ LowerBound relation subset least

end LRA.VolumeI.Order
