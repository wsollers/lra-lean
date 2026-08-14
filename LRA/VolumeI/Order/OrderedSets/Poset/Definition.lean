import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition

namespace LRA.VolumeI.Order

/--
A poset is a carrier equipped with a non-strict partial order.

Logical form:

```lean
structure Poset where
  Carrier : Type u
  NonStrictOrder : LRA.VolumeI.Relations.Endorelation Carrier
  NonStrictOrderIsPartialOrder : LRA.VolumeI.Order.PartialOrder NonStrictOrder
```
-/
structure Poset where
  Carrier : Type u
  NonStrictOrder : LRA.VolumeI.Relations.Endorelation Carrier
  NonStrictOrderIsPartialOrder : LRA.VolumeI.Order.PartialOrder NonStrictOrder

end LRA.VolumeI.Order

namespace LRA.VolumeI.Order.OrderedSets.Poset

/--
The `Poset` concept is the canonical Volume I structure: a carrier with a
non-strict order relation whose laws form a partial order.

Logical form:

```lean
LRA.VolumeI.Order.Poset
```
-/
abbrev PosetConcept := LRA.VolumeI.Order.Poset

/--
A non-strict poset is a poset whose displayed order relation is the
non-strict relation field.

Logical form:

```lean
LRA.VolumeI.Order.Poset
```
-/
abbrev NonStrictPoset := LRA.VolumeI.Order.Poset

end LRA.VolumeI.Order.OrderedSets.Poset
