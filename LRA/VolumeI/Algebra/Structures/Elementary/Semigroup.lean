import LRA.VolumeI.Algebra.Structures.Elementary.Magma

namespace LRA.VolumeI.Algebra.Structures.Elementary

/--
A semigroup is a magma whose operation is associative.

Logical form:

```lean
structure Semigroup extends Magma where
  OperationAssociative : LRA.VolumeI.Operations.Associative Operation
```
-/
structure Semigroup extends Magma where
  OperationAssociative : LRA.VolumeI.Operations.Associative Operation

end LRA.VolumeI.Algebra.Structures.Elementary
