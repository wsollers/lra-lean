import LRA.VolumeI.Algebra.Structures.Elementary.Group

namespace LRA.VolumeI.Algebra.Structures.Elementary

/-- An abelian group is a group whose operation is commutative. -/
structure AbelianGroup extends Group where
  operationCommutative : LRA.VolumeI.Operations.Commutative operation

end LRA.VolumeI.Algebra.Structures.Elementary
