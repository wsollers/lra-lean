import LRA.VolumeI.Algebra.Structures.RingLike.IntegralDomain

namespace LRA.VolumeI.Algebra.Structures.RingLike

/-- Placeholder interface for a field. -/
structure Field extends IntegralDomain where
  inverse : LRA.VolumeI.Operations.PartialUnaryOperation carrier

end LRA.VolumeI.Algebra.Structures.RingLike
