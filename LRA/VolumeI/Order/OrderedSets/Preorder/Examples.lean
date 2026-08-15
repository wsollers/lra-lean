import LRA.VolumeI.Order.OrderedSets.Preorder.Definition

namespace LRA.Order.OrderedSets.Preorder

/--
`BooleanUniversalPreorder`

Statement: The universal relation on booleans is a preorder.

Logical form:

```lean
PreorderRelation Bool
```
-/
def BooleanUniversalPreorder : PreorderRelation Bool where
  relation := fun _ _ => True
  isPreorder := by
    sorry

/--
Statement: The packaged relation exposes the expected preorder proposition.

Logical form: `LRA.Order.Preorder BooleanUniversalPreorder.relation`.
-/
example : LRA.Order.Preorder BooleanUniversalPreorder.relation := by
  exact BooleanUniversalPreorder.isPreorder

end LRA.Order.OrderedSets.Preorder
