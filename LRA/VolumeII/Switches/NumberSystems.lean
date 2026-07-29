-- LRA/VolumeII/Switches/NumberSystems.lean
-- Active Mathlib-backed number-system switches.

import Mathlib.Data.Nat.Basic
import Mathlib.Data.Int.Basic
import Mathlib.Data.Rat.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Complex.Basic
import LRA.VolumeI.Algebra.Models

namespace LRA.VolumeII.Switches.NumberSystems

open LRA.VolumeI.Algebra.Models

/-!
Volume II label: active-number-system-switches
Lean module: LRA.VolumeII.Switches.NumberSystems
Verification status: definitions accepted; law proofs pending

The active switches use Mathlib's canonical number-system carriers for ordinary
proof work. The project-owned constructions remain available in their own
modules for examples, construction work, and comparison tests.
-/

end LRA.VolumeII.Switches.NumberSystems
namespace LRA.VolumeII.Switches.NumberSystems.NaturalNumbers
open LRA.VolumeI.Algebra.Models


/-- Active natural-number carrier.

Mathematical statement (Lean): `abbrev N`.
-/
abbrev N := Nat


/-- Active natural-number ordered-semiring operation bundle.

Mathematical statement (Lean): `def ActiveOrderedSemiringSignature : OrderedSemiringSignature`.
-/
def ActiveOrderedSemiringSignature : OrderedSemiringSignature where
  carrier := N
  zero := 0
  one := 1
  addition := Nat.add
  multiplication := Nat.mul
  StrictOrder := fun left right => left < right
  NonstrictOrder := fun left right => left <= right


/-- Active natural numbers as a first-order model of `(0, 1, +, *, <)`.

Mathematical statement (Lean): `def ActiveOrderedSemiringModel : LRA.VolumeI.Logic.FirstOrder.Model LRA.VolumeI.Algebra.Models.OrderedSemiringFirstOrderSignature`.
-/
def ActiveOrderedSemiringModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.OrderedSemiringFirstOrderSignature :=
  LRA.VolumeI.Algebra.Models.BuildOrderedSemiringModel ActiveOrderedSemiringSignature

end LRA.VolumeII.Switches.NumberSystems.NaturalNumbers
namespace LRA.VolumeII.Switches.NumberSystems
open LRA.VolumeI.Algebra.Models

end LRA.VolumeII.Switches.NumberSystems
namespace LRA.VolumeII.Switches.NumberSystems.WholeNumbers
open LRA.VolumeI.Algebra.Models


/-- Active whole-number carrier. Mathlib represents whole numbers as `Nat`.

Mathematical statement (Lean): `abbrev W`.
-/
abbrev W := Nat


/-- Active whole-number ordered-semiring operation bundle.

Mathematical statement (Lean): `def ActiveOrderedSemiringSignature : OrderedSemiringSignature`.
-/
def ActiveOrderedSemiringSignature : OrderedSemiringSignature where
  carrier := W
  zero := 0
  one := 1
  addition := Nat.add
  multiplication := Nat.mul
  StrictOrder := fun left right => left < right
  NonstrictOrder := fun left right => left <= right


/-- Active whole numbers as a first-order model of `(0, 1, +, *, <)`.

Mathematical statement (Lean): `def ActiveOrderedSemiringModel : LRA.VolumeI.Logic.FirstOrder.Model LRA.VolumeI.Algebra.Models.OrderedSemiringFirstOrderSignature`.
-/
def ActiveOrderedSemiringModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.OrderedSemiringFirstOrderSignature :=
  LRA.VolumeI.Algebra.Models.BuildOrderedSemiringModel ActiveOrderedSemiringSignature

end LRA.VolumeII.Switches.NumberSystems.WholeNumbers
namespace LRA.VolumeII.Switches.NumberSystems
open LRA.VolumeI.Algebra.Models

end LRA.VolumeII.Switches.NumberSystems
namespace LRA.VolumeII.Switches.NumberSystems.IntegerNumbers
open LRA.VolumeI.Algebra.Models


/-- Active integer carrier.

Mathematical statement (Lean): `abbrev Z`.
-/
abbrev Z := Int


/-- Active integer ordered-ring operation bundle.

Mathematical statement (Lean): `def ActiveOrderedRingSignature : OrderedRingSignature`.
-/
def ActiveOrderedRingSignature : OrderedRingSignature where
  carrier := Z
  zero := 0
  one := 1
  addition := Int.add
  negation := Int.neg
  multiplication := Int.mul
  StrictOrder := fun left right => left < right
  NonstrictOrder := fun left right => left <= right


/-- Active integers as a first-order model of `(0, 1, +, *, -, <)`.

