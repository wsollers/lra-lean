-- GENERATED PILOT ARTIFACT from order.upper-bound.pilot-002; edit the reviewed package, not this file.

import LRA.Pilot.VolumeI.OrderTheory.Bounds.Concepts.UpperBound.Negation

namespace LRA.Pilot.VolumeI.OrderTheory.Bounds

universe v

/--
A candidate is an upper bound exactly when every carrier element not below the
candidate is excluded from the subset. The reverse direction uses classical
logic for the arbitrary proposition-valued order relation.

Logical form:

```lean
UpperBound poset subset bound <->
  forall element,
    Not (poset.NonStrictOrder element bound) -> element ∉ subset
```
-/
theorem UpperBoundIffContrapositive
    (poset : LRA.VolumeI.Relations.Order.Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (bound : poset.Carrier) :
    UpperBound poset subset bound <->
      forall element,
        Not (poset.NonStrictOrder element bound) -> element ∉ subset := by
  sorry

end LRA.Pilot.VolumeI.OrderTheory.Bounds
