import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.BoundedBelow.Definition

namespace LRA.Order

universe u v

/--
`FailsBoundedBelow`

Statement: A represented subset fails boundedness below when it has no lower bound.

Logical form: `Not (BoundedBelow relation subset)`.
-/
def FailsBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (BoundedBelow relation subset)

section IntegerUniverse

/--
`IntegerUniverseFailsBoundedBelow`

Statement: The integers are not bounded below in their usual order.

Logical form: `FailsBoundedBelow (fun left right : Int => left ≤ right) (Set.univ : Set Int)`.
-/
theorem IntegerUniverseFailsBoundedBelow :
    FailsBoundedBelow (fun left right : Int => left ≤ right) (Set.univ : Set Int) := by
  sorry

end IntegerUniverse

end LRA.Order
