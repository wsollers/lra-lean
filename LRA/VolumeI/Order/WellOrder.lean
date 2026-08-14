import LRA.VolumeI.Order.Bounds
import LRA.VolumeI.Order.OrderedSets.TotalOrder.Definition

namespace LRA.VolumeI.Order

universe u v

/--
Well-order laws for a non-strict order. `SetObject` is explicit because the
backend whose subsets are quantified over is part of the assertion.

Totality remains an explicit conjunct. Deriving it from least elements of
two-point subsets would silently assume that the backend represents every
pair subset.

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

end LRA.VolumeI.Order
