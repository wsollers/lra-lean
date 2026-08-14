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
    refine And.intro ?reflexive ?transitive
    · intro element
      trivial
    · intro first second third firstBelowSecond secondBelowThird
      trivial

end LRA.VolumeI.Order.OrderedSets.Preorder
