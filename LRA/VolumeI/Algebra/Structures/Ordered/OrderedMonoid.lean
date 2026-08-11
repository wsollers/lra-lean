import LRA.VolumeI.Algebra.Structures.Elementary.Monoid
import LRA.VolumeI.Algebra.Structures.Ordered.OrderedMagma

namespace LRA.VolumeI.Algebra.Structures.Ordered

/--
A monoid equipped with an order relation.

Logical form:

```lean
structure OrderedMonoid
    extends LRA.VolumeI.Algebra.Structures.Elementary.Monoid where
  Order : LRA.VolumeI.Relations.Endorelation Carrier
```
-/
structure OrderedMonoid
    extends LRA.VolumeI.Algebra.Structures.Elementary.Monoid where
  Order : LRA.VolumeI.Relations.Endorelation Carrier

end LRA.VolumeI.Algebra.Structures.Ordered
