-- GENERATED PILOT ARTIFACT from order.upper-bound.pilot-002; edit the reviewed package, not this file.

import LRA.Pilot.VolumeI.OrderTheory.Bounds.Concepts.UpperBound.Definition
import Mathlib.Data.Set.Basic

namespace LRA.Pilot.VolumeI.OrderTheory.Bounds

/--
`NaturalNumberPoset` packages the usual non-strict order on natural numbers as
a Volume I poset for the Upper Bound examples.

Logical form:

```lean
LRA.VolumeI.Order.Poset where
  Carrier := Nat
  NonStrictOrder := fun left right => left <= right
```
-/
def NaturalNumberPoset : LRA.VolumeI.Order.Poset where
  Carrier := Nat
  NonStrictOrder := fun left right => left <= right
  NonStrictOrderIsPartialOrder := by
    refine ⟨?_, ?_, ?_⟩
    · intro element
      exact Nat.le_refl element
    · intro left right leftLeRight rightLeLeft
      exact Nat.le_antisymm leftLeRight rightLeLeft
    · intro first second third firstLeSecond secondLeThird
      exact Nat.le_trans firstLeSecond secondLeThird

/--
`ZeroSingleton` is the singleton natural-number set used by the positive and
negative boundary examples.

Logical form:

```lean
{0 : Nat}
```
-/
def ZeroSingleton : Set Nat := {0}

/--
One is an upper bound of the singleton natural-number set containing zero.

Logical form:

```lean
UpperBound NaturalNumberPoset ZeroSingleton (1 : Nat)
```
-/
theorem OneIsUpperBoundOfZeroSingleton :
    UpperBound NaturalNumberPoset ZeroSingleton (1 : Nat) := by
  sorry

/--
Every element of a Volume I poset is an upper bound of its empty subset.

Logical form:

```lean
UpperBound poset (empty : Set poset.Carrier) bound
```
-/
theorem EveryElementBoundsEmptySet
    (poset : LRA.VolumeI.Order.Poset)
    (bound : poset.Carrier) :
    UpperBound poset (∅ : Set poset.Carrier) bound := by
  sorry

end LRA.Pilot.VolumeI.OrderTheory.Bounds
