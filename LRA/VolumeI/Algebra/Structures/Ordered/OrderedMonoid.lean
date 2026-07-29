import LRA.VolumeI.Algebra.Structures.Elementary.Monoid
import LRA.VolumeI.Algebra.Structures.Ordered.OrderedMagma

namespace LRA.VolumeI.Algebra.Structures.Ordered

/-- A monoid equipped with an order relation. -/
structure OrderedMonoid
    extends LRA.VolumeI.Algebra.Structures.Elementary.Monoid where
  order : LRA.VolumeI.Relations.Endorelation carrier

end LRA.VolumeI.Algebra.Structures.Ordered
