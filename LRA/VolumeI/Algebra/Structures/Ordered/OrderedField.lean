import LRA.VolumeI.Algebra.Structures.RingLike.Field
import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.VolumeI.Algebra.Structures.Ordered

/-- A field equipped with an order relation. -/
structure OrderedField
    extends LRA.VolumeI.Algebra.Structures.RingLike.Field where
  order : LRA.VolumeI.Relations.Endorelation carrier

end LRA.VolumeI.Algebra.Structures.Ordered
