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
  sorry

end LRA.VolumeI.Order.OrderedSets.Preorder
