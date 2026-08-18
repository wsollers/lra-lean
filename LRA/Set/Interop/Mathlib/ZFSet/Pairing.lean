-- LRA/VolumeI/Set/MathlibZFSet/Pairing.lean
-- Mathlib's Kuratowski pair as the ZFSet backend's pairing capability.

import Mathlib.SetTheory.ZFC.Basic
import LRA.Set.Interface.Pairing

namespace LRA.Set.MathlibZFSet

open LRA.Set

/-!
Volume I label: mathlib-zfset-pairing
Lean module: LRA.Set.MathlibZFSet.Pairing
Verification status: fully proved (Mathlib backend, zero sorry)

Mathlib's `ZFSet.pair` IS the Kuratowski pair (`{{x}, {x, y}}`), and
`ZFSet.pair_inj` IS Theorem 3A — so the registration is pure dispatch,
like the rest of this backend. High priority, so on `ZFSet` the
internal pair beats the default type-level product.
-/

/-- **[Instance — ZFSet pairing]** (Mathlib's Kuratowski pair).

Logical form:

```lean
noncomputable instance (priority := high) :
    HasPairing ZFSet ZFSet ZFSet :=
  ⟨ZFSet.pair⟩
```
-/
noncomputable instance (priority := high) :
    HasPairing ZFSet ZFSet ZFSet :=
  ⟨ZFSet.pair⟩

/-- **[Instance — ZFSet pairing laws]** (proved: `ZFSet.pair_inj`).

Logical form:

```lean
instance : PairingLaws ZFSet ZFSet ZFSet :=
  ⟨fun _ _ _ _ => ZFSet.pair_inj⟩
```
-/
instance : PairingLaws ZFSet ZFSet ZFSet :=
  ⟨fun _ _ _ _ => ZFSet.pair_inj⟩

end LRA.Set.MathlibZFSet
