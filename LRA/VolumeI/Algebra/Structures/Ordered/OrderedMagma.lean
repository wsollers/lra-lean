import LRA.VolumeI.Algebra.Structures.Elementary.Magma
import LRA.VolumeI.Relations.Order

namespace LRA.VolumeI.Algebra.Structures.Ordered

/--
A magma equipped with a compatible order relation.

Logical form:

```lean
structure OrderedMagma extends LRA.VolumeI.Algebra.Structures.Elementary.Magma where
  Order : LRA.VolumeI.Relations.Endorelation Carrier
```
-/
structure OrderedMagma extends LRA.VolumeI.Algebra.Structures.Elementary.Magma where
  Order : LRA.VolumeI.Relations.Endorelation Carrier

end LRA.VolumeI.Algebra.Structures.Ordered
