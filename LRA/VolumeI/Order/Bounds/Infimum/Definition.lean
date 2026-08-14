import LRA.VolumeI.Order.Bounds.LowerBound.Definition

namespace LRA.VolumeI.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- An infimum, or greatest lower bound, of a subset.

Logical form:

```lean
def Infimum
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (infimum : Element) : Prop :=
  LowerBound relation subset infimum /\
    forall bound, LowerBound relation subset bound -> relation bound infimum
```
-/
def Infimum
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject)
    (infimum : Element) : Prop :=
  LowerBound relation subset infimum /\
    forall bound, LowerBound relation subset bound -> relation bound infimum

end LRA.VolumeI.Order
