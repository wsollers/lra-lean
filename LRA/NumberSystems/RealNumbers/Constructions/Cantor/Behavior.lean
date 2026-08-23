-- LRA/NumberSystems/RealNumbers/Constructions/Cantor/Behavior.lean
-- Comparison theorem: a bijective correspondence from Cantor reals to
-- Cauchy reals over the same rational model.

import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Laws
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy
import LRA.Function.Properties.Definition
import LRA.NumberSystems.RationalNumbers.Definition

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Models
open LRA.NumberSystems.RationalNumbers

/--
**[Theorem — cantor_reals_are_isomorphic_to_cauchy_reals]**

Mathematical statement (Lean): `theorem cantor_reals_are_isomorphic_to_cauchy_reals (rationalSystem : RationalNumberSystem) (metric_data : Cauchy.RationalMetricData rationalSystem) : ∃ comparison : Carrier rationalSystem.FieldModel → Cauchy.Carrier rationalSystem metric_data, LRA.Function.Bijective comparison`.

*Proof status:* proof pending


Logical form:

```lean
theorem cantor_reals_are_isomorphic_to_cauchy_reals
    (rationalSystem : RationalNumberSystem)
    (metric_data : Cauchy.RationalMetricData rationalSystem) :
    ∃ comparison :
      Carrier rationalSystem.FieldModel →
        Cauchy.Carrier rationalSystem metric_data,
      LRA.Function.Bijective comparison
```
-/
theorem cantor_reals_are_isomorphic_to_cauchy_reals
    (rationalSystem : RationalNumberSystem)
    (metric_data : Cauchy.RationalMetricData rationalSystem) :
    ∃ comparison :
      Carrier rationalSystem.FieldModel →
        Cauchy.Carrier rationalSystem metric_data,
      LRA.Function.Bijective comparison := by
  sorry

end LRA.NumberSystems.RealNumbers.Cantor
