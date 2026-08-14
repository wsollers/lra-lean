import LRA.VolumeI.Order.Relations.OrderRelation.Definition

namespace LRA.VolumeI.Order

universe u

/--
Preorder laws for an endorelation.

Logical form:

```lean
def Preorder {Alpha : Type u}
    (relation : LRA.VolumeI.Order.OrderedSets.OrderRelation Alpha) :
    Prop :=
  LRA.VolumeI.Relations.Reflexive relation /\
    LRA.VolumeI.Relations.Transitive relation
```
-/
def Preorder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  LRA.VolumeI.Relations.Reflexive relation /\
    LRA.VolumeI.Relations.Transitive relation

end LRA.VolumeI.Order

namespace LRA.VolumeI.Order.OrderedSets.Preorder

/--
A preorder is an endorelation satisfying reflexivity and transitivity.

Logical form:

```lean
LRA.VolumeI.Order.Preorder relation
```
-/
structure PreorderRelation (Carrier : Type u) where
  relation : LRA.VolumeI.Order.OrderedSets.OrderRelation Carrier
  isPreorder : LRA.VolumeI.Order.Preorder relation

end LRA.VolumeI.Order.OrderedSets.Preorder
