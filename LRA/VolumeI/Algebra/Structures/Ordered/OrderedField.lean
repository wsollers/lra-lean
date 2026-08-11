import LRA.VolumeI.Algebra.Structures.RingLike.Field
import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.VolumeI.Algebra.Structures.Ordered

/--
A field equipped with an order relation.

Logical form:

```lean
structure OrderedField
    extends LRA.VolumeI.Algebra.Structures.RingLike.Field where
  Order : LRA.VolumeI.Relations.Endorelation Carrier
```
-/
structure OrderedField
    extends LRA.VolumeI.Algebra.Structures.RingLike.Field where
  Order : LRA.VolumeI.Relations.Endorelation Carrier

end LRA.VolumeI.Algebra.Structures.Ordered
