import LRA.VolumeI.Order.OrderedSets.Preorder.Examples

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
