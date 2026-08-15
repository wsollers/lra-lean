import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Order.OrderedSets.WellOrder.Definition

namespace LRA.Order

universe u v

/--
`FailsWellOrder`

Statement: A relation fails to well-order the subsets represented by a backend.

Logical form: `Not (WellOrder SetObject relation)`.
-/
def FailsWellOrder
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (WellOrder SetObject relation)

/--
`IntegersAreNotWellOrdered`

Statement: The integers with their usual order are not well-ordered.

Logical form: `FailsWellOrder (Set Int) (fun left right : Int => left ≤ right)`.
-/
theorem IntegersAreNotWellOrdered :
    FailsWellOrder (Set Int) (fun left right : Int => left ≤ right) := by
  sorry

end LRA.Order
