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

def one : Active.Z := Active.succ Active.zero
def two : Active.Z := Active.succ one
def minusOne : Active.Z := Active.pred Active.zero
def minusTwo : Active.Z := Active.pred minusOne

example : Active.pred (Active.succ two) = two :=
  Polish.TwoSidedSuccessor.pred_succ two

example : Active.succ (Active.pred minusTwo) = minusTwo :=
  Polish.TwoSidedSuccessor.succ_pred minusTwo

example : Active.add two Active.zero = two := rfl

example : Active.add two one = Active.succ two := rfl

example : Active.add two minusOne = one := by
  change two + Active.pred Active.zero = Active.pred (two + Active.zero)
  rw [Polish.TwoSidedSuccessor.add_pred]

example : Active.negZ Active.zero = Active.zero := rfl

example : Active.negZ one = minusOne := rfl

example : Active.negZ minusOne = one := rfl

example : Active.mul two Active.zero = Active.zero :=
  Polish.TwoSidedSuccessor.mul_zero two

example : Active.mul two one = two := rfl

example : Active.mul two two = Active.add two two := rfl

end ArithmeticTests
end Integers
end VolumeII
end LRA
