import LRA.VolumeI.Order.TotalOrder

namespace LRA.VolumeI.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- A minimal element of a subset with respect to a strict order.

Logical form:

```lean
def MinimalElement
    (strictRelation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (minimal : Element) : Prop :=
  minimal ∈ subset /\
    forall element, element ∈ subset -> Not (strictRelation element minimal)
```
-/
def MinimalElement
    (strictRelation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (minimal : Element) : Prop :=
  minimal ∈ subset /\
    forall element, element ∈ subset -> Not (strictRelation element minimal)

end LRA.VolumeI.Order
