-- LRA/NumberSystems/RealNumbers/Constructions/Dedekind/Instances.lean
-- Registration of Dedekind cuts as a real-number construction.

import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Behavior

namespace LRA.NumberSystems.RealNumbers.Dedekind

open LRA.NumberSystems.Models
open LRA.NumberSystems.RationalNumbers

/-- Dedekind cuts over an actual rational number system realize a carrier-tied
`RationalRealExtension`.

The generic cut definitions may still be studied over a broader dense ordered
field. The claim that the construction realizes the real-number stage is
restricted to `RationalNumberSystem`, and the carrier equality prevents an
unrelated complete ordered field from serving as the selected extension.

Logical form:

```lean
theorem DedekindRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier = Cut rationalSystem.FieldModel
```
-/
theorem DedekindRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier = Cut rationalSystem.FieldModel := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
