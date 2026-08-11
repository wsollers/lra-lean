import LRA.VolumeI.Algebra.Structures.RingLike.Semiring

namespace LRA.VolumeI.Algebra.Structures.RingLike

/--
A ring-like structure with additive inverses and multiplication.

Logical form:

```lean
structure Ring extends Semiring where
  Negation : LRA.VolumeI.Operations.UnaryOperation Carrier
  AdditiveInverse : LRA.VolumeI.Operations.Inverse Addition Zero Negation
```
-/
structure Ring extends Semiring where
  Negation : LRA.VolumeI.Operations.UnaryOperation Carrier
  AdditiveInverse : LRA.VolumeI.Operations.Inverse Addition Zero Negation

end LRA.VolumeI.Algebra.Structures.RingLike
