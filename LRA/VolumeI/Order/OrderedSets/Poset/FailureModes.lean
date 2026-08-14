import LRA.VolumeI.Order.OrderedSets.Poset.Definition

namespace LRA.VolumeI.Order.OrderedSets.Poset

universe u

/--
`FailsPosetLaws relation` records that a relation fails at least one of the
three partial-order laws required for a poset.

Logical form:

```lean
Not (LRA.VolumeI.Order.PartialOrder relation)
```
-/
def FailsPosetLaws {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  Not (LRA.VolumeI.Order.PartialOrder relation)

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
  sorry

end LRA.VolumeI.Order.OrderedSets.Poset
