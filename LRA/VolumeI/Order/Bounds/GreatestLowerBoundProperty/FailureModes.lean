import Mathlib.Data.Rat.Defs
import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.GreatestLowerBoundProperty.Definition

namespace LRA.Order

universe u v

/--
`FailsGreatestLowerBoundProperty`

Statement: A backend order fails when some nonempty bounded-below subset has no infimum.

Logical form: `Not (GreatestLowerBoundProperty SetObject relation)`.
-/
def FailsGreatestLowerBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (GreatestLowerBoundProperty SetObject relation)

section RationalOrder

/--
`RationalOrderFailsGreatestLowerBoundProperty`

Statement: The rationals fail the greatest-lower-bound property.

Logical form: `FailsGreatestLowerBoundProperty (Set Rat) (fun left right : Rat => left ≤ right)`.
-/
theorem RationalOrderFailsGreatestLowerBoundProperty :
    FailsGreatestLowerBoundProperty (Set Rat)
      (fun left right : Rat => left ≤ right) := by
  sorry

end RationalOrder

end LRA.Order
