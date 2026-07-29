import LRA.VolumeI.Algebra.Structures.RingLike.CommutativeRing
import LRA.VolumeI.Algebra.Structures.RingLike.NontrivialRing

namespace LRA.VolumeI.Algebra.Structures.RingLike

/-- Placeholder interface for an integral domain. -/
structure IntegralDomain extends CommutativeRing, NontrivialRing where
  nonzeroProductProperty :
    forall left right,
      left ≠ zero -> right ≠ zero -> mul left right ≠ zero

end LRA.VolumeI.Algebra.Structures.RingLike
