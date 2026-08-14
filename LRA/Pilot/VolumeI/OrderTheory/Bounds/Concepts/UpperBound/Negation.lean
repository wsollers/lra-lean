-- GENERATED PILOT ARTIFACT from order.upper-bound.pilot-002; edit the reviewed package, not this file.

import LRA.Pilot.VolumeI.OrderTheory.Bounds.Concepts.UpperBound.Definition

namespace LRA.Pilot.VolumeI.OrderTheory.Bounds

universe v

/--
`UpperBoundFailureAt poset subset bound element` says that `element` belongs
to `subset` but is not below `bound`.

Logical form:

```lean
element ∈ subset /\ Not (poset.NonStrictOrder element bound)
```
-/
def UpperBoundFailureAt
    (poset : LRA.VolumeI.Relations.Order.Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (bound element : poset.Carrier) : Prop :=
  element ∈ subset /\ Not (poset.NonStrictOrder element bound)

/--
`NotUpperBound poset subset bound` is the literal negation of the primary
upper-bound predicate.

Logical form:

```lean
Not (UpperBound poset subset bound)
```
-/
def NotUpperBound
    (poset : LRA.VolumeI.Relations.Order.Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (bound : poset.Carrier) : Prop :=
  Not (UpperBound poset subset bound)

/--
A candidate fails to be an upper bound exactly when some subset member is not
below it. The witness-extraction direction uses classical logic.

Logical form:

```lean
NotUpperBound poset subset bound <->
  exists element, UpperBoundFailureAt poset subset bound element
```
-/
theorem NotUpperBoundIffExistsFailure
    (poset : LRA.VolumeI.Relations.Order.Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (bound : poset.Carrier) :
    NotUpperBound poset subset bound <->
      exists element, UpperBoundFailureAt poset subset bound element := by
  sorry

end LRA.Pilot.VolumeI.OrderTheory.Bounds
