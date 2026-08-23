-- LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Instances.lean
-- Registration of the Cauchy completion as a real-number construction.

import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.Behavior

namespace LRA.NumberSystems.RealNumbers.Cauchy

open LRA.NumberSystems.Models
open LRA.NumberSystems.RationalNumbers

/-- The Cauchy completion of an actual rational number system realizes a
carrier-tied `RationalRealExtension`.

The metric input is anchored to that actual `RationalNumberSystem`, not to an
arbitrary dense ordered field, and now carries the stronger ordered-field
absolute-value and epsilon-splitting surface rather than only a weak
triangle-inequality package. The stronger conclusion that the completion is
*the real-number stage* is stated only for a `RationalNumberSystem`, and the
carrier equality forces the selected real extension to use the actual quotient
carrier rather than an unrelated complete ordered field.

Logical form:

```lean
theorem CauchyRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem)
    (absoluteValueData : RationalMetricData rationalSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier =
        Carrier rationalSystem absoluteValueData
```
-/
theorem CauchyRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem)
    (absoluteValueData : RationalMetricData rationalSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier =
        Carrier rationalSystem absoluteValueData := by
  sorry

end LRA.NumberSystems.RealNumbers.Cauchy
