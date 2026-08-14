import LRA.VolumeI.Order.OrderedSets.Preorder.Examples

namespace LRA.VolumeI.Order.OrderedSets.Preorder

/--
The universal preorder on booleans is not antisymmetric.

Logical form:

```lean
Not (LRA.VolumeI.Relations.Antisymmetric BooleanUniversalPreorder.relation)
```
-/
theorem BooleanUniversalPreorderIsNotAntisymmetric :
    Not (LRA.VolumeI.Relations.Antisymmetric
      BooleanUniversalPreorder.relation) := by
  intro universalRelationIsAntisymmetric
  have trueEqualsFalse : true = false :=
    universalRelationIsAntisymmetric true false trivial trivial
  cases trueEqualsFalse

end LRA.VolumeI.Order.OrderedSets.Preorder
