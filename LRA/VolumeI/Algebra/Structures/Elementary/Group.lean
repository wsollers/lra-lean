import LRA.VolumeI.Algebra.Structures.Elementary.Monoid

namespace LRA.VolumeI.Algebra.Structures.Elementary

/-- A group is a monoid with a two-sided inverse operation. -/
structure Group extends Monoid where
  inverseOperation : LRA.VolumeI.Operations.UnaryOperation carrier
  inverseLaw :
    LRA.VolumeI.Operations.Inverse operation identityElement inverseOperation

end LRA.VolumeI.Algebra.Structures.Elementary
