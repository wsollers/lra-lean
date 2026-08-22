-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Instances.lean
-- Registration of canonical binary expansions as a real-number
-- representation.

import LRA.NumberSystems.RealNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Behavior

namespace LRA.NumberSystems.RealNumbers.Dyadic

open LRA.NumberSystems.Models

/-- The canonical signed-binary expansion carrier realizes a carrier-tied
`RationalRealExtension`, transported across `BinaryRealBijection` from the
selected Cauchy-real carrier.

The carrier equality forces the selected extension to use `Expansion` itself
rather than an unrelated complete ordered field.

Logical form:

```lean
theorem DyadicRealizesRationalRealExtension
    (dyadicData : RationalDyadicApproximationData) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension
          dyadicData.RationalSystem,
      realExtension.RealModel.Carrier = Expansion
```
-/
theorem DyadicRealizesRationalRealExtension
    (dyadicData : RationalDyadicApproximationData) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension
          dyadicData.RationalSystem,
      realExtension.RealModel.Carrier = Expansion := by
  sorry

end LRA.NumberSystems.RealNumbers.Dyadic
