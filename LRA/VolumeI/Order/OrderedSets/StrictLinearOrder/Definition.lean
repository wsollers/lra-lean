import LRA.VolumeI.Order.OrderedSets.StrictOrder.Definition

namespace LRA.Order

universe u

/--
Strict-linear-order laws: a strict order together with exact trichotomy.

Exact trichotomy already implies irreflexivity. The `StrictOrder` conjunct is
retained because the uniform laws-bundle shape is more useful than a minimal
axiom list.

Logical form:

```lean
def StrictLinearOrder {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  StrictOrder relation /\
    LRA.Relation.ExactlyTrichotomous relation
```
-/
def StrictLinearOrder {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  StrictOrder relation /\
    LRA.Relation.ExactlyTrichotomous relation

end LRA.Order
