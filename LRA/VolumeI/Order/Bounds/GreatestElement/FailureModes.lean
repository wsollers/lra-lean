import Mathlib.Data.Real.Basic
import Mathlib.Order.Interval.Set.Defs
import LRA.VolumeI.Order.Bounds.GreatestElement.Definition

namespace LRA.Order

universe u v

/--
`FailsGreatestElement`

Statement: A candidate fails when it is not a greatest element of the subset.

Logical form: `Not (GreatestElement relation subset candidate)`.
-/
def FailsGreatestElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (GreatestElement relation subset candidate)

section RealOpenUnitInterval

/--
`OneFailsGreatestElementOfOpenUnitInterval`

Statement: The endpoint one is not a greatest element because it is omitted.

Logical form: `FailsGreatestElement (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 1`.
-/
theorem OneFailsGreatestElementOfOpenUnitInterval :
    FailsGreatestElement
      (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 1 := by
  sorry

end RealOpenUnitInterval

end LRA.Order
