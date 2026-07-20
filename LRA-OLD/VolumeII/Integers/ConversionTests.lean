-- LRA/VolumeII/Integers/ConversionTests.lean
-- Smoke tests for active integer conversion utilities.

import LRA.VolumeII.Integers.Conversion

namespace LRA
namespace VolumeII
namespace Integers
namespace ConversionTests

/-!
Volume II label: integers-conversion-tests
Lean module: LRA.VolumeII.Integers.ConversionTests
Verification status: checked smoke tests for conversion utilities

These tests are intentionally definitional where possible. They protect the
client-facing construction API from accidental changes while the construction
proofs remain pending.
-/

open Active.Conversion

example : ofNat 0 = Active.zero := rfl

example : ofNat 1 = Active.succ Active.zero := rfl

example : ofNat 2 = Active.succ (Active.succ Active.zero) := rfl

example : four = Active.succ (Active.succ (Active.succ (Active.succ Active.zero))) := rfl

example : ofInt 0 = Active.zero := rfl

example : ofInt 4 = four := rfl

example : ofInt (-1) = Active.negZ one := rfl

example : ofInt (-2) = Active.negZ two := rfl

example : four = Active.succ three := rfl

example : negative_two = Active.negZ two := rfl

example : Active.pred one = zero :=
  Active.successorLaws.pred_succ zero

end ConversionTests
end Integers
end VolumeII
end LRA
