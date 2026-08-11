import LRA.VolumeI.Algebra.Structures.RingLike.IntegralDomain

namespace LRA.VolumeI.Algebra.Structures.RingLike

/--
Placeholder interface for a field.

Logical form:

```lean
structure Field extends IntegralDomain where
  Inverse : LRA.VolumeI.Operations.PartialUnaryOperation Carrier
```
-/
structure Field extends IntegralDomain where
  Inverse : LRA.VolumeI.Operations.PartialUnaryOperation Carrier

end LRA.VolumeI.Algebra.Structures.RingLike
