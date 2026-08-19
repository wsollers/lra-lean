-- LRA/NumberSystems/RealNumbers/Interop/Mathlib/NonNegative.lean
-- Bridge between the project's generic NonNegativeReal/NonNegativeExtendedReal
-- and Mathlib's NNReal/ENNReal, instantiated at mathlibRealModel.

import Mathlib.Data.NNReal.Basic
import Mathlib.Data.ENNReal.Basic
import LRA.NumberSystems.RealNumbers.NonNegative
import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.RealNumbers.Interop.Mathlib

open LRA.NumberSystems.Models
open LRA.NumberSystems.RealNumbers.NonNegative

/-!
Quarantine note: this file is reachable only through the `LRAAll`
full-coverage target, never through `LRA.NumberSystems.RealNumbers`'s own
router -- see `Interop/Mathlib/Extended.lean` for the same note in full.

Import path note: `Mathlib.Data.NNReal.Basic` / `Mathlib.Data.ENNReal.Basic`
are this session's best guesses for the pinned Mathlib version's locations
(older Mathlib versions used `Mathlib.Data.Real.NNReal` /
`Mathlib.Data.Real.ENNReal`); if the pinned version disagrees, only these
import lines need correcting.
-/

/-- `NonNegativeReal mathlibRealModel` and Mathlib's `NNReal` carry the
same information: an order- and addition-preserving bijection between
them.

*Proof status:* proof pending

Logical form:

```lean
theorem NonNegativeRealMathlibBridgeExists :
    ∃ toNNReal : NonNegativeReal mathlibRealModel → NNReal,
    ∃ fromNNReal : NNReal → NonNegativeReal mathlibRealModel,
      (∀ value, fromNNReal (toNNReal value) = value) ∧
      (∀ value, toNNReal (fromNNReal value) = value) ∧
      (∀ first second, le mathlibRealModel first second ↔
        toNNReal first ≤ toNNReal second) ∧
      (∀ first second,
        toNNReal (add mathlibRealModel first second) =
          toNNReal first + toNNReal second)
```
-/
theorem NonNegativeRealMathlibBridgeExists :
    ∃ toNNReal : NonNegativeReal mathlibRealModel → NNReal,
    ∃ fromNNReal : NNReal → NonNegativeReal mathlibRealModel,
      (∀ value, fromNNReal (toNNReal value) = value) ∧
      (∀ value, toNNReal (fromNNReal value) = value) ∧
      (∀ first second, le mathlibRealModel first second ↔
        toNNReal first ≤ toNNReal second) ∧
      (∀ first second,
        toNNReal (add mathlibRealModel first second) =
          toNNReal first + toNNReal second) := by
  sorry

/-- `NonNegativeExtendedReal mathlibRealModel` and Mathlib's `ENNReal`
carry the same information: an order- and addition-preserving bijection
between them.

*Proof status:* proof pending

Logical form:

```lean
theorem NonNegativeExtendedRealMathlibBridgeExists :
    ∃ toENNReal : NonNegativeExtendedReal mathlibRealModel → ENNReal,
    ∃ fromENNReal : ENNReal → NonNegativeExtendedReal mathlibRealModel,
      (∀ value, fromENNReal (toENNReal value) = value) ∧
      (∀ value, toENNReal (fromENNReal value) = value) ∧
      (∀ first second, leExtended mathlibRealModel first second ↔
        toENNReal first ≤ toENNReal second) ∧
      (∀ first second,
        toENNReal (addExtended mathlibRealModel first second) =
          toENNReal first + toENNReal second)
```
-/
theorem NonNegativeExtendedRealMathlibBridgeExists :
    ∃ toENNReal : NonNegativeExtendedReal mathlibRealModel → ENNReal,
    ∃ fromENNReal : ENNReal → NonNegativeExtendedReal mathlibRealModel,
      (∀ value, fromENNReal (toENNReal value) = value) ∧
      (∀ value, toENNReal (fromENNReal value) = value) ∧
      (∀ first second, leExtended mathlibRealModel first second ↔
        toENNReal first ≤ toENNReal second) ∧
      (∀ first second,
        toENNReal (addExtended mathlibRealModel first second) =
          toENNReal first + toENNReal second) := by
  sorry

end LRA.NumberSystems.RealNumbers.Interop.Mathlib
