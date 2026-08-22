-- LRA/NumberSystems/RealNumbers/Constructions/Dedekind/Instances.lean
-- Registration into the system's interface.

import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Behavior

namespace LRA.NumberSystems.RealNumbers.Dedekind
open LRA.NumberSystems.Models

/-!
New content: the source never registered `Cut rational_model` as an
instance of `LRA.NumberSystems.Models.RealModel`, the generic
complete-ordered-field interface this construction realizes. Assembling
the instance from the (mostly `sorry`) cut-level facts above is itself new
work under this migration's policy, so it is stated whole, `sorry`, rather
than composed field-by-field without a toolchain to check the composition.
Tracked in `RealNumbers/ProofOrder.md`.
-/

variable (rational_model : DenselyOrderedFieldModel)

/-- `Cut rational_model` realizes the generic complete ordered-field
`RealModel` interface.

Logical form:

```lean
noncomputable def DedekindRealizesRealModel :
    LRA.NumberSystems.Models.RealModel
```
-/
noncomputable def DedekindRealizesRealModel :
    LRA.NumberSystems.Models.RealModel := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
