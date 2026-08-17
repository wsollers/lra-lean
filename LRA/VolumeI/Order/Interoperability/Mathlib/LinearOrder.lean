import Mathlib.Order.Defs.LinearOrder
import LRA.VolumeI.Order.Interoperability.Mathlib.Certificates

namespace LRA.Interop.Mathlib.Order

open LRA.Order

universe u

/-!
Reverse adapter from LRA order certificates to Mathlib's bundled
`LinearOrder`. It is deliberately a definition, not an instance.
-/

@[reducible] noncomputable def toMathlibLinearOrder
    (R : Type u) [LT R] [LE R]
    [LinearOrderLaws R] [StrictOrderCompatibilityLaw R] :
    LinearOrder R where
  le := (· ≤ ·)
  lt := (· < ·)
  le_refl := LeRefl
  le_trans := LeTrans
  lt_iff_le_not_ge := LtIffLeNotLe
  le_antisymm := LeAntisymm
  le_total := LeTotal
  toDecidableLE := by
    classical
    infer_instance

noncomputable example : LinearOrder Int := toMathlibLinearOrder Int

end LRA.Interop.Mathlib.Order
