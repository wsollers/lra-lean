import LRA.VolumeI.Order.TotalOrder

namespace LRA.VolumeI.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- A lower bound of a subset with respect to a non-strict order.

Logical form:

```lean
def LowerBound
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (bound : Element) : Prop :=
  forall element, element ∈ subset -> relation bound element
```
-/
def LowerBound
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (bound : Element) : Prop :=
  forall element, element ∈ subset -> relation bound element

end LRA.VolumeI.Order
