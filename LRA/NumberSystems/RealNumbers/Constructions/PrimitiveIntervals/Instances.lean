-- LRA/NumberSystems/RealNumbers/Constructions/PrimitiveIntervals/Instances.lean
-- Registration of the primitive-interval quotient as a real-number
-- construction.

import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Behavior

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals

open LRA.NumberSystems.Models
open LRA.NumberSystems.RationalNumbers

/-- The primitive-interval construction over an actual rational number system
admits a `RealModel` structure on exactly its quotient carrier.

Low-level interval syntax and overlap theory remain generic over a densely
ordered field.  The stronger claim that the quotient realizes the real-number
stage is made only over a `RationalNumberSystem`, and the carrier equality
prevents an unrelated complete ordered field from witnessing the theorem.

Logical form:

```lean
theorem PrimitiveIntervalCarrierRealModelExists
    (rationalSystem : RationalNumberSystem) :
    ∃ realModel : LRA.NumberSystems.Models.RealModel,
      realModel.Carrier = Carrier rationalSystem.FieldModel
```
-/
theorem PrimitiveIntervalCarrierRealModelExists
    (rationalSystem : RationalNumberSystem) :
    ∃ realModel : LRA.NumberSystems.Models.RealModel,
      realModel.Carrier = Carrier rationalSystem.FieldModel := by
  sorry

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
