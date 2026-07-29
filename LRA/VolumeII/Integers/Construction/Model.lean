-- LRA/VolumeII/Integers/Construction/Model.lean
-- Active integer construction as a Volume I first-order algebraic model.

import LRA.VolumeI.Algebra.Models
import LRA.VolumeII.Integers.Implementation

namespace LRA
namespace VolumeII
namespace Integers

open LRA.VolumeI.Algebra.Models

namespace Active

/-!
Volume II label: active-integer-model
Lean module: LRA.VolumeII.Integers.Construction.Model
Verification status: definitions accepted; model laws pending
-/


/-- The active integer carrier and operations as an ordered-ring operation bundle.

Mathematical statement (Lean): `def integerNumbersSignature : OrderedRingFirstOrderSignature`.
-/
def integerNumbersSignature : OrderedRingSignature where
  carrier := Z
  zero := zero
  one := one
  addition := add
  negation := negZ
  multiplication := mul
  StrictOrder := ZImpl.lt
  NonstrictOrder := ZImpl.le


/-- The active integers as a first-order model of the ordered-ring signature.

Mathematical statement (Lean): `def integerNumbersModel : LRA.VolumeI.Logic.FirstOrder.Model OrderedRingFirstOrderSignature`.
-/
def integerNumbersModel :
    LRA.VolumeI.Logic.FirstOrder.Model OrderedRingFirstOrderSignature :=
  BuildOrderedRingModel integerNumbersSignature

/--
The active integer carrier and operations in the additive ordered language
`(0, 1, +, <)`, the language underlying Presburger arithmetic.

Mathematical statement (Lean): `def additiveOrderedIntegerSignature : AdditiveOrderedFirstOrderSignature`.
-/
def additiveOrderedIntegerSignature : AdditiveOrderedSignature where
  carrier := Z
  zero := zero
  one := one
  addition := add
  StrictOrder := ZImpl.lt
  NonstrictOrder := ZImpl.le


/-- The active integers as a model of the additive ordered language.

Mathematical statement (Lean): `def additiveOrderedIntegerModel : LRA.VolumeI.Logic.FirstOrder.Model AdditiveOrderedFirstOrderSignature`.
-/
def additiveOrderedIntegerModel :
    LRA.VolumeI.Logic.FirstOrder.Model AdditiveOrderedFirstOrderSignature :=
  BuildAdditiveOrderedModel additiveOrderedIntegerSignature

/--
The active integer carrier and operations in the arithmetic ring language
`(0, 1, +, *)`.

Mathematical statement (Lean): `def arithmeticRingIntegerSignature : ArithmeticRingFirstOrderSignature`.
-/
def arithmeticRingIntegerSignature : ArithmeticRingSignature where
  carrier := Z
  zero := zero
  one := one
  addition := add
  multiplication := mul


/-- The active integers as a model of the arithmetic ring language.

Mathematical statement (Lean): `def arithmeticRingIntegerModel : LRA.VolumeI.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature`.
-/
def arithmeticRingIntegerModel :
    LRA.VolumeI.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  BuildArithmeticRingModel arithmeticRingIntegerSignature


/-- The active integers satisfy the generic integer-model laws.

Mathematical statement (Lean): `theorem integerNumbersLaws : LRA.VolumeI.Algebra.Models.IntegerLaws integerNumbersSignature`.

*Proof status:* proof pending
-/
theorem integerNumbersLaws :
    LRA.VolumeI.Algebra.Models.IntegerLaws integerNumbersSignature := by
  sorry


/-- The active integers as the bundled integer model used by the number-system tower.

Mathematical statement (Lean): `def integerNumberSystemModel : LRA.VolumeI.Algebra.Models.IntegerModel`.
-/
def integerNumberSystemModel : LRA.VolumeI.Algebra.Models.IntegerModel where
  signature := integerNumbersSignature
  laws := integerNumbersLaws

end Active

end Integers
end VolumeII
end LRA
