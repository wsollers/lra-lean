import LRA.Carrier.Countability
import LRA.NumberSystems.Integers.Theorems
import LRA.NumberSystems.RationalNumbers.Definition

namespace LRA.NumberSystems.RationalNumbers

universe u

/-- Every rational number system is countable.

Its integer source is countable, and every rational is represented by a pair of
integer numerals with nonzero denominator. Thus the rational carrier is a
quotient/image of a countable product and is countable.

Logical form:

```lean
theorem RationalNumberSystemIsCountable
    (rationalSystem : RationalNumberSystem.{u}) :
    LRA.Carrier.IsCountable rationalSystem.FieldModel.Carrier
```
-/
theorem RationalNumberSystemIsCountable
    (rationalSystem : RationalNumberSystem.{u}) :
    LRA.Carrier.IsCountable rationalSystem.FieldModel.Carrier := by
  sorry

end LRA.NumberSystems.RationalNumbers
