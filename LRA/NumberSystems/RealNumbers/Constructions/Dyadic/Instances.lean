-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Instances.lean
-- Registration of canonical binary expansions as a real-number
-- representation.

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Behavior

namespace LRA.NumberSystems.RealNumbers.Dyadic

open LRA.NumberSystems.Models

/-- The canonical signed-binary expansion carrier admits a `RealModel`
structure on exactly `Expansion`, transported across `BinaryRealBijection` from
the selected Cauchy-real carrier.

The carrier equality prevents a detached realization in which an unrelated
complete ordered field could witness the theorem.

Logical form:

```lean
theorem DyadicExpansionRealModelExists
    (dyadicData : RationalDyadicApproximationData) :
    ∃ realModel : LRA.NumberSystems.Models.RealModel,
      realModel.Carrier = Expansion
```
-/
theorem DyadicExpansionRealModelExists
    (dyadicData : RationalDyadicApproximationData) :
    ∃ realModel : LRA.NumberSystems.Models.RealModel,
      realModel.Carrier = Expansion := by
  sorry

end LRA.NumberSystems.RealNumbers.Dyadic
