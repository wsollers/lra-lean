import LRA.VolumeI.Order.OrderedSets.StrictOrder.Examples

namespace LRA.Order.OrderedSets.StrictOrder

universe u

/--
`FailsStrictOrder relation` says that an endorelation does not satisfy the
strict-order laws.

Logical form:

```lean
Not (LRA.Order.StrictOrder relation)
```
-/
def FailsStrictOrder
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Order.StrictOrder relation)

/--
The usual non-strict order on natural numbers is not a strict order, because
it is not irreflexive.

Logical form:

```lean
FailsStrictOrder (fun left right : Nat => left <= right)
```
-/
theorem NatNonStrictOrderFailsStrictOrder :
    LRA.Relation.Transitive (fun left right : Nat => left <= right) /\
      Not (LRA.Relation.Irreflexive
        (fun left right : Nat => left <= right)) /\
      FailsStrictOrder (fun left right : Nat => left <= right) := by
  sorry

/-- The immediate-successor relation is irreflexive but not transitive. -/
def ImmediateSuccessorRelation : LRA.Relation.Endorelation Nat :=
  fun left right => right = left + 1

/-- Irreflexivity alone does not make a strict order. -/
theorem ImmediateSuccessorFailsStrictOrder :
    LRA.Relation.Irreflexive ImmediateSuccessorRelation /\
      Not (LRA.Relation.Transitive ImmediateSuccessorRelation) /\
      FailsStrictOrder ImmediateSuccessorRelation := by
  sorry

end LRA.Order.OrderedSets.StrictOrder
