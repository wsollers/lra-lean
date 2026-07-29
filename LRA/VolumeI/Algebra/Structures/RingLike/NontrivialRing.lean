import LRA.VolumeI.Algebra.Structures.RingLike.Ring

namespace LRA.VolumeI.Algebra.Structures.RingLike

/-- A nontrivial ring has distinct zero and one. -/
structure NontrivialRing extends Ring where
  ZeroNotOne : Zero ≠ One

end LRA.VolumeI.Algebra.Structures.RingLike
