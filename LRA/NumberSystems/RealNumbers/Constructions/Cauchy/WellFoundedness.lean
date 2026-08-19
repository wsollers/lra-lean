-- LRA/NumberSystems/RealNumbers/Constructions/Cauchy/WellFoundedness.lean
-- The induction principle the quotient carrier supports.

import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.Equivalence

namespace LRA.NumberSystems.RealNumbers.Cauchy
open LRA.NumberSystems.Models

/-!
New content: the source never stated the induction/recursion principle this
pipeline stage calls for. Every class of `Carrier rational_model
absolute_value_data` has a representative Cauchy sequence, so a predicate
holds everywhere once it holds of every representative's image; stated
here, `sorry`, per this migration's policy of never completing a proof it
did not already carry. Tracked in `RealNumbers/ProofOrder.md`.
-/

/-- Every Cauchy real class in this construction is the class of some Cauchy
representative: induction on representatives suffices to prove a predicate
everywhere.

Logical form:

```lean
theorem InductionOnRepresentatives
    (rational_model : RationalModel)
    (absolute_value_data : RationalMetricData rational_model)
    (motive : Carrier rational_model absolute_value_data → Prop)
    (onRepresentative :
      ∀ representative : Representative rational_model absolute_value_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier rational_model absolute_value_data, motive value
```
-/
theorem InductionOnRepresentatives
    (rational_model : RationalModel)
    (absolute_value_data : RationalMetricData rational_model)
    (motive : Carrier rational_model absolute_value_data → Prop)
    (onRepresentative :
      ∀ representative : Representative rational_model absolute_value_data,
        motive (Quotient.mk _ representative)) :
    ∀ value : Carrier rational_model absolute_value_data, motive value := by
  sorry

end LRA.NumberSystems.RealNumbers.Cauchy
