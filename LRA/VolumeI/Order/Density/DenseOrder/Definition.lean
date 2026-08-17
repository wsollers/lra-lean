import LRA.VolumeI.Order.OrderedSets.StrictOrder.Definition

namespace LRA.Order

universe u

/--
A dense order is a strict order with a point strictly between every related
pair. Density is intentionally imposed on the strict relation; imposing it on
a reflexive relation would be vacuous.

Logical form:

```lean
def DenseOrder {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha) : Prop :=
  StrictOrder relation /\ LRA.Relation.Dense relation
```
-/
def DenseOrder {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha) : Prop :=
  StrictOrder relation /\ LRA.Relation.Dense relation

/-!
Native density law certificate over Lean's `LT` machine.

The relation-level `DenseOrder` predicate above remains the canonical
relation-theoretic order-density concept. `DenseOrderLaw` is the native
certificate surface used by concrete carriers.
-/

class DenseOrderLaw (R : Type u) [LT R] : Prop where
  ExistsBetween :
    forall a b : R, a < b -> exists middle : R, a < middle /\ middle < b

section Wrappers

variable {R : Type u}

theorem ExistsBetween [LT R] [DenseOrderLaw R] :
    forall a b : R, a < b -> exists middle : R, a < middle /\ middle < b :=
  DenseOrderLaw.ExistsBetween

end Wrappers

end LRA.Order
