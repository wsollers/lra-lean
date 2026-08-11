import LRA.VolumeI.Algebra.Structures.Elementary.Group
import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.VolumeI.Algebra.Structures.Ordered

/--
A group equipped with an order relation.

Logical form:

```lean
structure OrderedGroup
    extends LRA.VolumeI.Algebra.Structures.Elementary.Group where
  Order : LRA.VolumeI.Relations.Endorelation Carrier
```
-/
structure OrderedGroup
    extends LRA.VolumeI.Algebra.Structures.Elementary.Group where
  Order : LRA.VolumeI.Relations.Endorelation Carrier

end LRA.VolumeI.Algebra.Structures.Ordered
