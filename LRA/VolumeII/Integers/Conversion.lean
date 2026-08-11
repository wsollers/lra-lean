-- LRA/VolumeII/Integers/Conversion.lean
-- Client-facing constructors for the active integer carrier.

import LRA.VolumeII.Integers.Implementation

namespace LRA.VolumeII.Integers.Conversion

open LRA.VolumeI.AlgebraicStructures

/-!
Volume II label: integers-active-conversion-tools
Lean module: LRA.VolumeII.Integers.Conversion
Verification status: checked conversion utilities

These constructors give examples and downstream tests a stable way to
build values in the active integer carrier without naming the concrete
construction. They are written entirely in the capability vocabulary
(`0`, `Succ`, `Neg`), so they survive repointing the active switch.
-/

/-- Construct an active integer from a natural number by iterating the
successor step.

Logical form:

```lean
def ofNat : Nat → Z
  | 0 => 0
  | Nat.succ previous => Succ (ofNat previous)
```
-/
def ofNat : Nat → Z
  | 0 => 0
  | Nat.succ previous => Succ (ofNat previous)

/-- Construct an active integer from a Lean integer.

Logical form:

```lean
def ofInt : Int → Z
  | Int.ofNat value => ofNat value
  | Int.negSucc predecessor => -(ofNat (Nat.succ predecessor))
```
-/
def ofInt : Int → Z
  | Int.ofNat value => ofNat value
  | Int.negSucc predecessor => -(ofNat (Nat.succ predecessor))

/-- The active integer zero, exposed through the conversion API.

Logical form:

```lean
def zero : Z := ofNat 0
```
-/
def zero : Z := ofNat 0

/-- The active integer one, exposed through the conversion API.

Logical form:

```lean
def one : Z := ofNat 1
```
-/
def one : Z := ofNat 1

/-- The active integer two, exposed through the conversion API.

Logical form:

```lean
def two : Z := ofNat 2
```
-/
def two : Z := ofNat 2

/-- The active integer three, exposed through the conversion API.

Logical form:

```lean
def three : Z := ofNat 3
```
-/
def three : Z := ofNat 3

/-- The active integer four, exposed through the conversion API.

Logical form:

```lean
def four : Z := ofNat 4
```
-/
def four : Z := ofNat 4

/-- The active integer negative one, exposed through the conversion API.

Logical form:

```lean
def negative_one : Z := ofInt (-1)
```
-/
def negative_one : Z := ofInt (-1)

/-- The active integer negative two, exposed through the conversion API.

Logical form:

```lean
def negative_two : Z := ofInt (-2)
```
-/
def negative_two : Z := ofInt (-2)

end LRA.VolumeII.Integers.Conversion