Mathematical statement (Lean): `def ActiveOrderedRingModel : LRA.VolumeI.Logic.FirstOrder.Model LRA.VolumeI.Algebra.Models.OrderedRingFirstOrderSignature`.
-/
def ActiveOrderedRingModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.OrderedRingFirstOrderSignature :=
  LRA.VolumeI.Algebra.Models.BuildOrderedRingModel ActiveOrderedRingSignature


/-- Active integers in the additive ordered language `(0, 1, +, <)`.

Mathematical statement (Lean): `def ActiveAdditiveOrderedSignature : AdditiveOrderedSignature`.
-/
def ActiveAdditiveOrderedSignature : AdditiveOrderedSignature where
  carrier := Z
  zero := 0
  one := 1
  addition := Int.add
  StrictOrder := fun left right => left < right
  NonstrictOrder := fun left right => left <= right


/-- Active integers as a first-order model of `(0, 1, +, <)`.

Mathematical statement (Lean): `def ActiveAdditiveOrderedModel : LRA.VolumeI.Logic.FirstOrder.Model LRA.VolumeI.Algebra.Models.AdditiveOrderedFirstOrderSignature`.
-/
def ActiveAdditiveOrderedModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.AdditiveOrderedFirstOrderSignature :=
  LRA.VolumeI.Algebra.Models.BuildAdditiveOrderedModel ActiveAdditiveOrderedSignature


/-- Active integers in the arithmetic ring language `(0, 1, +, *)`.

Mathematical statement (Lean): `def ActiveArithmeticRingSignature : ArithmeticRingSignature`.
-/
def ActiveArithmeticRingSignature : ArithmeticRingSignature where
  carrier := Z
  zero := 0
  one := 1
  addition := Int.add
  multiplication := Int.mul


/-- Active integers as a first-order model of `(0, 1, +, *)`.

Mathematical statement (Lean): `def ActiveArithmeticRingModel : LRA.VolumeI.Logic.FirstOrder.Model LRA.VolumeI.Algebra.Models.ArithmeticRingFirstOrderSignature`.
-/
def ActiveArithmeticRingModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.ArithmeticRingFirstOrderSignature :=
  LRA.VolumeI.Algebra.Models.BuildArithmeticRingModel ActiveArithmeticRingSignature


/-- Mathlib integers satisfy the generic integer-model laws.

Mathematical statement (Lean): `theorem integerLaws : LRA.VolumeI.Algebra.Models.IntegerLaws ActiveOrderedRingSignature`.

*Proof status:* proof pending
-/
theorem integerLaws :
    LRA.VolumeI.Algebra.Models.IntegerLaws ActiveOrderedRingSignature := by
  sorry


/-- Active bundled integer model for the number-system tower.

Mathematical statement (Lean): `def integerModel : LRA.VolumeI.Algebra.Models.IntegerModel`.
-/
def integerModel : LRA.VolumeI.Algebra.Models.IntegerModel where
  signature := ActiveOrderedRingSignature
  laws := integerLaws

end LRA.VolumeII.Switches.NumberSystems.IntegerNumbers
namespace LRA.VolumeII.Switches.NumberSystems
open LRA.VolumeI.Algebra.Models

end LRA.VolumeII.Switches.NumberSystems
namespace LRA.VolumeII.Switches.NumberSystems.RationalNumbers
open LRA.VolumeI.Algebra.Models


/-- Active rational-number carrier.

Mathematical statement (Lean): `abbrev Q`.
-/
abbrev Q := Rat


/-- Active rational-number ordered-field operation bundle.

Mathematical statement (Lean): `def ActiveOrderedFieldSignature : OrderedFieldSignature`.
-/
def ActiveOrderedFieldSignature : OrderedFieldSignature where
  carrier := Q
  zero := 0
  one := 1
  addition := Rat.add
  negation := Rat.neg
  multiplication := Rat.mul
  StrictOrder := fun left right => left < right
  NonstrictOrder := fun left right => left <= right
  inverse := Inv.inv


/-- Active rationals as a first-order model of `(0, 1, +, *, -, inv, <)`.

Mathematical statement (Lean): `def ActiveOrderedFieldModel : LRA.VolumeI.Logic.FirstOrder.Model LRA.VolumeI.Algebra.Models.OrderedFieldFirstOrderSignature`.
-/
def ActiveOrderedFieldModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.OrderedFieldFirstOrderSignature :=
  LRA.VolumeI.Algebra.Models.BuildOrderedFieldModel ActiveOrderedFieldSignature


/-- Mathlib rationals satisfy the generic rational-model laws.

