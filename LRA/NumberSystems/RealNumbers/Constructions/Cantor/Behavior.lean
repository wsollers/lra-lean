-- LRA/NumberSystems/RealNumbers/Constructions/Cantor/Behavior.lean
-- Comparison theorem: an injective correspondence from Cantor reals to
-- Cauchy reals over the same rational model.

import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Laws
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy
import LRA.NumberSystems.RationalNumbers.Definition

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Models
open LRA.NumberSystems.RationalNumbers

/--
**[Theorem — cantor_reals_are_isomorphic_to_cauchy_reals]**

Mathematical statement (Lean): `theorem cantor_reals_are_isomorphic_to_cauchy_reals (rationalSystem : RationalNumberSystem) (metric_data : Cauchy.RationalMetricData rationalSystem) : ∃ comparison : Carrier rationalSystem.FieldModel → Cauchy.Carrier rationalSystem metric_data, ∀ first second, comparison fir...`.

*Proof status:* proof pending


Logical form:

```lean
theorem cantor_reals_are_isomorphic_to_cauchy_reals
    (rationalSystem : RationalNumberSystem)
    (metric_data : Cauchy.RationalMetricData rationalSystem) :
    ∃ comparison :
      Carrier rationalSystem.FieldModel →
        Cauchy.Carrier rationalSystem metric_data,
      ∀ first second,
        comparison first = comparison second → first = second
```
-/
theorem cantor_reals_are_isomorphic_to_cauchy_reals
    (rationalSystem : RationalNumberSystem)
    (metric_data : Cauchy.RationalMetricData rationalSystem) :
    ∃ comparison :
      Carrier rationalSystem.FieldModel →
        Cauchy.Carrier rationalSystem metric_data,
      ∀ first second,
        comparison first = comparison second → first = second := by
  sorry

end LRA.NumberSystems.RealNumbers.Cantor
