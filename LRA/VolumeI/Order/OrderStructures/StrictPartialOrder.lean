import LRA.VolumeI.Order.Relations

namespace LRA.VolumeI.Order

universe u

/--
Strict partial-order laws for an endorelation.

Logical form:

```lean
def StrictPartialOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  LRA.VolumeI.Relations.Irreflexive relation /\
    LRA.VolumeI.Relations.Transitive relation
```
-/
def StrictPartialOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  LRA.VolumeI.Relations.Irreflexive relation /\
    LRA.VolumeI.Relations.Transitive relation

end LRA.VolumeI.Order
