import LRA.VolumeI.Algebra.Structures.Elementary.Semigroup

namespace LRA.VolumeI.Algebra.Structures.Elementary

/--
A commutative semigroup is a semigroup whose operation is commutative.

Logical form:

```lean
structure CommutativeSemigroup extends Semigroup where
  OperationCommutative : LRA.VolumeI.Operations.Commutative Operation
```
-/
structure CommutativeSemigroup extends Semigroup where
  OperationCommutative : LRA.VolumeI.Operations.Commutative Operation

end LRA.VolumeI.Algebra.Structures.Elementary
