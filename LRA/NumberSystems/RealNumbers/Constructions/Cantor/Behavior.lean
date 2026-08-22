-- LRA/NumberSystems/RealNumbers/Constructions/Cantor/Behavior.lean
-- Comparison theorem: an injective correspondence from Cantor reals to
-- Cauchy reals over the same rational model.

import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Laws
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Models

/--
**[Theorem — cantor_reals_are_isomorphic_to_cauchy_reals]**

Mathematical statement (Lean): `theorem cantor_reals_are_isomorphic_to_cauchy_reals (rational_model : DenselyOrderedFieldModel) (metric_data : Cauchy.RationalMetricData rational_model) : ∃ comparison : Carrier rational_model → Cauchy.Carrier rational_model metric_data, ∀ first second, comparison fir...`.

*Proof status:* proof pending


Logical form:

```lean
theorem cantor_reals_are_isomorphic_to_cauchy_reals
    (rational_model : DenselyOrderedFieldModel)
    (metric_data : Cauchy.RationalMetricData rational_model) :
    ∃ comparison :
      Carrier rational_model → Cauchy.Carrier rational_model metric_data,
      ∀ first second,
        comparison first = comparison second → first = second
```
-/
theorem cantor_reals_are_isomorphic_to_cauchy_reals
    (rational_model : DenselyOrderedFieldModel)
    (metric_data : Cauchy.RationalMetricData rational_model) :
    ∃ comparison :
      Carrier rational_model → Cauchy.Carrier rational_model metric_data,
      ∀ first second,
        comparison first = comparison second → first = second := by
  sorry

end LRA.NumberSystems.RealNumbers.Cantor
