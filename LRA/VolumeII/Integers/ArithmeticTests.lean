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

def activeOne : Active.Z := Active.one
def activeTwo : Active.Z := Active.succ activeOne
def activeMinusOne : Active.Z := Active.pred Active.zero
def activeMinusTwo : Active.Z := Active.pred activeMinusOne

example : Active.pred (Active.succ activeTwo) = activeTwo :=
  Active.successorLaws.pred_succ activeTwo

example : Active.succ (Active.pred activeMinusTwo) = activeMinusTwo :=
  Active.successorLaws.succ_pred activeMinusTwo

example : activeTwo + Active.zero = activeTwo :=
  Active.additiveLaws.add_zero activeTwo

example : Active.zero + activeTwo = activeTwo :=
  Active.additiveLaws.zero_add activeTwo

example : (activeOne + activeTwo) + activeMinusOne =
    activeOne + (activeTwo + activeMinusOne) :=
  Active.additiveLaws.add_assoc activeOne activeTwo activeMinusOne

example : activeOne + activeTwo = activeTwo + activeOne :=
  Active.additiveLaws.add_comm activeOne activeTwo

example : -(-activeMinusTwo) = activeMinusTwo :=
  Active.additiveLaws.neg_neg activeMinusTwo

example : -activeMinusTwo + activeMinusTwo = Active.zero :=
  Active.additiveLaws.neg_add_self activeMinusTwo

example : activeTwo + activeMinusOne = activeOne := rfl

example : Active.negZ Active.zero = Active.zero := rfl

example : Active.negZ activeOne = activeMinusOne := rfl

example : Active.negZ activeMinusOne = activeOne := rfl

example : Active.mul activeTwo Active.zero = Active.zero :=
  Active.multiplicativeLaws.mul_zero activeTwo

example : Active.one * activeTwo = activeTwo :=
  Active.multiplicativeLaws.one_mul activeTwo

example : (activeOne * activeTwo) * activeMinusOne =
    activeOne * (activeTwo * activeMinusOne) :=
  Active.ringLaws.mul_assoc activeOne activeTwo activeMinusOne

example : activeOne * activeTwo = activeTwo * activeOne :=
  Active.ringLaws.mul_comm activeOne activeTwo

example : activeOne * (activeTwo + activeMinusOne) =
    activeOne * activeTwo + activeOne * activeMinusOne :=
  Active.ringLaws.distrib_left activeOne activeTwo activeMinusOne

example : (activeOne + activeMinusOne) * activeTwo =
    activeOne * activeTwo + activeMinusOne * activeTwo :=
  Active.ringLaws.distrib_right activeOne activeMinusOne activeTwo

example : ¬ activeOne < activeOne :=
  Active.orderLaws.lt_irrefl activeOne

example : activeOne ≤ activeOne :=
  Active.orderLaws.le_refl activeOne

example : Active.zero < activeOne := by
  change Polish.TwoSidedSuccessor.Z.zero < Polish.TwoSidedSuccessor.succ Polish.TwoSidedSuccessor.Z.zero
  exact Polish.TwoSidedSuccessor.lt_succ_self Polish.TwoSidedSuccessor.Z.zero

example : Active.zero < activeOne → Active.zero * activeTwo < activeOne * activeTwo :=
  fun zeroLessActiveOne => Active.orderedRingLaws.mul_lt_mul_pos_right zeroLessActiveOne
    (by
      change Polish.TwoSidedSuccessor.Z.zero < Polish.TwoSidedSuccessor.succ (Polish.TwoSidedSuccessor.succ Polish.TwoSidedSuccessor.Z.zero)
      exact Polish.TwoSidedSuccessor.lt_trans
        (Polish.TwoSidedSuccessor.lt_succ_self Polish.TwoSidedSuccessor.Z.zero)
        (Polish.TwoSidedSuccessor.lt_succ_self activeOne))

end ArithmeticTests
end Integers
end VolumeII
end LRA
