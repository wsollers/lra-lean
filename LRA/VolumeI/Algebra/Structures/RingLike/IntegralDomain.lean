import LRA.VolumeI.Algebra.Structures.RingLike.Ring

namespace LRA.VolumeI.Algebra.Structures.RingLike

/-- Placeholder interface for an integral domain. -/
structure IntegralDomain extends Ring where
  nonzeroProductProperty :
    forall left right,
      left ≠ zero -> right ≠ zero -> mul left right ≠ zero

end LRA.VolumeI.Algebra.Structures.RingLike
