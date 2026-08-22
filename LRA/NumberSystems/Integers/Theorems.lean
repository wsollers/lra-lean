import LRA.Carrier.Countability
import LRA.NumberSystems.Integers.Definition

namespace LRA.NumberSystems.Integers

universe u

/-- Every integer number system is countable.

The canonical numeral map from `Int` onto the carrier is bijective: surjectivity
is part of `IntegerNumberSystem`, while injectivity follows from the ordered
integral-domain laws. Hence the carrier has the same cardinality as `Int` and is
countable.

Logical form:

```lean
theorem IntegerNumberSystemIsCountable
    (integerSystem : IntegerNumberSystem.{u}) :
    LRA.Carrier.IsCountable integerSystem.Model.Carrier
```
-/
theorem IntegerNumberSystemIsCountable
    (integerSystem : IntegerNumberSystem.{u}) :
    LRA.Carrier.IsCountable integerSystem.Model.Carrier := by
  sorry

end LRA.NumberSystems.Integers
