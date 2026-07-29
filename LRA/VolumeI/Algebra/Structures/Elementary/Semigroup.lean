import LRA.VolumeI.Algebra.Structures.Elementary.Magma

namespace LRA.VolumeI.Algebra.Structures.Elementary

/-- A semigroup is a magma whose operation is associative. -/
structure Semigroup extends Magma where
  operationAssociative : LRA.VolumeI.Operations.Associative operation

end LRA.VolumeI.Algebra.Structures.Elementary
