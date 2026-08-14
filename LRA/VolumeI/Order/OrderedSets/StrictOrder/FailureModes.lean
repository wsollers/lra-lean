import LRA.VolumeI.Order.OrderedSets.StrictOrder.Examples

namespace LRA.VolumeI.Order.OrderedSets.StrictOrder

universe u

/--
`FailsStrictOrder relation` says that an endorelation does not satisfy the
strict-order laws.

Logical form:

```lean
Not (LRA.VolumeI.Order.StrictOrder relation)
```
-/
def FailsStrictOrder
    {Carrier : Type u}
    (relation : Relation Carrier) : Prop :=
  Not (LRA.VolumeI.Order.StrictOrder relation)

/--
The usual non-strict order on natural numbers is not a strict order, because
it is not irreflexive.

Logical form:

```lean
FailsStrictOrder (fun left right : Nat => left <= right)
```
-/
theorem NatNonStrictOrderFailsStrictOrder :
    FailsStrictOrder (fun left right : Nat => left <= right) := by
  sorry

end LRA.VolumeI.Order.OrderedSets.StrictOrder
