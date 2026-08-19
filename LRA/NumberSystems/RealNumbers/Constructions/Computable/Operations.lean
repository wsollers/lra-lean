-- LRA/NumberSystems/RealNumbers/Constructions/Computable/Operations.lean
-- Placeholder pipeline stage: the source defines no concrete arithmetic
-- operations on `ComputableReal`.

import LRA.NumberSystems.RealNumbers.Constructions.Computable.WellFoundedness

namespace LRA.NumberSystems.RealNumbers.Computable

/-!
`LRA/VolumeII/RealNumbers/Computable.lean` never defines concrete
addition, negation, or multiplication functions on `ComputableReal
rational_model`. It only asserts, via
`computable_reals_closed_under_arithmetic` (moved to `Behavior.lean`),
that such operations exist. Since no operation is actually constructed in
the source, nothing is moved or invented here. This file is therefore a
deliberate placeholder, present so `WellDefinedness.lean` has a stage to
import per §1.6.1. See `RealNumbers/ProofOrder.md`.
-/

end LRA.NumberSystems.RealNumbers.Computable
