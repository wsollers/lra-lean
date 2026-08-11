import LRA.VolumeI.Algebra.Structures.RingLike.Ring

namespace LRA.VolumeI.Algebra.Structures.RingLike

/--
A commutative ring is a ring with commutative multiplication.

Logical form:

```lean
structure CommutativeRing extends Ring where
  MultiplicationCommutative : LRA.VolumeI.Operations.Commutative Multiplication
```
-/
structure CommutativeRing extends Ring where
  MultiplicationCommutative : LRA.VolumeI.Operations.Commutative Multiplication

end LRA.VolumeI.Algebra.Structures.RingLike
