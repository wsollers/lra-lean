import LRA.VolumeI.Order.OrderedSets.Preorder.Definition

namespace LRA.VolumeI.Order.OrderedSets.Preorder

/--
The universal relation on booleans is a preorder.

Logical form:

```lean
PreorderRelation Bool
```
-/
def BooleanUniversalPreorder : PreorderRelation Bool where
  relation := fun _ _ => True
  isPreorder := by
    sorry

end LRA.VolumeI.Order.OrderedSets.Preorder
