import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.BoundedAbove.Definition

namespace LRA.Order

universe u v

/--
`FailsBoundedAbove`

Statement: A represented subset fails boundedness above when it has no upper bound.

Logical form: `Not (BoundedAbove relation subset)`.
-/
def FailsBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (BoundedAbove relation subset)

section IntegerUniverse

/--
`IntegerUniverseFailsBoundedAbove`

Statement: The integers are not bounded above in their usual order.

Logical form: `FailsBoundedAbove (fun left right : Int => left ≤ right) (Set.univ : Set Int)`.
-/
theorem IntegerUniverseFailsBoundedAbove :
    FailsBoundedAbove (fun left right : Int => left ≤ right) (Set.univ : Set Int) := by
  sorry

end IntegerUniverse

end LRA.Order
