import LRA.VolumeI.Order.OrderedSets.StrictOrder.Definition

namespace LRA.VolumeI.Order

universe u

/--
Compatibility name for strict-order laws on an endorelation.

Logical form:

```lean
def StrictPartialOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  StrictOrder relation
```
-/
abbrev StrictPartialOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  StrictOrder relation

end LRA.VolumeI.Order
