import LRA.VolumeI.Algebra.Structures.RingLike.Ring

namespace LRA.VolumeI.Algebra.Structures.RingLike

/--
A nontrivial ring has distinct zero and one.

Logical form:

```lean
structure NontrivialRing extends Ring where
  ZeroNotOne : Zero ≠ One
```
-/
structure NontrivialRing extends Ring where
  ZeroNotOne : Zero ≠ One

end LRA.VolumeI.Algebra.Structures.RingLike
