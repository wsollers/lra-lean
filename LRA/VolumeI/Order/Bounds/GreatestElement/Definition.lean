import LRA.VolumeI.Order.Bounds.UpperBound.Definition

namespace LRA.VolumeI.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- A greatest element of a subset with respect to a non-strict order.

Logical form:

```lean
def GreatestElement
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (greatest : Element) : Prop :=
  greatest ∈ subset /\ UpperBound relation subset greatest
```
-/
def GreatestElement
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (greatest : Element) : Prop :=
  greatest ∈ subset /\ UpperBound relation subset greatest

end LRA.VolumeI.Order
