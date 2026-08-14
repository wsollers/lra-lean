import LRA.VolumeI.Order.OrderStructures.Preorder

namespace LRA.VolumeI.Order.OrderedSets.Preorder

universe u

/--
A preorder relation starts as an endorelation: a binary relation comparing two
elements of the same carrier.

Logical form:

```lean
LRA.VolumeI.Relations.Endorelation Carrier
```
-/
abbrev Relation (Carrier : Type u) :=
  LRA.VolumeI.Relations.Endorelation Carrier

/--
A preorder is an endorelation satisfying reflexivity and transitivity.

Logical form:

```lean
LRA.VolumeI.Order.Preorder relation
```
-/
structure PreorderRelation (Carrier : Type u) where
  relation : Relation Carrier
  isPreorder : LRA.VolumeI.Order.Preorder relation

end LRA.VolumeI.Order.OrderedSets.Preorder
