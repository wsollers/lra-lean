import Mathlib.Data.Real.Basic
import Mathlib.Order.Interval.Set.Defs
import LRA.VolumeI.Order.Bounds.LeastElement.Definition

namespace LRA.Order

universe u v

/--
`FailsLeastElement`

Statement: A candidate fails when it is not a least element of the subset.

Logical form: `Not (LeastElement relation subset candidate)`.
-/
def FailsLeastElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (LeastElement relation subset candidate)

section RealOpenUnitInterval

/--
`ZeroFailsLeastElementOfOpenUnitInterval`

Statement: The endpoint zero is not a least element because it is omitted.

Logical form: `FailsLeastElement (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 0`.
-/
theorem ZeroFailsLeastElementOfOpenUnitInterval :
    FailsLeastElement
      (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 0 := by
  sorry

end RealOpenUnitInterval

end LRA.Order
