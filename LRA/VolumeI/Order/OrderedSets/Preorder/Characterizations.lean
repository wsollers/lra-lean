import LRA.VolumeI.Order.OrderedSets.Preorder.Definition

namespace LRA.VolumeI.Order.OrderedSets.Preorder

/--
Projection accessor: the relation packaged by a preorder is reflexive.

Logical form:

```lean
LRA.VolumeI.Relations.Reflexive preorder.relation
```
-/
theorem PreorderRelationIsReflexive
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.VolumeI.Relations.Reflexive preorder.relation := by
  sorry

/--
Projection accessor: the relation packaged by a preorder is transitive.

Logical form:

```lean
LRA.VolumeI.Relations.Transitive preorder.relation
```
-/
theorem PreorderRelationIsTransitive
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.VolumeI.Relations.Transitive preorder.relation := by
  sorry

end LRA.VolumeI.Order.OrderedSets.Preorder
