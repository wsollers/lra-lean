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


/-- Active natural-number carrier.

Mathematical statement (Lean): `abbrev N`.
-/
abbrev N := Nat


/-- Active natural-number ordered-semiring operation bundle.

Mathematical statement (Lean): `def orderedSemiringSignature : OrderedSemiringSignature`.
-/
def orderedSemiringSignature : OrderedSemiringSignature where
  carrier := N
  zero := 0
  one := 1
  addition := Nat.add
  multiplication := Nat.mul
  strict_order := fun left right => left < right
  nonstrict_order := fun left right => left <= right


/-- Active natural numbers as a first-order model of `(0, 1, +, *, <)`.

Mathematical statement (Lean): `def orderedSemiringModel : LRA.VolumeI.Logic.FirstOrder.Model LRA.VolumeI.Algebra.Models.orderedSemiringSignature`.
-/
def orderedSemiringModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.orderedSemiringSignature :=
  LRA.VolumeI.Algebra.Models.orderedSemiringModel orderedSemiringSignature

end NaturalNumbers

namespace WholeNumbers


/-- Active whole-number carrier. Mathlib represents whole numbers as `Nat`.

Mathematical statement (Lean): `abbrev W`.
-/
abbrev W := Nat


/-- Active whole-number ordered-semiring operation bundle.

Mathematical statement (Lean): `def orderedSemiringSignature : OrderedSemiringSignature`.
-/
def orderedSemiringSignature : OrderedSemiringSignature where
  carrier := W
  zero := 0
  one := 1
  addition := Nat.add
  multiplication := Nat.mul
  strict_order := fun left right => left < right
  nonstrict_order := fun left right => left <= right


/-- Active whole numbers as a first-order model of `(0, 1, +, *, <)`.

Mathematical statement (Lean): `def orderedSemiringModel : LRA.VolumeI.Logic.FirstOrder.Model LRA.VolumeI.Algebra.Models.orderedSemiringSignature`.
-/
def orderedSemiringModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.orderedSemiringSignature :=
  LRA.VolumeI.Algebra.Models.orderedSemiringModel orderedSemiringSignature

end WholeNumbers

namespace IntegerNumbers


/-- Active integer carrier.

Mathematical statement (Lean): `abbrev Z`.
-/
abbrev Z := Int


/-- Active integer ordered-ring operation bundle.

Mathematical statement (Lean): `def orderedRingSignature : OrderedRingSignature`.
-/
def orderedRingSignature : OrderedRingSignature where
  carrier := Z
  zero := 0
  one := 1
  addition := Int.add
  negation := Int.neg
  multiplication := Int.mul
  strict_order := fun left right => left < right
  nonstrict_order := fun left right => left <= right


/-- Active integers as a first-order model of `(0, 1, +, *, -, <)`.

Mathematical statement (Lean): `def orderedRingModel : LRA.VolumeI.Logic.FirstOrder.Model LRA.VolumeI.Algebra.Models.orderedRingSignature`.
-/
def orderedRingModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.orderedRingSignature :=
  LRA.VolumeI.Algebra.Models.orderedRingModel orderedRingSignature


/-- Active integers in the additive ordered language `(0, 1, +, <)`.

Mathematical statement (Lean): `def additiveOrderedSignature : AdditiveOrderedSignature`.
-/
def additiveOrderedSignature : AdditiveOrderedSignature where
  carrier := Z
  zero := 0
  one := 1
  addition := Int.add
  strict_order := fun left right => left < right
  nonstrict_order := fun left right => left <= right


/-- Active integers as a first-order model of `(0, 1, +, <)`.

Mathematical statement (Lean): `def additiveOrderedModel : LRA.VolumeI.Logic.FirstOrder.Model LRA.VolumeI.Algebra.Models.additiveOrderedSignature`.
-/
def additiveOrderedModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.additiveOrderedSignature :=
  LRA.VolumeI.Algebra.Models.additiveOrderedModel additiveOrderedSignature


/-- Active integers in the arithmetic ring language `(0, 1, +, *)`.

Mathematical statement (Lean): `def arithmeticRingSignature : ArithmeticRingSignature`.
-/
def arithmeticRingSignature : ArithmeticRingSignature where
  carrier := Z
  zero := 0
  one := 1
  addition := Int.add
  multiplication := Int.mul


/-- Active integers as a first-order model of `(0, 1, +, *)`.

Mathematical statement (Lean): `def arithmeticRingModel : LRA.VolumeI.Logic.FirstOrder.Model LRA.VolumeI.Algebra.Models.arithmeticRingSignature`.
-/
def arithmeticRingModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.arithmeticRingSignature :=
  LRA.VolumeI.Algebra.Models.arithmeticRingModel arithmeticRingSignature


