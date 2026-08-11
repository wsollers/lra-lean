import LRA.VolumeI.Algebra.Structures.RingLike.Ring
import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.VolumeI.Algebra.Structures.Ordered

/--
A ring equipped with an order relation.

Logical form:

```lean
structure OrderedRing
    extends LRA.VolumeI.Algebra.Structures.RingLike.Ring where
  Order : LRA.VolumeI.Relations.Endorelation Carrier
```
-/
structure OrderedRing
    extends LRA.VolumeI.Algebra.Structures.RingLike.Ring where
  Order : LRA.VolumeI.Relations.Endorelation Carrier

end LRA.VolumeI.Algebra.Structures.Ordered
