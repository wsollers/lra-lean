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
    (relation : LRA.VolumeI.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
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
    LRA.VolumeI.Relations.Transitive (fun left right : Nat => left <= right) /\
      Not (LRA.VolumeI.Relations.Irreflexive
        (fun left right : Nat => left <= right)) /\
      FailsStrictOrder (fun left right : Nat => left <= right) := by
  sorry

/-- The immediate-successor relation is irreflexive but not transitive. -/
def ImmediateSuccessorRelation : LRA.VolumeI.Relations.Endorelation Nat :=
  fun left right => right = left + 1

/-- Irreflexivity alone does not make a strict order. -/
theorem ImmediateSuccessorFailsStrictOrder :
    LRA.VolumeI.Relations.Irreflexive ImmediateSuccessorRelation /\
      Not (LRA.VolumeI.Relations.Transitive ImmediateSuccessorRelation) /\
      FailsStrictOrder ImmediateSuccessorRelation := by
  sorry

end LRA.VolumeI.Order.OrderedSets.StrictOrder
