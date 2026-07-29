import LRA.VolumeI.Algebra.Structures.RingLike.Ring
import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.VolumeI.Algebra.Structures.Ordered

/-- A ring equipped with an order relation. -/
structure OrderedRing
    extends LRA.VolumeI.Algebra.Structures.RingLike.Ring where
  order : LRA.VolumeI.Relations.Endorelation carrier

end LRA.VolumeI.Algebra.Structures.Ordered
