import LRA.VolumeI.Relations.Basic.Properties

namespace LRA.Order.OrderedSets

universe u

/--
An order relation is an endorelation: a binary relation comparing two elements
of the same carrier.

Logical form:

```lean
LRA.Relation.Endorelation Carrier
```
-/
abbrev OrderRelation (Carrier : Type u) :=
  LRA.Relation.Endorelation Carrier

end LRA.Order.OrderedSets
