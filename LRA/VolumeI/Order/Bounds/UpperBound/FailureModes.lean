import Mathlib.Data.Real.Basic
import Mathlib.Order.Interval.Set.Defs
import LRA.VolumeI.Order.Bounds.UpperBound.Definition

namespace LRA.Order

universe u v

/--
`FailsUpperBound`

Statement: A proposed element fails when it is not an upper bound of the subset.

Logical form: `Not (UpperBound relation subset candidate)`.
-/
def FailsUpperBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (UpperBound relation subset candidate)

section RealOpenUnitInterval

/--
`ZeroFailsUpperBoundOfOpenUnitInterval`

Statement: Zero fails as an upper bound of the open unit interval.

Logical form: `FailsUpperBound (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 0`.
-/
theorem ZeroFailsUpperBoundOfOpenUnitInterval :
    FailsUpperBound (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 0 := by
  sorry

end RealOpenUnitInterval

end LRA.Order
