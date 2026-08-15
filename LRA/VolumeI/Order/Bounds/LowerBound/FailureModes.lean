import Mathlib.Data.Real.Basic
import Mathlib.Order.Interval.Set.Defs
import LRA.VolumeI.Order.Bounds.LowerBound.Definition

namespace LRA.Order

universe u v

/--
`FailsLowerBound`

Statement: A proposed element fails when it is not a lower bound of the subset.

Logical form: `Not (LowerBound relation subset candidate)`.
-/
def FailsLowerBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (LowerBound relation subset candidate)

section RealOpenUnitInterval

/--
`OneFailsLowerBoundOfOpenUnitInterval`

Statement: One fails as a lower bound of the open unit interval.

Logical form: `FailsLowerBound (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 1`.
-/
theorem OneFailsLowerBoundOfOpenUnitInterval :
    FailsLowerBound (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 1 := by
  sorry

end RealOpenUnitInterval

end LRA.Order
