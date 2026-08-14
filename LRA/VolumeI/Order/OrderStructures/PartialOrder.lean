import LRA.VolumeI.Order.OrderStructures.Preorder

namespace LRA.VolumeI.Order

universe u

/--
Partial-order laws for an endorelation.

Logical form:

```lean
def PartialOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  LRA.VolumeI.Relations.Reflexive relation /\
    LRA.VolumeI.Relations.Antisymmetric relation /\
      LRA.VolumeI.Relations.Transitive relation
```
-/
def PartialOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  LRA.VolumeI.Relations.Reflexive relation /\
    LRA.VolumeI.Relations.Antisymmetric relation /\
      LRA.VolumeI.Relations.Transitive relation

end LRA.VolumeI.Order
