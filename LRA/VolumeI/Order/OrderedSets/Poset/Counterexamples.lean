import LRA.VolumeI.Order.OrderedSets.Poset.FailureModes

namespace LRA.VolumeI.Order.OrderedSets.Poset

/--
The usual strict order on natural numbers is not a poset order, because it is
not reflexive.

Logical form:

```lean
FailsPosetLaws (fun left right : Nat => left < right)
```
-/
theorem NatStrictOrderFailsPosetLaws :
    FailsPosetLaws (fun left right : Nat => left < right) := by
  intro strictOrderIsPartialOrder
  exact Nat.lt_irrefl 0 (strictOrderIsPartialOrder.1 0)

end LRA.VolumeI.Order.OrderedSets.Poset
