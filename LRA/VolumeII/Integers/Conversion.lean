-- LRA/VolumeII/Integers/Conversion.lean
-- Client-facing constructors for the active integer implementation.

import LRA.VolumeII.Integers.Implementation

namespace LRA.VolumeII.Integers.Active.Conversion

/-!
Volume II label: integers-active-conversion-tools
Lean module: LRA.VolumeII.Integers.Conversion
Verification status: checked conversion utilities

These constructors give examples and downstream tests a stable way to build
values in the active integer carrier without naming the concrete construction.
They intentionally live behind `Active`, because alternate constructions may
have different carriers.
-/


/-- Construct an active integer from a natural number by iterating successor.

Mathematical statement (Lean): `def ofNat : Nat → Active.Z | 0 => Active.zero | Nat.succ previous => Active.succ (ofNat previous) / def ofInt : Int → Active.Z | Int.ofNat value => ofNat value | Int.negSucc predecessor => Active.negZ (ofNat (Nat.succ predecessor)) / def zero : Active.Z`.
-/
def ofNat : Nat → Active.Z
  | 0 => Active.zero
  | Nat.succ previous => Active.succ (ofNat previous)


/-- Construct an active integer from a Lean integer.

Mathematical statement (Lean): `def ofInt : Int → Active.Z | Int.ofNat value => ofNat value | Int.negSucc predecessor => Active.negZ (ofNat (Nat.succ predecessor)) / def zero : Active.Z`.
-/
def ofInt : Int → Active.Z
  | Int.ofNat value => ofNat value
  | Int.negSucc predecessor => Active.negZ (ofNat (Nat.succ predecessor))


/-- The active integer zero, exposed through the conversion API.

Mathematical statement (Lean): `def zero : Active.Z`.
-/
def zero : Active.Z := ofNat 0


/-- The active integer one, exposed through the conversion API.

Mathematical statement (Lean): `def one : Active.Z`.
-/
def one : Active.Z := ofNat 1


/-- The active integer two, exposed through the conversion API.

Mathematical statement (Lean): `def two : Active.Z`.
-/
def two : Active.Z := ofNat 2


/-- The active integer three, exposed through the conversion API.

Mathematical statement (Lean): `def three : Active.Z`.
-/
def three : Active.Z := ofNat 3


/-- The active integer four, exposed through the conversion API.

Mathematical statement (Lean): `def four : Active.Z`.
-/
def four : Active.Z := ofNat 4


/-- The active integer negative one, exposed through the conversion API.

Mathematical statement (Lean): `def negative_one : Active.Z`.
-/
def negative_one : Active.Z := ofInt (-1)


/-- The active integer negative two, exposed through the conversion API.

Mathematical statement (Lean): `def negative_two : Active.Z`.
-/
def negative_two : Active.Z := ofInt (-2)

end LRA.VolumeII.Integers.Active.Conversion
