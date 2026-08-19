-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Instances.lean
-- Registration into the system's interface.

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Behavior

namespace LRA.NumberSystems.RealNumbers.Dyadic
open LRA.NumberSystems.Models

/-!
New content: the source never registered `Expansion` as an instance of
`LRA.NumberSystems.Models.RealModel`, the generic complete-ordered-field
interface this construction realizes (by transport, through
`binaryRealBijection`, from whatever `RealModel` instance the underlying
`Cauchy.Carrier` already realizes). Assembling the instance from the
(mostly `sorry`) transported-structure facts above is itself new work under
this migration's policy, so it is stated whole, `sorry`, rather than
composed field-by-field without a toolchain to check the composition.
Tracked in `RealNumbers/ProofOrder.md`.
-/

/-- `Expansion` realizes the generic complete ordered-field `RealModel`
interface, by transport across `binaryRealBijection dyadic_data` from the
`RealModel` realized by the underlying `Cauchy.Carrier`.

Logical form:

```lean
noncomputable def DyadicRealizesRealModel
    (dyadic_data : RationalDyadicApproximationData) :
    LRA.NumberSystems.Models.RealModel
```
-/
noncomputable def DyadicRealizesRealModel
    (dyadic_data : RationalDyadicApproximationData) :
    LRA.NumberSystems.Models.RealModel := by
  sorry

end LRA.NumberSystems.RealNumbers.Dyadic
