import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.VolumeI.Order

universe u

/--
Two elements are comparable with respect to a displayed relation.

For a non-strict order this is the usual comparability predicate. A strict
order requires a separate equality alternative; that relationship belongs in
the concept's future characterization layer.

Logical form:

```lean
def Comparable {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (left right : alpha) : Prop :=
  relation left right \/ relation right left
```
-/
def Comparable {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (left right : alpha) : Prop :=
  relation left right \/ relation right left

end LRA.VolumeI.Order
