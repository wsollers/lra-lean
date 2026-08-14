import LRA.VolumeI.Order.OrderedSets.PartialOrder.NonStrict
import LRA.VolumeI.Order.OrderedSets.PartialOrder.Strict

namespace LRA.VolumeI.Order.OrderedSets.PartialOrder

/--
The usual `<=` relation on natural numbers is a non-strict partial order.

Logical form:

```lean
NonStrictPartialOrder Nat
```
-/
def NaturalNumberNonStrictPartialOrder :
    NonStrictPartialOrder Nat where
  relation := fun left right => left <= right
  isPartialOrder := by
    refine And.intro ?reflexive (And.intro ?antisymmetric ?transitive)
    · intro element
      exact Nat.le_refl element
    · intro left right leftBelowRight rightBelowLeft
      exact Nat.le_antisymm leftBelowRight rightBelowLeft
    · intro first second third firstBelowSecond secondBelowThird
      exact Nat.le_trans firstBelowSecond secondBelowThird

/--
The usual `<` relation on natural numbers is a strict partial order.

Logical form:

```lean
StrictPartialOrder Nat
```
-/
def NaturalNumberStrictPartialOrder :
    StrictPartialOrder Nat where
  relation := fun left right => left < right
  isStrictPartialOrder := by
    refine And.intro ?irreflexive ?transitive
    · intro element
      exact Nat.lt_irrefl element
    · intro first second third firstBelowSecond secondBelowThird
      exact Nat.lt_trans firstBelowSecond secondBelowThird

/--
Equality on booleans is a non-strict partial order.

Logical form:

```lean
NonStrictPartialOrder Bool
```
-/
def BooleanEqualityNonStrictPartialOrder :
    NonStrictPartialOrder Bool where
  relation := fun left right => left = right
  isPartialOrder := by
    refine And.intro ?reflexive (And.intro ?antisymmetric ?transitive)
    · intro element
      rfl
    · intro left right leftEqualsRight rightEqualsLeft
      exact leftEqualsRight
    · intro first second third firstEqualsSecond secondEqualsThird
      exact Eq.trans firstEqualsSecond secondEqualsThird

end LRA.VolumeI.Order.OrderedSets.PartialOrder
