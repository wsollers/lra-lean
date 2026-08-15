import LRA.VolumeI.Order.OrderedSets.Poset.Definition

namespace LRA.Order.OrderedSets.Poset

universe u

/--
`FailsPosetLaws relation` records that a relation fails at least one of the
three partial-order laws required for a poset.

Logical form:

```lean
Not (LRA.Order.PartialOrder relation)
```
-/
def FailsPosetLaws {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha) : Prop :=
  Not (LRA.Order.PartialOrder relation)

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

end LRA.Order.OrderedSets.Poset
