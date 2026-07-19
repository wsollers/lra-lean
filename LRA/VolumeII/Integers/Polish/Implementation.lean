-- LRA/VolumeII/Integers/Polish/Implementation.lean
-- Polish implementation of the common integer structure.

import LRA.VolumeII.Integers.Laws
import LRA.VolumeII.Integers.Polish.LandauWorkup

namespace LRA
namespace VolumeII
namespace Integers
namespace Polish

/-!
Volume II label: integers-polish-interface-implementation
Lean module: LRA.VolumeII.Integers.Polish.Implementation
Verification status: checked implementation and law bundles

`PolishZ` exposes the two-sided successor construction through the common
`IntegerStructure` interface. The law bundles below are switchable mixins used
by shared tests and downstream examples.
-/

abbrev PolishZCarrier := TwoSidedSuccessor.Z

instance : Zero PolishZCarrier where
  zero := TwoSidedSuccessor.Z.zero

instance : One PolishZCarrier where
  one := TwoSidedSuccessor.one

def PolishZ : IntegerStructure where
  carrier := PolishZCarrier
  zeroInstance := inferInstance
  oneInstance := inferInstance
  addInstance := inferInstance
  negInstance := inferInstance
  mulInstance := inferInstance
  ltInstance := inferInstance
  leInstance := inferInstance
  succ := TwoSidedSuccessor.succ
  pred := TwoSidedSuccessor.pred

def PolishSuccessorLaws : IntegerSuccessorLaws PolishZ where
  pred_succ := TwoSidedSuccessor.pred_succ
  succ_pred := TwoSidedSuccessor.succ_pred
  succ_injective := by
    intro firstInteger secondInteger successorEquality
    exact TwoSidedSuccessor.succ_injective successorEquality
  pred_injective := by
    intro firstInteger secondInteger predecessorEquality
    exact TwoSidedSuccessor.pred_injective predecessorEquality

def PolishAdditiveLaws : IntegerAdditiveLaws PolishZ where
  add_assoc := TwoSidedSuccessor.add_assoc
  add_comm := TwoSidedSuccessor.add_comm
  zero_add := TwoSidedSuccessor.zero_add
  add_zero := TwoSidedSuccessor.add_zero
  neg_add_self := TwoSidedSuccessor.neg_add_self
  add_neg_self := TwoSidedSuccessor.add_neg_self
  neg_neg := TwoSidedSuccessor.neg_neg
  neg_add := TwoSidedSuccessor.neg_add

def PolishMultiplicativeLaws : IntegerMultiplicativeLaws PolishZ where
  one_mul := TwoSidedSuccessor.one_mul
  mul_one := by
    intro value
    cases value <;> rfl
  mul_zero := TwoSidedSuccessor.mul_zero
  zero_mul := TwoSidedSuccessor.zero_mul
  mul_assoc := TwoSidedSuccessor.mul_assoc
  mul_comm := TwoSidedSuccessor.mul_comm

def PolishMultiplicationSuccessorLaws :
    IntegerMultiplicationSuccessorLaws PolishZ where
  mul_succ := TwoSidedSuccessor.mul_succ
  mul_pred := TwoSidedSuccessor.mul_pred

def PolishRingLaws : IntegerRingLaws PolishZ where
  toAdditiveGroupLaws := PolishAdditiveLaws
  toMultiplicativeMonoidLaws := PolishMultiplicativeLaws
  distrib_left := TwoSidedSuccessor.distrib_left
  distrib_right := TwoSidedSuccessor.distrib_right
  mul_neg := TwoSidedSuccessor.mul_neg
  neg_mul := TwoSidedSuccessor.neg_mul

def PolishOrderLaws : IntegerOrderLaws PolishZ where
  lt_irrefl := TwoSidedSuccessor.lt_irrefl
  lt_trans := by
    intro firstInteger middleInteger lastInteger firstLessMiddle middleLessLast
    exact TwoSidedSuccessor.lt_trans firstLessMiddle middleLessLast
  le_refl := TwoSidedSuccessor.le_refl
  le_antisymm := by
    intro firstInteger secondInteger firstLeSecond secondLeFirst
    exact TwoSidedSuccessor.le_antisymm firstLeSecond secondLeFirst
  lt_trichotomy := TwoSidedSuccessor.lt_trichotomy

def PolishOrderedRingLaws : IntegerOrderedRingLaws PolishZ where
  toRingLaws := PolishRingLaws
  toOrderLaws := PolishOrderLaws
  add_lt_add_right := by
    intro firstInteger secondInteger firstLessSecond translatedBy
    exact TwoSidedSuccessor.add_lt_add_right firstLessSecond translatedBy
  mul_lt_mul_pos_right := by
    intro firstInteger secondInteger positiveMultiplier firstLessSecond zeroLessMultiplier
    have multiplierIsPositiveRay : TwoSidedSuccessor.Pos positiveMultiplier :=
      TwoSidedSuccessor.pos_of_zero_lt positiveMultiplier zeroLessMultiplier
    exact TwoSidedSuccessor.mul_lt_mul_pos_right firstLessSecond multiplierIsPositiveRay

def PolishIntegerLaws : IntegerLaws PolishZ where
  toOrderedRingLaws := PolishOrderedRingLaws
  toIntegerSuccessorLaws := PolishSuccessorLaws
  toIntegerMultiplicationSuccessorLaws := PolishMultiplicationSuccessorLaws

end Polish
end Integers
end VolumeII
end LRA
