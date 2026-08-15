import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.Bounded.Definition

namespace LRA.Order

universe u v

/--
`FailsBounded`

Statement: A represented subset fails boundedness when it lacks an upper or lower bound.

Logical form: `Not (Bounded relation subset)`.
-/
def FailsBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (Bounded relation subset)

section IntegerUniverse

/--
`IntegerUniverseFailsBounded`

Statement: The integers are not bounded in their usual order.

Logical form: `FailsBounded (fun left right : Int => left ≤ right) (Set.univ : Set Int)`.
-/
theorem IntegerUniverseFailsBounded :
    FailsBounded (fun left right : Int => left ≤ right) (Set.univ : Set Int) := by
  sorry

end IntegerUniverse

end LRA.Order
