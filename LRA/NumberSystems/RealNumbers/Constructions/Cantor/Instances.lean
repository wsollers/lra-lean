-- LRA/NumberSystems/RealNumbers/Constructions/Cantor/Instances.lean
-- Registration into the system's interface.

import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Behavior

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Models

/-!
New content: the source never registered `Carrier rational_model` as an
instance of `LRA.NumberSystems.Models.RealModel`, the generic
complete-ordered-field interface this construction realizes. Assembling
the instance from the (mostly `sorry`) nested-interval-level facts above is
itself new work under this migration's policy, so it is stated whole,
`sorry`, rather than composed field-by-field without a toolchain to check
the composition. Tracked in `RealNumbers/ProofOrder.md`.
-/

/-- `Carrier rational_model` realizes the generic complete ordered-field
`RealModel` interface.

Logical form:

```lean
noncomputable def CantorRealizesRealModel
    (rational_model : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Models.RealModel
```
-/
noncomputable def CantorRealizesRealModel
    (rational_model : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Models.RealModel := by
  sorry

end LRA.NumberSystems.RealNumbers.Cantor
