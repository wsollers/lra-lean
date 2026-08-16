import LRA.VolumeI.Relations.Basic.Properties

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- A minimal element of a subset with respect to a strict order.

Logical form:

```lean
def MinimalElement
    (strictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (minimal : Element) : Prop :=
  LRA.Relation.MinimalElement strictRelation subset minimal
```
-/
abbrev MinimalElement
    (strictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (minimal : Element) : Prop :=
  LRA.Relation.MinimalElement strictRelation subset minimal

end LRA.Order
