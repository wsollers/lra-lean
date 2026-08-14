import LRA.VolumeI.Order.OrderedSets.Poset.Definition

namespace LRA.VolumeI.Order.OrderedSets.Poset

universe u

/--
`FailsPosetLaws relation` records that a relation fails at least one of the
three partial-order laws required for a poset.

Logical form:

```lean
Not (LRA.VolumeI.Order.PartialOrder relation)
```
-/
def FailsPosetLaws {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  Not (LRA.VolumeI.Order.PartialOrder relation)

end LRA.VolumeI.Order.OrderedSets.Poset
