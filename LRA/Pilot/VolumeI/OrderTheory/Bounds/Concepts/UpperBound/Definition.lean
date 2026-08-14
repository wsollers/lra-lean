-- GENERATED PILOT ARTIFACT from order.upper-bound.pilot-002; edit the reviewed package, not this file.

import LRA.VolumeI.Order.OrderedSets.Poset.Definition

namespace LRA.Pilot.VolumeI.OrderTheory.Bounds

universe u v

/--
`UpperBound poset subset bound` means every member of `subset` is below
`bound` in the non-strict order supplied by `poset`.

Logical form:

```lean
forall element : poset.Carrier,
  element ∈ subset -> poset.NonStrictOrder element bound
```
-/
def UpperBound
    (poset : LRA.VolumeI.Order.Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (bound : poset.Carrier) : Prop :=
  forall element : poset.Carrier,
    element ∈ subset -> poset.NonStrictOrder element bound

end LRA.Pilot.VolumeI.OrderTheory.Bounds
