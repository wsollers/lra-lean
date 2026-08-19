-- LRA/NumberSystems/RealNumbers/Constructions/Computable/WellFoundedness.lean
-- Placeholder pipeline stage: no induction/recursion principle is needed
-- beyond ordinary structure projection.

import LRA.NumberSystems.RealNumbers.Constructions.Computable.Equivalence

namespace LRA.NumberSystems.RealNumbers.Computable

/-!
`ComputableReal rational_model` is a plain one-field structure over
`EffectiveApproximation rational_model` (see `Carrier.lean`), not a
quotient type. Unlike the Cauchy-sequence construction's `Carrier
rational_model absolute_value_data`, which is a `Quotient` and therefore
needs an induction-on-representatives principle at this stage, a
computable real value is already given by its single `approximation`
field: `ComputableReal.rec`/`.approximation` project it directly, and no
additional well-foundedness content needs stating. This file is therefore
a deliberate placeholder, present so `Operations.lean` has a stage to
import per §1.6.1. See `RealNumbers/ProofOrder.md`.
-/

end LRA.NumberSystems.RealNumbers.Computable
