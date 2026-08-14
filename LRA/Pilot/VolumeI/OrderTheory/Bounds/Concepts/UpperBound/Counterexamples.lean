-- GENERATED PILOT ARTIFACT from order.upper-bound.pilot-002; edit the reviewed package, not this file.

import LRA.Pilot.VolumeI.OrderTheory.Bounds.Concepts.UpperBound.Examples
import LRA.Pilot.VolumeI.OrderTheory.Bounds.Concepts.UpperBound.Variants

namespace LRA.Pilot.VolumeI.OrderTheory.Bounds

/--
An upper bound need not belong to the subset it bounds: one bounds the singleton
containing zero but is not its member.

Logical form:

```lean
UpperBound NaturalNumberPoset ZeroSingleton (1 : Nat) /\ (1 : Nat) ∉ ZeroSingleton
```
-/
theorem UpperBoundNeedNotBelongToSubset :
    UpperBound NaturalNumberPoset ZeroSingleton (1 : Nat) /\
      (1 : Nat) ∉ ZeroSingleton := by
  sorry

/--
The full natural-number carrier has no upper bound in the natural-number poset.

Logical form:

```lean
Not (exists bound : Nat,
  UpperBound NaturalNumberPoset (Set.univ : Set Nat) bound)
```
-/
theorem NaturalNumbersHaveNoUpperBound :
    Not (exists bound : Nat,
      UpperBound NaturalNumberPoset (Set.univ : Set Nat) bound) := by
  sorry

/--
The converse of the definition's membership implication is false: being below
an upper bound does not force membership in the bounded subset.

Logical form:

```lean
UpperBound NaturalNumberPoset ZeroSingleton (1 : Nat) /\
  Not (forall element : Nat,
    NaturalNumberPoset.NonStrictOrder element (1 : Nat) -> element ∈ ZeroSingleton)
```
-/
theorem UpperBoundConverseCanFail :
    UpperBound NaturalNumberPoset ZeroSingleton (1 : Nat) /\
      Not (forall element : Nat,
        NaturalNumberPoset.NonStrictOrder element (1 : Nat) ->
          element ∈ ZeroSingleton) := by
  sorry

/--
The inverse of the definition's membership implication is false: an element
outside the subset may still be below an upper bound.

Logical form:

```lean
UpperBound NaturalNumberPoset ZeroSingleton (1 : Nat) /\
  Not (forall element : Nat,
    element ∉ ZeroSingleton ->
      Not (NaturalNumberPoset.NonStrictOrder element (1 : Nat)))
```
-/
theorem UpperBoundInverseCanFail :
    UpperBound NaturalNumberPoset ZeroSingleton (1 : Nat) /\
      Not (forall element : Nat,
        element ∉ ZeroSingleton ->
          Not (NaturalNumberPoset.NonStrictOrder element (1 : Nat))) := by
  sorry

end LRA.Pilot.VolumeI.OrderTheory.Bounds
