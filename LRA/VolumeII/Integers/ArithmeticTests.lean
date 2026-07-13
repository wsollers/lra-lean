-- LRA/VolumeII/Integers/ArithmeticTests.lean
-- Shared arithmetic smoke tests for the active integer implementation.

import LRA.VolumeII.Integers.Implementation

namespace LRA
namespace VolumeII
namespace Integers
namespace ArithmeticTests

/-!
Volume II label: integers-arithmetic-tests
Lean module: LRA.VolumeII.Integers.ArithmeticTests
Verification status: checked smoke tests for the active implementation

These tests are intentionally small executable/propositional checks against the
active integer switch. As Tao, Mendelson, and Pfefer implementations become
checked, the same tests should be run with `Active` switched to each source
variant.
-/

def one : Active.Z := Active.one
def two : Active.Z := Active.succ one
def minusOne : Active.Z := Active.pred Active.zero
def minusTwo : Active.Z := Active.pred minusOne

example : Active.pred (Active.succ two) = two :=
  Active.successorLaws.pred_succ two

example : Active.succ (Active.pred minusTwo) = minusTwo :=
  Active.successorLaws.succ_pred minusTwo

example : two + Active.zero = two :=
  Active.additiveLaws.add_zero two

example : Active.zero + two = two :=
  Active.additiveLaws.zero_add two

example : (one + two) + minusOne = one + (two + minusOne) :=
  Active.additiveLaws.add_assoc one two minusOne

example : one + two = two + one :=
  Active.additiveLaws.add_comm one two

example : -(-minusTwo) = minusTwo :=
  Active.additiveLaws.neg_neg minusTwo

example : -minusTwo + minusTwo = Active.zero :=
  Active.additiveLaws.neg_add_self minusTwo

example : two + minusOne = one := rfl

example : Active.negZ Active.zero = Active.zero := rfl

example : Active.negZ one = minusOne := rfl

example : Active.negZ minusOne = one := rfl

example : Active.mul two Active.zero = Active.zero :=
  Active.multiplicativeLaws.mul_zero two

example : Active.one * two = two :=
  Active.multiplicativeLaws.one_mul two

example : (one * two) * minusOne = one * (two * minusOne) :=
  Active.ringLaws.mul_assoc one two minusOne

example : one * two = two * one :=
  Active.ringLaws.mul_comm one two

example : one * (two + minusOne) = one * two + one * minusOne :=
  Active.ringLaws.distrib_left one two minusOne

example : (one + minusOne) * two = one * two + minusOne * two :=
  Active.ringLaws.distrib_right one minusOne two

example : ¬ one < one :=
  Active.orderLaws.lt_irrefl one

example : one ≤ one :=
  Active.orderLaws.le_refl one

example : Active.zero < one := by
  change Polish.TwoSidedSuccessor.Z.zero < Polish.TwoSidedSuccessor.succ Polish.TwoSidedSuccessor.Z.zero
  exact Polish.TwoSidedSuccessor.lt_succ_self Polish.TwoSidedSuccessor.Z.zero

example : Active.zero < one → Active.zero * two < one * two :=
  fun h => Active.orderedRingLaws.mul_lt_mul_pos_right h
    (by
      change Polish.TwoSidedSuccessor.Z.zero < Polish.TwoSidedSuccessor.succ (Polish.TwoSidedSuccessor.succ Polish.TwoSidedSuccessor.Z.zero)
      exact Polish.TwoSidedSuccessor.lt_trans
        (Polish.TwoSidedSuccessor.lt_succ_self Polish.TwoSidedSuccessor.Z.zero)
        (Polish.TwoSidedSuccessor.lt_succ_self one))

end ArithmeticTests
end Integers
end VolumeII
end LRA
