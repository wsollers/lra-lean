import LRA.VolumeI.Algebra.Structures.Elementary.Monoid

namespace LRA.VolumeI.Algebra.Structures.Elementary

/-- A group is a monoid with a two-sided inverse operation. -/
structure Group extends Monoid where
  InverseOperation : LRA.VolumeI.Operations.UnaryOperation Carrier
  InverseLaw :
    LRA.VolumeI.Operations.Inverse Operation IdentityElement InverseOperation

end LRA.VolumeI.Algebra.Structures.Elementary
