-- LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Instances.lean
-- Registration of the Cauchy completion as a real-number construction.

import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.Behavior

namespace LRA.NumberSystems.RealNumbers.Cauchy

open LRA.NumberSystems.Models
open LRA.NumberSystems.RationalNumbers

/-- The Cauchy completion of an actual rational number system admits a
`RealModel` structure on exactly its quotient carrier.

The generic carrier and metric definitions remain usable over a broader dense
ordered field. The stronger conclusion that the completion is *the real-number
stage* is stated only for a `RationalNumberSystem`, and the carrier equality
prevents the former detached-realization defect in which an unrelated
`RealModel` could witness the theorem.

Logical form:

```lean
theorem CauchyCarrierRealModelExists
    (rationalSystem : RationalNumberSystem)
    (absoluteValueData : RationalMetricData rationalSystem.FieldModel) :
    ∃ realModel : LRA.NumberSystems.Models.RealModel,
      realModel.Carrier =
        Carrier rationalSystem.FieldModel absoluteValueData
```
-/
theorem CauchyCarrierRealModelExists
    (rationalSystem : RationalNumberSystem)
    (absoluteValueData : RationalMetricData rationalSystem.FieldModel) :
    ∃ realModel : LRA.NumberSystems.Models.RealModel,
      realModel.Carrier =
        Carrier rationalSystem.FieldModel absoluteValueData := by
  sorry

end LRA.NumberSystems.RealNumbers.Cauchy
