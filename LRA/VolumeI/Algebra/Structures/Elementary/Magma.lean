import LRA.VolumeI.Operations

namespace LRA.VolumeI.Algebra.Structures.Elementary

/--
A carrier equipped with one binary operation.

Logical form:

```lean
structure Magma where
  Carrier : Type u
  Operation : LRA.VolumeI.Operations.BinaryOperation Carrier
```
-/
structure Magma where
  Carrier : Type u
  Operation : LRA.VolumeI.Operations.BinaryOperation Carrier

end LRA.VolumeI.Algebra.Structures.Elementary
