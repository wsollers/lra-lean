import LRA.Pilot.OrderBounds
import LRA.Pilot.Supremum.Supremum

/-!
# Upper-bound pilot theorems

Small consequences used to test that the explicit `Poset` interface supports
ordinary theorem development without committing to the permanent Bounds
module layout.
-/

namespace LRA.Pilot.OrderBounds

open LRA.VolumeI.Order

universe v

/-- A set bounded above has an upper bound.

Logical form:

```lean
BoundedAbove poset subset →
  ∃ candidate : poset.Carrier, UpperBound poset subset candidate
```
-/
theorem BoundedAboveHasUpperBound
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (boundedAbove : BoundedAbove poset subset) :
    ∃ candidate : poset.Carrier, UpperBound poset subset candidate :=
  boundedAbove

/-- The existence of an upper bound makes a set bounded above.

Logical form:

```lean
(∃ candidate : poset.Carrier, UpperBound poset subset candidate) →
  BoundedAbove poset subset
```
-/
theorem HasUpperBoundImpliesBoundedAbove
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (hasUpperBound :
      ∃ candidate : poset.Carrier, UpperBound poset subset candidate) :
    BoundedAbove poset subset :=
  hasUpperBound

/-- Bounded above means exactly that an upper bound exists.

Logical form:

```lean
BoundedAbove poset subset ↔
  ∃ candidate : poset.Carrier, UpperBound poset subset candidate
```
-/
theorem BoundedAboveIffHasUpperBound
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject) :
    BoundedAbove poset subset ↔
      ∃ candidate : poset.Carrier, UpperBound poset subset candidate :=
  Iff.rfl

/-- A greatest element (maximum) belongs to the set.

Logical form:

```lean
GreatestElement poset subset maximum → maximum ∈ subset
```
-/
theorem GreatestElementIsMember
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (maximum : poset.Carrier)
    (maximumIsGreatest : GreatestElement poset subset maximum) :
    maximum ∈ subset :=
  maximumIsGreatest.1

/-- A greatest element (maximum) is an upper bound.

Logical form:

```lean
GreatestElement poset subset maximum →
  UpperBound poset subset maximum
```
-/
theorem GreatestElementIsUpperBound
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (maximum : poset.Carrier)
    (maximumIsGreatest : GreatestElement poset subset maximum) :
    UpperBound poset subset maximum :=
  maximumIsGreatest.2

/-- Every least upper bound is above every greatest element of the same set.

Logical form:

```lean
GreatestElement poset subset maximum →
  LeastUpperBound poset subset supremum →
  poset.NonStrictOrder maximum supremum
```
-/
theorem GreatestElementIsBelowLeastUpperBound
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (maximum supremum : poset.Carrier)
    (maximumIsGreatest : GreatestElement poset subset maximum)
    (supremumIsLeastUpperBound : LeastUpperBound poset subset supremum) :
    poset.NonStrictOrder maximum supremum :=
  supremumIsLeastUpperBound.1 maximum maximumIsGreatest.1

end LRA.Pilot.OrderBounds
