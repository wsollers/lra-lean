import Mathlib.Data.Rat.Defs
import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.LeastUpperBoundProperty.Definition

namespace LRA.Order

universe u v

/--
`FailsLeastUpperBoundProperty`

Statement: A backend order fails when some nonempty bounded-above subset has no supremum.

Logical form: `Not (LeastUpperBoundProperty SetObject relation)`.
-/
def FailsLeastUpperBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (LeastUpperBoundProperty SetObject relation)

section RationalOrder

/--
`RationalOrderFailsLeastUpperBoundProperty`

Statement: The rationals fail the least-upper-bound property.

Logical form: `FailsLeastUpperBoundProperty (Set Rat) (fun left right : Rat => left ≤ right)`.
-/
theorem RationalOrderFailsLeastUpperBoundProperty :
    FailsLeastUpperBoundProperty (Set Rat)
      (fun left right : Rat => left ≤ right) := by
  sorry

end RationalOrder

end LRA.Order