/-- Mathlib integers satisfy the generic integer-model laws.

Mathematical statement (Lean): `theorem integerLaws : LRA.VolumeI.Algebra.Models.IntegerLaws orderedRingSignature`.

*Proof status:* proof pending
-/
theorem integerLaws :
    LRA.VolumeI.Algebra.Models.IntegerLaws orderedRingSignature := by
  sorry


/-- Active bundled integer model for the number-system tower.

Mathematical statement (Lean): `def integerModel : LRA.VolumeI.Algebra.Models.IntegerModel`.
-/
def integerModel : LRA.VolumeI.Algebra.Models.IntegerModel where
  signature := orderedRingSignature
  laws := integerLaws

end IntegerNumbers

namespace RationalNumbers


/-- Active rational-number carrier.

Mathematical statement (Lean): `abbrev Q`.
-/
abbrev Q := Rat


/-- Active rational-number ordered-field operation bundle.

Mathematical statement (Lean): `def orderedFieldSignature : OrderedFieldSignature`.
-/
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


/-- Active rationals as a first-order model of `(0, 1, +, *, -, inv, <)`.

Mathematical statement (Lean): `def orderedFieldModel : LRA.VolumeI.Logic.FirstOrder.Model LRA.VolumeI.Algebra.Models.orderedFieldSignature`.
-/
def orderedFieldModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.orderedFieldSignature :=
  LRA.VolumeI.Algebra.Models.orderedFieldModel orderedFieldSignature


/-- Mathlib rationals satisfy the generic rational-model laws.

Mathematical statement (Lean): `theorem rationalLaws : LRA.VolumeI.Algebra.Models.RationalLaws orderedFieldSignature`.

*Proof status:* proof pending
-/
theorem rationalLaws :
    LRA.VolumeI.Algebra.Models.RationalLaws orderedFieldSignature := by
  sorry


/-- Active bundled rational model.

Mathematical statement (Lean): `def rationalModel : LRA.VolumeI.Algebra.Models.RationalModel`.
-/
def rationalModel : LRA.VolumeI.Algebra.Models.RationalModel where
  signature := orderedFieldSignature
  laws := rationalLaws

end RationalNumbers

namespace RealNumbers


/-- Active real-number carrier.

Mathematical statement (Lean): `abbrev R`.
-/
abbrev R := Real


/-- Active real-number ordered-field operation bundle.

Mathematical statement (Lean): `noncomputable def orderedFieldSignature : OrderedFieldSignature`.
-/
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


/-- Active reals as a first-order model of `(0, 1, +, *, -, inv, <)`.

Mathematical statement (Lean): `noncomputable def orderedFieldModel : LRA.VolumeI.Logic.FirstOrder.Model LRA.VolumeI.Algebra.Models.orderedFieldSignature`.
-/
noncomputable def orderedFieldModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.orderedFieldSignature :=
  LRA.VolumeI.Algebra.Models.orderedFieldModel orderedFieldSignature


/-- Mathlib reals satisfy the generic real-model laws.

Mathematical statement (Lean): `theorem realLaws : LRA.VolumeI.Algebra.Models.RealLaws orderedFieldSignature`.

*Proof status:* proof pending
-/
theorem realLaws :
    LRA.VolumeI.Algebra.Models.RealLaws orderedFieldSignature := by
  sorry


/-- Active bundled real model.

Mathematical statement (Lean): `noncomputable def realModel : LRA.VolumeI.Algebra.Models.RealModel`.
-/
noncomputable def realModel : LRA.VolumeI.Algebra.Models.RealModel where
  signature := orderedFieldSignature
  laws := realLaws

end RealNumbers

namespace ComplexNumbers


/-- Active complex-number carrier.

Mathematical statement (Lean): `abbrev C`.
-/
abbrev C := Complex


/-- Active complex-number field operation bundle.

Mathematical statement (Lean): `noncomputable def fieldSignature : FieldSignature`.
-/
noncomputable def fieldSignature : FieldSignature where
  carrier := C
  zero := 0
  one := 1
  addition := HAdd.hAdd
  negation := Neg.neg
  multiplication := HMul.hMul
  inverse := Inv.inv


/-- Active complex numbers as a first-order model of `(0, 1, +, *, -, inv)`.

Mathematical statement (Lean): `noncomputable def fieldModel : LRA.VolumeI.Logic.FirstOrder.Model LRA.VolumeI.Algebra.Models.fieldSignature`.
-/
noncomputable def fieldModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.fieldSignature :=
  LRA.VolumeI.Algebra.Models.fieldModel fieldSignature

end ComplexNumbers

end NumberSystems
end Switches
end VolumeII
end LRA
