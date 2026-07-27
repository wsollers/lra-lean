-- LRA/VolumeII/Integers/Conversion.lean
-- Client-facing constructors for the active integer implementation.

import LRA.VolumeII.Integers.Implementation

namespace LRA
namespace VolumeII
namespace Integers
namespace Active
namespace Conversion

/-!
Volume II label: integers-active-conversion-tools
Lean module: LRA.VolumeII.Integers.Conversion
Verification status: checked conversion utilities

These constructors give examples and downstream tests a stable way to build
values in the active integer carrier without naming the concrete construction.
They intentionally live behind `Active`, because alternate constructions may
have different carriers.
-/

/-- Construct an active integer from a natural number by iterating successor. -/
def ofNat : Nat → Active.Z
  | 0 => Active.zero
  | Nat.succ previous => Active.succ (ofNat previous)

/-- Construct an active integer from a Lean integer. -/
def ofInt : Int → Active.Z
  | Int.ofNat value => ofNat value
  | Int.negSucc predecessor => Active.negZ (ofNat (Nat.succ predecessor))

/-- The active integer zero, exposed through the conversion API. -/
def zero : Active.Z := ofNat 0

/-- The active integer one, exposed through the conversion API. -/
def one : Active.Z := ofNat 1

/-- The active integer two, exposed through the conversion API. -/
def two : Active.Z := ofNat 2

/-- The active integer three, exposed through the conversion API. -/
def three : Active.Z := ofNat 3

/-- The active integer four, exposed through the conversion API. -/
def four : Active.Z := ofNat 4

/-- The active integer negative one, exposed through the conversion API. -/
def negative_one : Active.Z := ofInt (-1)

/-- The active integer negative two, exposed through the conversion API. -/
def negative_two : Active.Z := ofInt (-2)

end Conversion
end Active
end Integers
end VolumeII
end LRA
