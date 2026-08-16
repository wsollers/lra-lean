import LRA.VolumeI.Relations.Basic.Properties

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- A maximal element of a subset with respect to a strict order.

Logical form:

```lean
def MaximalElement
    (strictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (maximal : Element) : Prop :=
  LRA.Relation.MaximalElement strictRelation subset maximal
```
-/
abbrev MaximalElement
    (strictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (maximal : Element) : Prop :=
  LRA.Relation.MaximalElement strictRelation subset maximal

end LRA.Order
