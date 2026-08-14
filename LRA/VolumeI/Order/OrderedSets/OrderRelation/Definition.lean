import LRA.VolumeI.Relations.Basic.Properties

namespace LRA.VolumeI.Order.OrderedSets.OrderRelation

universe u

/--
An order relation is an endorelation: a binary relation comparing two elements
of the same carrier.

Logical form:

```lean
LRA.VolumeI.Relations.Endorelation Carrier
```
-/
abbrev Relation (Carrier : Type u) :=
  LRA.VolumeI.Relations.Endorelation Carrier

end LRA.VolumeI.Order.OrderedSets.OrderRelation
