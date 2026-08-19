-- LRA/NumberSystems/RealNumbers/Interop/Mathlib/Extended.lean
-- Bridge between the project's generic ExtendedReal and Mathlib's EReal,
-- instantiated at mathlibRealModel.

import Mathlib.Data.EReal.Basic
import LRA.NumberSystems.RealNumbers.Extended
import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.RealNumbers.Interop.Mathlib

open LRA.NumberSystems.Models
open LRA.NumberSystems.RealNumbers.Extended

/-!
Quarantine note: this file is reachable only through the `LRAAll`
full-coverage target (per `lakefile.lean`'s `Interop` carve-out), never
through `LRA.NumberSystems.RealNumbers`'s own router. It exists to be
compiled and to record the bridge statement, not to be a dependency of any
core route. `ExtendedReal mathlibRealModel` is already Mathlib-carrier-backed
by construction (`mathlibRealModel := RealModel.ofCarrier Real`); this file's
job is only to relate that instantiation to Mathlib's own, independently
defined `EReal` type, so a consumer already working in `EReal` has an
explicit transport lemma instead of needing to re-derive one.

Import path note: `Mathlib.Data.EReal.Basic` is this session's best guess
for the pinned Mathlib version's `EReal` location; if the pinned version
places it elsewhere (e.g. `Mathlib.Data.Real.EReal`), only this import
line needs correcting -- nothing else in the file depends on the choice.
-/

/-- `ExtendedReal mathlibRealModel` and Mathlib's `EReal` carry the same
information: a bijection between them that respects the order on each
side (`negativeInfinity`/`positiveInfinity` correspond, and `finite`
values correspond exactly when their underlying reals do).

*Proof status:* proof pending

Logical form:

```lean
theorem ExtendedRealMathlibBridgeExists :
    ∃ toEReal : ExtendedReal mathlibRealModel → EReal,
    ∃ fromEReal : EReal → ExtendedReal mathlibRealModel,
      (∀ value, fromEReal (toEReal value) = value) ∧
      (∀ value, toEReal (fromEReal value) = value) ∧
      (∀ first second,
        nonstrict_order mathlibRealModel first second ↔
          toEReal first ≤ toEReal second)
```
-/
theorem ExtendedRealMathlibBridgeExists :
    ∃ toEReal : ExtendedReal mathlibRealModel → EReal,
    ∃ fromEReal : EReal → ExtendedReal mathlibRealModel,
      (∀ value, fromEReal (toEReal value) = value) ∧
      (∀ value, toEReal (fromEReal value) = value) ∧
      (∀ first second,
        nonstrict_order mathlibRealModel first second ↔
          toEReal first ≤ toEReal second) := by
  sorry

end LRA.NumberSystems.RealNumbers.Interop.Mathlib
