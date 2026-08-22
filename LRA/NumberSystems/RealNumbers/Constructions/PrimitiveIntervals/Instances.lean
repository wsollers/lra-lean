-- LRA/NumberSystems/RealNumbers/Constructions/PrimitiveIntervals/Instances.lean
-- Registration of the primitive-interval quotient as a real-number
-- construction.

import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Behavior

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals

open LRA.NumberSystems.Models
open LRA.NumberSystems.RationalNumbers

/-- The primitive-interval construction over an actual rational number system
realizes a carrier-tied `RationalRealExtension`.

Low-level interval syntax and overlap theory remain generic over a densely
ordered field.  The stronger claim that the quotient realizes the real-number
stage is made only over a `RationalNumberSystem`, and the carrier equality
forces the selected extension to use the actual primitive-interval quotient.

Logical form:

```lean
theorem PrimitiveIntervalsRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier = Carrier rationalSystem.FieldModel
```
-/
theorem PrimitiveIntervalsRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier = Carrier rationalSystem.FieldModel := by
  sorry

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
