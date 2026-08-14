import LRA.VolumeI.Order.Relations

namespace LRA.VolumeI.Order

universe u

/--
Strict-order laws for an endorelation.

Logical form:

```lean
def StrictOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  LRA.VolumeI.Relations.Irreflexive relation /\
    LRA.VolumeI.Relations.Transitive relation
```
-/
def StrictOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  LRA.VolumeI.Relations.Irreflexive relation /\
    LRA.VolumeI.Relations.Transitive relation

end LRA.VolumeI.Order

namespace LRA.VolumeI.Order.OrderedSets.StrictOrder

universe u

/--
A strict-order relation starts as an endorelation: a binary relation comparing
two elements of the same carrier.

Logical form:

```lean
LRA.VolumeI.Relations.Endorelation Carrier
```
-/
abbrev Relation (Carrier : Type u) :=
  LRA.VolumeI.Relations.Endorelation Carrier

/--
A strict-order relation is an endorelation equipped with the theorem that it
satisfies the strict-order laws.

Logical form:

```lean
structure StrictOrderRelation (Carrier : Type u) where
  relation : Relation Carrier
  relationIsStrictOrder : LRA.VolumeI.Order.StrictOrder relation
```
-/
structure StrictOrderRelation (Carrier : Type u) where
  relation : Relation Carrier
  relationIsStrictOrder : LRA.VolumeI.Order.StrictOrder relation

end LRA.VolumeI.Order.OrderedSets.StrictOrder
