-- LRA/NumberSystems/RealNumbers/Constructions/Computable/Instances.lean
-- Registration into the system's interface.

import LRA.NumberSystems.RealNumbers.Constructions.Computable.Behavior

namespace LRA.NumberSystems.RealNumbers.Computable
open LRA.NumberSystems.Models

/-!
New content: the source never registered `ComputableReal rational_model`
as an instance of `LRA.NumberSystems.Models.RealModel`, the generic
complete-ordered-field interface this construction realizes. Assembling
the instance from the (mostly `sorry`) closure and countability facts
above is itself new work under this migration's policy, so it is stated
whole, `sorry`, rather than composed field-by-field without a toolchain to
check the composition. Tracked in `RealNumbers/ProofOrder.md`.
-/

/-- `ComputableReal rational_model` realizes the generic complete
ordered-field `RealModel` interface.

Logical form:

```lean
noncomputable def ComputableRealizesRealModel
    (rational_model : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Models.RealModel
```
-/
noncomputable def ComputableRealizesRealModel
    (rational_model : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Models.RealModel := by
  sorry

end LRA.NumberSystems.RealNumbers.Computable
