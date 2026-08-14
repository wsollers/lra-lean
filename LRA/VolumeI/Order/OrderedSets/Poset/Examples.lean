import LRA.VolumeI.Order.OrderedSets.Poset.Definition

namespace LRA.VolumeI.Order.OrderedSets.Poset

/--
The natural numbers with their usual non-strict order form a poset.

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
    refine And.intro ?reflexive (And.intro ?antisymmetric ?transitive)
    · intro element
      exact Nat.le_refl element
    · intro left right leftBelowRight rightBelowLeft
      exact Nat.le_antisymm leftBelowRight rightBelowLeft
    · intro first second third firstBelowSecond secondBelowThird
      exact Nat.le_trans firstBelowSecond secondBelowThird

end LRA.VolumeI.Order.OrderedSets.Poset
