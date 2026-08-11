import LRA.VolumeI.Algebra.Structures.RingLike.CommutativeRing
import LRA.VolumeI.Algebra.Structures.RingLike.NontrivialRing

namespace LRA.VolumeI.Algebra.Structures.RingLike

/--
Placeholder interface for an integral domain.

Logical form:

```lean
structure IntegralDomain extends CommutativeRing, NontrivialRing where
  NonzeroProductProperty :
    forall left right,
      left ≠ Zero -> right ≠ Zero -> Multiplication left right ≠ Zero
```
-/
structure IntegralDomain extends CommutativeRing, NontrivialRing where
  NonzeroProductProperty :
    forall left right,
      left ≠ Zero -> right ≠ Zero -> Multiplication left right ≠ Zero

end LRA.VolumeI.Algebra.Structures.RingLike
