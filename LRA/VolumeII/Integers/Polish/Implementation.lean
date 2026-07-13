-- LRA/VolumeII/Integers/Polish/Implementation.lean
-- Polish implementation of the common LRAZ interface.

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
`LRAZ` interface. The law bundles below are the switchable proof objects used
by shared tests and downstream examples.
-/

abbrev PolishZCarrier := TwoSidedSuccessor.Z

instance : Zero PolishZCarrier where
  zero := TwoSidedSuccessor.Z.zero

instance : One PolishZCarrier where
  one := TwoSidedSuccessor.one

def PolishZ : LRAZ where
  carrier := PolishZCarrier
  zeroInst := inferInstance
  oneInst := inferInstance
  addInst := inferInstance
  negInst := inferInstance
  mulInst := inferInstance
  ltInst := inferInstance
  leInst := inferInstance
  succ := TwoSidedSuccessor.succ
  pred := TwoSidedSuccessor.pred

def PolishSuccessorLaws : LRASuccessorLaws PolishZ where
  pred_succ := TwoSidedSuccessor.pred_succ
  succ_pred := TwoSidedSuccessor.succ_pred
  succ_injective := by
    intro x y h
    exact TwoSidedSuccessor.succ_injective h
  pred_injective := by
    intro x y h
    exact TwoSidedSuccessor.pred_injective h

def PolishAdditiveLaws : LRAAdditiveLaws PolishZ where
  add_assoc := TwoSidedSuccessor.add_assoc
  add_comm := TwoSidedSuccessor.add_comm
  zero_add := TwoSidedSuccessor.zero_add
  add_zero := TwoSidedSuccessor.add_zero
  neg_add_self := TwoSidedSuccessor.neg_add_self
  add_neg_self := TwoSidedSuccessor.add_neg_self
  neg_neg := TwoSidedSuccessor.neg_neg
  neg_add := TwoSidedSuccessor.neg_add

def PolishMultiplicativeLaws : LRAMultiplicativeLaws PolishZ where
  one_mul := TwoSidedSuccessor.one_mul
  mul_zero := TwoSidedSuccessor.mul_zero
  zero_mul := TwoSidedSuccessor.zero_mul
  mul_succ := TwoSidedSuccessor.mul_succ
  mul_pred := TwoSidedSuccessor.mul_pred

def PolishRingLaws : LRARingLaws PolishZ where
  toLRAAdditiveLaws := PolishAdditiveLaws
  toLRAMultiplicativeLaws := PolishMultiplicativeLaws
  mul_assoc := TwoSidedSuccessor.mul_assoc
  mul_comm := TwoSidedSuccessor.mul_comm
  distrib_left := TwoSidedSuccessor.distrib_left
  distrib_right := TwoSidedSuccessor.distrib_right
  mul_neg := TwoSidedSuccessor.mul_neg
  neg_mul := TwoSidedSuccessor.neg_mul

def PolishOrderLaws : LRAOrderLaws PolishZ where
  lt_irrefl := TwoSidedSuccessor.lt_irrefl
  lt_trans := by
    intro x y z hxy hyz
    exact TwoSidedSuccessor.lt_trans hxy hyz
  le_refl := TwoSidedSuccessor.le_refl
  le_antisymm := by
    intro x y hxy hyx
    exact TwoSidedSuccessor.le_antisymm hxy hyx
  lt_trichotomy := TwoSidedSuccessor.lt_trichotomy
  add_lt_add_right := by
    intro x y hxy z
    exact TwoSidedSuccessor.add_lt_add_right hxy z

def PolishOrderedRingLaws : LRAOrderedRingLaws PolishZ where
  toLRARingLaws := PolishRingLaws
  toLRAOrderLaws := PolishOrderLaws
  mul_lt_mul_pos_right := by
    intro x y z hxy hz
    have hzPos : TwoSidedSuccessor.Pos z :=
      TwoSidedSuccessor.pos_of_zero_lt z hz
    exact TwoSidedSuccessor.mul_lt_mul_pos_right hxy hzPos

end Polish
end Integers
end VolumeII
end LRA
