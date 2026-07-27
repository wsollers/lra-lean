-- LRA/VolumeII/Switches/NumberSystems.lean
-- Active Mathlib-backed number-system switches.

import Mathlib.Data.Nat.Basic
import Mathlib.Data.Int.Basic
import Mathlib.Data.Rat.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Complex.Basic
import LRA.VolumeI.Algebra.Models

namespace LRA
namespace VolumeII
namespace Switches
namespace NumberSystems

open LRA.VolumeI.Algebra.Models

/-!
Volume II label: active-number-system-switches
Lean module: LRA.VolumeII.Switches.NumberSystems
Verification status: definitions accepted; law proofs pending

The active switches use Mathlib's canonical number-system carriers for ordinary
proof work. The project-owned constructions remain available in their own
modules for examples, construction work, and comparison tests.
-/

namespace NaturalNumbers

/-- Active natural-number carrier. -/
abbrev N := Nat

/-- Active natural-number ordered-semiring operation bundle. -/
def orderedSemiringSignature : OrderedSemiringSignature where
  carrier := N
  zero := 0
  one := 1
  addition := Nat.add
  multiplication := Nat.mul
  strict_order := fun left right => left < right
  nonstrict_order := fun left right => left <= right

/-- Active natural numbers as a first-order model of `(0, 1, +, *, <)`. -/
def orderedSemiringModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.orderedSemiringSignature :=
  LRA.VolumeI.Algebra.Models.orderedSemiringModel orderedSemiringSignature

end NaturalNumbers

namespace WholeNumbers

/-- Active whole-number carrier. Mathlib represents whole numbers as `Nat`. -/
abbrev W := Nat

/-- Active whole-number ordered-semiring operation bundle. -/
def orderedSemiringSignature : OrderedSemiringSignature where
  carrier := W
  zero := 0
  one := 1
  addition := Nat.add
  multiplication := Nat.mul
  strict_order := fun left right => left < right
  nonstrict_order := fun left right => left <= right

/-- Active whole numbers as a first-order model of `(0, 1, +, *, <)`. -/
def orderedSemiringModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.orderedSemiringSignature :=
  LRA.VolumeI.Algebra.Models.orderedSemiringModel orderedSemiringSignature

end WholeNumbers

namespace IntegerNumbers

/-- Active integer carrier. -/
abbrev Z := Int

/-- Active integer ordered-ring operation bundle. -/
def orderedRingSignature : OrderedRingSignature where
  carrier := Z
  zero := 0
  one := 1
  addition := Int.add
  negation := Int.neg
  multiplication := Int.mul
  strict_order := fun left right => left < right
  nonstrict_order := fun left right => left <= right

/-- Active integers as a first-order model of `(0, 1, +, *, -, <)`. -/
def orderedRingModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.orderedRingSignature :=
  LRA.VolumeI.Algebra.Models.orderedRingModel orderedRingSignature

/-- Active integers in the additive ordered language `(0, 1, +, <)`. -/
def additiveOrderedSignature : AdditiveOrderedSignature where
  carrier := Z
  zero := 0
  one := 1
  addition := Int.add
  strict_order := fun left right => left < right
  nonstrict_order := fun left right => left <= right

/-- Active integers as a first-order model of `(0, 1, +, <)`. -/
def additiveOrderedModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.additiveOrderedSignature :=
  LRA.VolumeI.Algebra.Models.additiveOrderedModel additiveOrderedSignature

/-- Active integers in the arithmetic ring language `(0, 1, +, *)`. -/
def arithmeticRingSignature : ArithmeticRingSignature where
  carrier := Z
  zero := 0
  one := 1
  addition := Int.add
  multiplication := Int.mul

/-- Active integers as a first-order model of `(0, 1, +, *)`. -/
def arithmeticRingModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.arithmeticRingSignature :=
  LRA.VolumeI.Algebra.Models.arithmeticRingModel arithmeticRingSignature

/-- Mathlib integers satisfy the generic integer-model laws. -/
theorem integerLaws :
    LRA.VolumeI.Algebra.Models.IntegerLaws orderedRingSignature := by
  sorry

/-- Active bundled integer model for the number-system tower. -/
def integerModel : LRA.VolumeI.Algebra.Models.IntegerModel where
  signature := orderedRingSignature
  laws := integerLaws

end IntegerNumbers

namespace RationalNumbers

/-- Active rational-number carrier. -/
abbrev Q := Rat

/-- Active rational-number ordered-field operation bundle. -/
def orderedFieldSignature : OrderedFieldSignature where
  carrier := Q
  zero := 0
  one := 1
  addition := Rat.add
  negation := Rat.neg
  multiplication := Rat.mul
  strict_order := fun left right => left < right
  nonstrict_order := fun left right => left <= right
  inverse := Inv.inv

/-- Active rationals as a first-order model of `(0, 1, +, *, -, inv, <)`. -/
def orderedFieldModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.orderedFieldSignature :=
  LRA.VolumeI.Algebra.Models.orderedFieldModel orderedFieldSignature

/-- Mathlib rationals satisfy the generic rational-model laws. -/
theorem rationalLaws :
    LRA.VolumeI.Algebra.Models.RationalLaws orderedFieldSignature := by
  sorry

/-- Active bundled rational model. -/
def rationalModel : LRA.VolumeI.Algebra.Models.RationalModel where
  signature := orderedFieldSignature
  laws := rationalLaws

end RationalNumbers

namespace RealNumbers

/-- Active real-number carrier. -/
abbrev R := Real

/-- Active real-number ordered-field operation bundle. -/
noncomputable def orderedFieldSignature : OrderedFieldSignature where
  carrier := R
  zero := 0
  one := 1
  addition := HAdd.hAdd
  negation := Neg.neg
  multiplication := HMul.hMul
  strict_order := fun left right => left < right
  nonstrict_order := fun left right => left <= right
  inverse := Inv.inv

/-- Active reals as a first-order model of `(0, 1, +, *, -, inv, <)`. -/
noncomputable def orderedFieldModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.orderedFieldSignature :=
  LRA.VolumeI.Algebra.Models.orderedFieldModel orderedFieldSignature

/-- Mathlib reals satisfy the generic real-model laws. -/
theorem realLaws :
    LRA.VolumeI.Algebra.Models.RealLaws orderedFieldSignature := by
  sorry

/-- Active bundled real model. -/
noncomputable def realModel : LRA.VolumeI.Algebra.Models.RealModel where
  signature := orderedFieldSignature
  laws := realLaws

end RealNumbers

namespace ComplexNumbers

/-- Active complex-number carrier. -/
abbrev C := Complex

/-- Active complex-number field operation bundle. -/
noncomputable def fieldSignature : FieldSignature where
  carrier := C
  zero := 0
  one := 1
  addition := HAdd.hAdd
  negation := Neg.neg
  multiplication := HMul.hMul
  inverse := Inv.inv

/-- Active complex numbers as a first-order model of `(0, 1, +, *, -, inv)`. -/
noncomputable def fieldModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.fieldSignature :=
  LRA.VolumeI.Algebra.Models.fieldModel fieldSignature

end ComplexNumbers

end NumberSystems
end Switches
end VolumeII
end LRA
