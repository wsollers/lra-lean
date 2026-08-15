import LRA.VolumeI.Order.OrderedSets.StrictOrder.Examples

namespace LRA.Order.OrderedSets.StrictOrder

universe u

/--
`FailsStrictOrder`

Statement: An endorelation does not satisfy the strict-order laws.

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
`NatNonStrictOrderFailsStrictOrder`

Statement: The usual non-strict order on natural numbers is not a strict order, because
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

/--
`ImmediateSuccessorRelation`

Statement: The immediate-successor relation holds exactly when the right
natural number is one more than the left.

Logical form: `right = left + 1`.
-/
def ImmediateSuccessorRelation : LRA.Relation.Endorelation Nat :=
  fun left right => right = left + 1

/--
`ImmediateSuccessorFailsStrictOrder`

Statement: The immediate-successor relation is irreflexive but not transitive,
so irreflexivity alone does not make a strict order.

Logical form: irreflexivity holds, transitivity fails, and
`FailsStrictOrder ImmediateSuccessorRelation` holds.
-/
theorem ImmediateSuccessorFailsStrictOrder :
    LRA.Relation.Irreflexive ImmediateSuccessorRelation /\
      Not (LRA.Relation.Transitive ImmediateSuccessorRelation) /\
      FailsStrictOrder ImmediateSuccessorRelation := by
  sorry

end LRA.Order.OrderedSets.StrictOrder
