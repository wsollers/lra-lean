import LRA.VolumeI.Order.OrderStructures.PartialOrder
import LRA.VolumeI.Order.OrderStructures.StrictPartialOrder

namespace LRA.VolumeI.Order.OrderedSets.PartialOrder

universe u

/--
A partial-order relation starts as an endorelation: a binary relation comparing
two elements of the same carrier.

Logical form:

```lean
LRA.VolumeI.Relations.Endorelation Carrier
```
-/
abbrev Relation (Carrier : Type u) :=
  LRA.VolumeI.Relations.Endorelation Carrier

end LRA.VolumeI.Order.OrderedSets.PartialOrder
