import LRA.VolumeI.Algebra.Structures.RingLike.Semiring

namespace LRA.VolumeI.Algebra.Structures.RingLike

/-- A ring-like structure with additive inverses and multiplication. -/
structure Ring extends Semiring where
  neg : LRA.VolumeI.Operations.UnaryOperation carrier
  additiveInverse : LRA.VolumeI.Operations.Inverse add zero neg

end LRA.VolumeI.Algebra.Structures.RingLike
