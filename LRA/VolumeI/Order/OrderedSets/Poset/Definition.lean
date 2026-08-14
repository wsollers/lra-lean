import LRA.VolumeI.Order.OrderStructures.Poset

namespace LRA.VolumeI.Order.OrderedSets.Poset

universe u

/--
The `Poset` concept is represented by the canonical Volume I structure
`LRA.VolumeI.Order.Poset`: a carrier equipped with a non-strict order relation
whose laws form a partial order.

Logical form:

```lean
LRA.VolumeI.Order.Poset where
  Carrier : Type u
  NonStrictOrder : LRA.VolumeI.Relations.Endorelation Carrier
  NonStrictOrderIsPartialOrder : LRA.VolumeI.Order.PartialOrder NonStrictOrder
```
-/
abbrev PosetConcept := LRA.VolumeI.Order.Poset

end LRA.VolumeI.Order.OrderedSets.Poset
