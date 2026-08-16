-- LRA/VolumeII/Integers/ConversionTests.lean
-- Smoke tests for active integer conversion utilities.

import LRA.VolumeII.Integers.Conversion

namespace LRA.NumberSystems.Integers.ConversionTests

open LRA.AlgebraicStructures
open Conversion

/-!
Volume II label: integers-conversion-tests
Lean module: LRA.NumberSystems.Integers.ConversionTests
Verification status: checked smoke tests for conversion utilities

These tests are intentionally definitional where possible. They protect
the client-facing construction API from accidental changes while the
construction proofs remain pending.
-/

example : ofNat 0 = (0 : Z) := rfl

example : ofNat 1 = Succ 0 := rfl

example : ofNat 2 = Succ (Succ 0) := rfl

example : four = Succ (Succ (Succ (Succ 0))) := rfl

example : ofInt 0 = (0 : Z) := rfl

example : ofInt 4 = four := rfl

example : ofInt (-1) = -one := rfl

example : ofInt (-2) = -two := rfl

example : four = Succ three := rfl

example : negative_two = -two := rfl

example : Pred one = zero := PredSucc zero

end LRA.NumberSystems.Integers.ConversionTests
