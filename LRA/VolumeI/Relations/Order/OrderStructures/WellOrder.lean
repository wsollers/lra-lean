import LRA.VolumeI.Relations.Order.Bounds
import LRA.VolumeI.Relations.Order.OrderStructures.TotalOrder

namespace LRA.VolumeI.Relations.Order

universe u v

/-- Well-order laws for a non-strict order. `SetObject` is explicit for the
same reason as in `Completeness.lean`: the backend whose subsets are
quantified over is part of the assertion.

Logical form:

```lean
def WellOrder
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.VolumeI.Relations.Endorelation Element) : Prop :=
  TotalOrder relation /\
    forall subset : SetObject,
      (exists element, element ∈ subset) ->
        exists least, LeastElement relation subset least
```
-/
def WellOrder
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.VolumeI.Relations.Endorelation Element) : Prop :=
  TotalOrder relation /\
    forall subset : SetObject,
      (exists element, element ∈ subset) ->
        exists least, LeastElement relation subset least

end LRA.VolumeI.Relations.Order
