import LRA.VolumeI.Order.OrderedSets.Preorder.Definition

namespace LRA.Order.OrderedSets.Preorder

/--
Projection accessor: the relation packaged by a preorder is reflexive.

Logical form:

```lean
LRA.Relation.Reflexive preorder.relation
```
-/
theorem PreorderRelationIsReflexive
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.Reflexive preorder.relation :=
  preorder.isPreorder.1

/--
Projection accessor: the relation packaged by a preorder is transitive.

Logical form:

```lean
LRA.Relation.Transitive preorder.relation
```
-/
theorem PreorderRelationIsTransitive
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.Transitive preorder.relation :=
  preorder.isPreorder.2

end LRA.Order.OrderedSets.Preorder
