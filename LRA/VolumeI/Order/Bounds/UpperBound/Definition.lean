import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.VolumeI.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- An upper bound of a subset with respect to a non-strict order.

Logical form:

```lean
def UpperBound
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (bound : Element) : Prop :=
  forall element, element ∈ subset -> relation element bound
```
-/
def UpperBound
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (bound : Element) : Prop :=
  forall element, element ∈ subset -> relation element bound

end LRA.VolumeI.Order