Mathematical statement (Lean): `theorem rationalLaws : LRA.VolumeI.Algebra.Models.RationalLaws ActiveOrderedFieldSignature`.

*Proof status:* proof pending
-/
theorem rationalLaws :
    LRA.VolumeI.Algebra.Models.RationalLaws ActiveOrderedFieldSignature := by
  sorry


/-- Active bundled rational model.

Mathematical statement (Lean): `def rationalModel : LRA.VolumeI.Algebra.Models.RationalModel`.
-/
def rationalModel : LRA.VolumeI.Algebra.Models.RationalModel where
  signature := ActiveOrderedFieldSignature
  laws := rationalLaws

end LRA.VolumeII.Switches.NumberSystems.RationalNumbers
namespace LRA.VolumeII.Switches.NumberSystems
open LRA.VolumeI.Algebra.Models

end LRA.VolumeII.Switches.NumberSystems
namespace LRA.VolumeII.Switches.NumberSystems.RealNumbers
open LRA.VolumeI.Algebra.Models


/-- Active real-number carrier.

Mathematical statement (Lean): `abbrev R`.
-/
abbrev R := Real


/-- Active real-number ordered-field operation bundle.

Mathematical statement (Lean): `noncomputable def ActiveOrderedFieldSignature : OrderedFieldSignature`.
-/
noncomputable def ActiveOrderedFieldSignature : OrderedFieldSignature where
  carrier := R
  zero := 0
  one := 1
  addition := HAdd.hAdd
  negation := Neg.neg
  multiplication := HMul.hMul
  StrictOrder := fun left right => left < right
  NonstrictOrder := fun left right => left <= right
  inverse := Inv.inv


/-- Active reals as a first-order model of `(0, 1, +, *, -, inv, <)`.

Mathematical statement (Lean): `noncomputable def ActiveOrderedFieldModel : LRA.VolumeI.Logic.FirstOrder.Model LRA.VolumeI.Algebra.Models.OrderedFieldFirstOrderSignature`.
-/
noncomputable def ActiveOrderedFieldModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.OrderedFieldFirstOrderSignature :=
  LRA.VolumeI.Algebra.Models.BuildOrderedFieldModel ActiveOrderedFieldSignature


/-- Mathlib reals satisfy the generic real-model laws.

Mathematical statement (Lean): `theorem realLaws : LRA.VolumeI.Algebra.Models.RealLaws ActiveOrderedFieldSignature`.

*Proof status:* proof pending
-/
theorem realLaws :
    LRA.VolumeI.Algebra.Models.RealLaws ActiveOrderedFieldSignature := by
  sorry


/-- Active bundled real model.

Mathematical statement (Lean): `noncomputable def realModel : LRA.VolumeI.Algebra.Models.RealModel`.
-/
noncomputable def realModel : LRA.VolumeI.Algebra.Models.RealModel where
  signature := ActiveOrderedFieldSignature
  laws := realLaws

end LRA.VolumeII.Switches.NumberSystems.RealNumbers
namespace LRA.VolumeII.Switches.NumberSystems
open LRA.VolumeI.Algebra.Models

end LRA.VolumeII.Switches.NumberSystems
namespace LRA.VolumeII.Switches.NumberSystems.ComplexNumbers
open LRA.VolumeI.Algebra.Models


/-- Active complex-number carrier.

Mathematical statement (Lean): `abbrev C`.
-/
abbrev C := Complex


/-- Active complex-number field operation bundle.

Mathematical statement (Lean): `noncomputable def ActiveFieldSignature : FieldSignature`.
-/
noncomputable def ActiveFieldSignature : FieldSignature where
  carrier := C
  zero := 0
  one := 1
  addition := HAdd.hAdd
  negation := Neg.neg
  multiplication := HMul.hMul
  inverse := Inv.inv


/-- Active complex numbers as a first-order model of `(0, 1, +, *, -, inv)`.

Mathematical statement (Lean): `noncomputable def ActiveFieldModel : LRA.VolumeI.Logic.FirstOrder.Model LRA.VolumeI.Algebra.Models.FieldFirstOrderSignature`.
-/
noncomputable def ActiveFieldModel :
    LRA.VolumeI.Logic.FirstOrder.Model
      LRA.VolumeI.Algebra.Models.FieldFirstOrderSignature :=
  LRA.VolumeI.Algebra.Models.BuildFieldModel ActiveFieldSignature

end LRA.VolumeII.Switches.NumberSystems.ComplexNumbers
namespace LRA.VolumeII.Switches.NumberSystems
open LRA.VolumeI.Algebra.Models

end LRA.VolumeII.Switches.NumberSystems
