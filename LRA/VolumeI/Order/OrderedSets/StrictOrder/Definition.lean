import LRA.VolumeI.Order.Relations.OrderRelation.Definition

namespace LRA.Order

universe u

/--
Strict-order laws for an endorelation.

Logical form:

```lean
def StrictOrder {Alpha : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Alpha) :
    Prop :=
  LRA.Relation.Irreflexive relation /\
    LRA.Relation.Transitive relation
```
-/
def StrictOrder {Alpha : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Alpha) :
    Prop :=
  LRA.Relation.Irreflexive relation /\
    LRA.Relation.Transitive relation

end LRA.Order

namespace LRA.Order.OrderedSets.StrictOrder

universe u

/--
A strict-order relation is an endorelation equipped with the theorem that it
satisfies the strict-order laws.

Logical form:

```lean
structure StrictOrderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  relationIsStrictOrder : LRA.Order.StrictOrder relation
```
-/
structure StrictOrderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  relationIsStrictOrder : LRA.Order.StrictOrder relation

end LRA.Order.OrderedSets.StrictOrder
