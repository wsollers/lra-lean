-- LRA/NumberSystems/RealNumbers/Constructions/PrimitiveIntervals/Instances.lean
-- Registration into the system's interface.

import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Behavior

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals
open LRA.NumberSystems.Models

/-!
New content: the source never registered `Carrier rational_model` as an
instance of `LRA.NumberSystems.Models.RealModel`, the generic
complete-ordered-field interface this construction realizes. Assembling
the instance from the (mostly `sorry`) law lemmas above is itself new work
under this migration's policy, so it is stated whole, `sorry`, rather than
composed field-by-field without a toolchain to check the composition.
Tracked in `RealNumbers/ProofOrder.md`.
-/

/-- `Carrier rational_model` realizes the generic complete ordered-field
`RealModel` interface.

Logical form:

```lean
noncomputable def PrimitiveIntervalsRealizesRealModel
    (rational_model : RationalModel) :
    LRA.NumberSystems.Models.RealModel
```
-/
noncomputable def PrimitiveIntervalsRealizesRealModel
    (rational_model : RationalModel) :
    LRA.NumberSystems.Models.RealModel := by
  sorry

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
