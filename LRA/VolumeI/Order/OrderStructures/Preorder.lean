import LRA.VolumeI.Order.Relations

namespace LRA.VolumeI.Order

universe u

/--
Preorder laws for an endorelation.

Logical form:

```lean
def Preorder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  LRA.VolumeI.Relations.Reflexive relation /\
    LRA.VolumeI.Relations.Transitive relation
```
-/
def Preorder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  LRA.VolumeI.Relations.Reflexive relation /\
    LRA.VolumeI.Relations.Transitive relation

end LRA.VolumeI.Order
