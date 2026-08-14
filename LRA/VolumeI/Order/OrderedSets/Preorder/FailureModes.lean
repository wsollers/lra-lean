import LRA.VolumeI.Order.OrderedSets.Preorder.Definition

namespace LRA.VolumeI.Order.OrderedSets.Preorder

universe u

/--
`FailsPreorder relation` says that an endorelation does not satisfy the
preorder laws.

Logical form:

```lean
Not (LRA.VolumeI.Order.Preorder relation)
```
-/
def FailsPreorder
    {Carrier : Type u}
    (relation : Relation Carrier) : Prop :=
  Not (LRA.VolumeI.Order.Preorder relation)

end LRA.VolumeI.Order.OrderedSets.Preorder
