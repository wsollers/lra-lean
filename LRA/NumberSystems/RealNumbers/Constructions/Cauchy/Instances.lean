-- LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Instances.lean
-- Registration into the system's interface.

import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.Behavior

namespace LRA.NumberSystems.RealNumbers.Cauchy
open LRA.NumberSystems.Models

/-!
New content: the source never registered `Carrier rational_model
absolute_value_data` as an instance of `LRA.NumberSystems.Models.RealModel`,
the generic complete-ordered-field interface this construction realizes.
Assembling the instance from the (mostly `sorry`) representative-level
facts above is itself new work under this migration's policy, so it is
stated whole, `sorry`, rather than composed field-by-field without a
toolchain to check the composition. Tracked in `RealNumbers/ProofOrder.md`.
-/

/-- `Carrier rational_model absolute_value_data` realizes the generic
complete ordered-field `RealModel` interface.

Logical form:

```lean
noncomputable def CauchyRealizesRealModel
    (rational_model : RationalModel)
    (absolute_value_data : RationalMetricData rational_model) :
    LRA.NumberSystems.Models.RealModel
```
-/
noncomputable def CauchyRealizesRealModel
    (rational_model : RationalModel)
    (absolute_value_data : RationalMetricData rational_model) :
    LRA.NumberSystems.Models.RealModel := by
  sorry

end LRA.NumberSystems.RealNumbers.Cauchy
