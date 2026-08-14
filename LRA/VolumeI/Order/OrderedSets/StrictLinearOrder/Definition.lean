import LRA.VolumeI.Order.OrderedSets.StrictOrder.Definition

namespace LRA.VolumeI.Order

universe u

/--
Strict-linear-order laws: a strict order together with exact trichotomy.

Exact trichotomy already implies irreflexivity. The `StrictOrder` conjunct is
retained because the uniform laws-bundle shape is more useful than a minimal
axiom list.

Logical form:

```lean
def StrictLinearOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  StrictOrder relation /\
    LRA.VolumeI.Relations.ExactlyTrichotomous relation
```
-/
def StrictLinearOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  StrictOrder relation /\
    LRA.VolumeI.Relations.ExactlyTrichotomous relation

end LRA.VolumeI.Order
