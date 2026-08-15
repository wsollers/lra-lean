import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.Infimum.Definition

namespace LRA.Order

universe u v

/--
`FailsInfimum`

Statement: A represented subset fails to have an infimum when no element satisfies the predicate.

Logical form: `Not (Exists fun candidate => Infimum relation subset candidate)`.
-/
def FailsInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (Exists fun candidate => Infimum relation subset candidate)

section IntegerEmptySet

/--
`EmptyIntegerSetFailsInfimum`

Statement: The empty set has no infimum in the integers, which have no top element.

Logical form: `FailsInfimum (fun left right : Int => left ≤ right) (∅ : Set Int)`.
-/
theorem EmptyIntegerSetFailsInfimum :
    FailsInfimum (fun left right : Int => left ≤ right) (∅ : Set Int) := by
  sorry

end IntegerEmptySet

end LRA.Order
