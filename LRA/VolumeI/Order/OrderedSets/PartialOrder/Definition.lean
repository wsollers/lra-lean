import LRA.VolumeI.Order.OrderStructures.Preorder

namespace LRA.VolumeI.Order

universe u

/--
Partial-order laws for an endorelation.

Logical form:

```lean
def PartialOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  LRA.VolumeI.Relations.Reflexive relation /\
    LRA.VolumeI.Relations.Antisymmetric relation /\
      LRA.VolumeI.Relations.Transitive relation
```
-/
def PartialOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  LRA.VolumeI.Relations.Reflexive relation /\
    LRA.VolumeI.Relations.Antisymmetric relation /\
      LRA.VolumeI.Relations.Transitive relation

end LRA.VolumeI.Order

namespace LRA.VolumeI.Order.OrderedSets.PartialOrder

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

/--
A partial-order relation is an endorelation equipped with the theorem that it
satisfies the partial-order laws.

Logical form:

```lean
structure PartialOrderRelation (Carrier : Type u) where
  relation : Relation Carrier
  relationIsPartialOrder : LRA.VolumeI.Order.PartialOrder relation
```
-/
structure PartialOrderRelation (Carrier : Type u) where
  relation : Relation Carrier
  relationIsPartialOrder : LRA.VolumeI.Order.PartialOrder relation

end LRA.VolumeI.Order.OrderedSets.PartialOrder
