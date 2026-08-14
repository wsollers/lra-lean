import LRA.VolumeI.Order.OrderedSets.StrictOrder.Definition

namespace LRA.VolumeI.Order

universe u

/--
Strict linear order laws: a strict order together with exact trichotomy.

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

/-- Exact trichotomy by itself forces irreflexivity. -/
theorem ExactlyTrichotomousImpliesIrreflexive
    {Alpha : Type u}
    {relation : LRA.VolumeI.Relations.Endorelation Alpha}
    (relationIsExactlyTrichotomous :
      LRA.VolumeI.Relations.ExactlyTrichotomous relation) :
    LRA.VolumeI.Relations.Irreflexive relation := by
  sorry

end LRA.VolumeI.Order
