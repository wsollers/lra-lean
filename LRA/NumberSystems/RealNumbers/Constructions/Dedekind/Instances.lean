-- LRA/NumberSystems/RealNumbers/Constructions/Dedekind/Instances.lean
-- Registration of Dedekind cuts as a real-number construction.

import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Behavior

namespace LRA.NumberSystems.RealNumbers.Dedekind

open LRA.NumberSystems.Models
open LRA.NumberSystems.RationalNumbers

/-- Dedekind cuts over an actual rational number system admit a `RealModel`
structure on exactly the cut carrier.

The generic cut definitions may still be studied over a broader dense ordered
field. The claim that the construction realizes the real-number stage is
restricted to `RationalNumberSystem`, and the carrier equality prevents an
unrelated complete ordered field from serving as a detached witness.

Logical form:

```lean
theorem DedekindCarrierRealModelExists
    (rationalSystem : RationalNumberSystem) :
    ∃ realModel : LRA.NumberSystems.Models.RealModel,
      realModel.Carrier = Cut rationalSystem.FieldModel
```
-/
theorem DedekindCarrierRealModelExists
    (rationalSystem : RationalNumberSystem) :
    ∃ realModel : LRA.NumberSystems.Models.RealModel,
      realModel.Carrier = Cut rationalSystem.FieldModel := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
