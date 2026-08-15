import LRA.VolumeI.Order.Relations.OrderRelation.Definition

namespace LRA.Order

universe u

/--
Preorder laws for an endorelation.

Logical form:

```lean
def Preorder {Alpha : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Alpha) :
    Prop :=
  LRA.Relation.Reflexive relation /\
    LRA.Relation.Transitive relation
```
-/
def Preorder {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  LRA.Relation.Reflexive relation /\
    LRA.Relation.Transitive relation

end LRA.Order

namespace LRA.Order.OrderedSets.Preorder

/--
A preorder is an endorelation satisfying reflexivity and transitivity.

Logical form:

```lean
LRA.Order.Preorder relation
```
-/
structure PreorderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  isPreorder : LRA.Order.Preorder relation

end LRA.Order.OrderedSets.Preorder
