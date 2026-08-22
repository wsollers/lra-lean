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

The generic carrier and metric definitions remain usable over a broader dense
ordered field. The stronger conclusion that the completion is *the real-number
stage* is stated only for a `RationalNumberSystem`, and the carrier equality
forces the selected real extension to use the actual quotient carrier rather
than an unrelated complete ordered field.

Logical form:

```lean
theorem CauchyRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem)
    (absoluteValueData : RationalMetricData rationalSystem.FieldModel) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier =
        Carrier rationalSystem.FieldModel absoluteValueData
```
-/
theorem CauchyRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem)
    (absoluteValueData : RationalMetricData rationalSystem.FieldModel) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier =
        Carrier rationalSystem.FieldModel absoluteValueData := by
  sorry

end LRA.NumberSystems.RealNumbers.Cauchy
