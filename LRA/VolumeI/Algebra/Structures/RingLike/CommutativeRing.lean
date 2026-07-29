import LRA.VolumeI.Algebra.Structures.RingLike.Ring

namespace LRA.VolumeI.Algebra.Structures.RingLike

/-- A commutative ring is a ring with commutative multiplication. -/
structure CommutativeRing extends Ring where
  multiplicationCommutative : LRA.VolumeI.Operations.Commutative mul

end LRA.VolumeI.Algebra.Structures.RingLike
