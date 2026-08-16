-- LRA/VolumeI/AlgebraicStructures/MathlibAdapters.lean
-- Reverse adapters: assemble Mathlib's bundled classes from certificates.

import Mathlib.Algebra.Field.Defs
import Mathlib.Order.Defs.LinearOrder
import LRA.VolumeI.AlgebraicStructures.Bundles
import LRA.VolumeI.AlgebraicStructures.MathlibBridge

namespace LRA.AlgebraicStructures

universe u

/-!
Reverse adapters: project certificates → Mathlib bundled classes.

The forward bridge (`MathlibBridge.lean`) certifies every Mathlib
carrier automatically. These adapters point the other way: a *project*
carrier whose certificates are proved can borrow Mathlib's bundled
classes — and with them `ring`, `linarith`, and the whole lemma
library.

They are **`def`s, never instances**, for two reasons. Automatic
instances here would loop with the forward bridge (certificate ↔
bundled class, forever). And a Mathlib structure assembled over
sorry-backed certificates should be a *deliberate* act at the use
site, not something instance search performs silently. Opt in locally:

```
letI : CommRing Z := toMathlibCommRing Z
example (a b : Z) : (a + b) * (a + b) = a*a + 2*(a*b) + b*b := by ring
```

Mathlib's `Ring` bundles `natCast`/`intCast`/`nsmul`/`zsmul`/`npow`
data; the adapters take the default implementations (`Nat.unaryCast`,
`nsmulRec`, ...), which is exactly right for a carrier that never
declared its own casts.
-/

/-- Assemble Mathlib's `CommRing` from the project certificates.

Logical form:

```lean
def toMathlibCommRing (R : Type u)
    [Add R] [Mul R] [Neg R] [Sub R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] [SubtractionCompatibilityLaw R] :
    CommRing R where
  add
```
-/
@[reducible] def toMathlibCommRing (R : Type u)
    [Add R] [Mul R] [Neg R] [Sub R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] [SubtractionCompatibilityLaw R] :
    CommRing R where
  add := (· + ·)
  add_assoc := AddAssociative
  zero := 0
  zero_add := ZeroAdd
  add_zero := AddZero
  nsmul := nsmulRec
  neg := (- ·)
  sub := (· - ·)
  sub_eq_add_neg := SubEqAddNeg
  zsmul := zsmulRec
  neg_add_cancel := NegAddCancel
  add_comm := AddCommutative
  mul := (· * ·)
  left_distrib := LeftDistributive
  right_distrib := RightDistributive
  zero_mul := ZeroMul
  mul_zero := MulZero
  mul_assoc := MulAssociative
  one := 1
  one_mul := OneMul
  mul_one := MulOne
  npow := npowRec
  mul_comm := MulCommutative

/-- Assemble Mathlib's `Field` from the project certificates.

Logical form:

```lean
noncomputable def toMathlibField (R : Type u)
    [Add R] [Mul R] [Neg R] [Sub R] [Inv R] [Div R]
    [OfNat R 0] [OfNat R 1]
    [FieldLaws R] [SubtractionCompatibilityLaw R]
    [DivisionCompatibilityLaw R] : Field R
```
-/
@[reducible] noncomputable def toMathlibField (R : Type u)
    [Add R] [Mul R] [Neg R] [Sub R] [Inv R] [Div R]
    [OfNat R 0] [OfNat R 1]
    [FieldLaws R] [SubtractionCompatibilityLaw R]
    [DivisionCompatibilityLaw R] : Field R :=
  have inverse_cancels : ∀ a : R, a ≠ 0 → a * a⁻¹ = 1 := MulInvCancel
  have inverse_of_zero : (0 : R)⁻¹ = 0 := InvZero
  have division_compatible : ∀ a b : R, a / b = a * b⁻¹ := DivEqMulInv
  have one_is_not_zero : (1 : R) ≠ 0 := OneNeZero
  { toMathlibCommRing R with
    inv := (·⁻¹)
    div := (· / ·)
    div_eq_mul_inv := division_compatible
    zpow := zpowRec
    exists_pair_ne := ⟨1, 0, one_is_not_zero⟩
    mul_inv_cancel := inverse_cancels
    inv_zero := inverse_of_zero
    nnqsmul := _
    qsmul := _ }

/-- Assemble Mathlib's `LinearOrder` from the project certificates
(classical decidability).

Logical form:

```lean
noncomputable def toMathlibLinearOrder (R : Type u) [LT R] [LE R]
    [LinearOrderLaws R] [StrictOrderCompatibilityLaw R] :
    LinearOrder R where
  le := (· ≤ ·)
  lt := (· < ·)
  le_refl := LeRefl
  le_trans := LeTrans
  lt_iff_le_not_ge := LtIffLeNotLe
  le_antisymm := LeAntisymm
  le_total := LeTotal
  toDecidableLE := Classical.decRel _
```
-/
@[reducible] noncomputable def toMathlibLinearOrder (R : Type u) [LT R] [LE R]
    [LinearOrderLaws R] [StrictOrderCompatibilityLaw R] :
    LinearOrder R where
  le := (· ≤ ·)
  lt := (· < ·)
  le_refl := LeRefl
  le_trans := LeTrans
  lt_iff_le_not_ge := LtIffLeNotLe
  le_antisymm := LeAntisymm
  le_total := LeTotal
  toDecidableLE := Classical.decRel _

/-! ## Smoke test: Mathlib automation on a certificate-carrying carrier

The adapters must at minimum assemble for a Mathlib carrier's own
certificates (round trip through the forward bridge). -/

example : CommRing Int := toMathlibCommRing Int
noncomputable example : Field Rat := toMathlibField Rat
noncomputable example : LinearOrder Int := toMathlibLinearOrder Int

end LRA.AlgebraicStructures
