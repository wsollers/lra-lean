import LRA.VolumeI.Algebra.Structures.Elementary.Monoid

namespace LRA.VolumeI.Algebra.Structures.Elementary

/--
A group is a monoid with a two-sided inverse operation.

Logical form:

```lean
structure Group extends Monoid where
  InverseOperation : LRA.VolumeI.Operations.UnaryOperation Carrier
  InverseLaw :
    LRA.VolumeI.Operations.Inverse Operation IdentityElement InverseOperation
```
-/
structure Group extends Monoid where
  InverseOperation : LRA.VolumeI.Operations.UnaryOperation Carrier
  InverseLaw :
    LRA.VolumeI.Operations.Inverse Operation IdentityElement InverseOperation

end LRA.VolumeI.Algebra.Structures.Elementary
