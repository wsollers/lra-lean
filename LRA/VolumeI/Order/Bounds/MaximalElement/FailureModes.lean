import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.GreatestElement.Definition
import LRA.VolumeI.Order.Bounds.MaximalElement.Definition
import LRA.VolumeI.Order.Relation.StrictPart.Definition

namespace LRA.Order

universe u v

/--
`MaximalityFailsToImplyGreatest`

Statement: A candidate is maximal for the strict relation but is not greatest
for the corresponding non-strict relation.

Logical form: `MaximalElement strictRelation subset candidate ∧ Not (GreatestElement nonStrictRelation subset candidate)`.
-/
def MaximalityFailsToImplyGreatest
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (strictRelation nonStrictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  MaximalElement strictRelation subset candidate /\
    Not (GreatestElement nonStrictRelation subset candidate)

/--
`BooleanAntichainHasDistinctMaximalElementsButNoGreatest`

Statement: In the two-element antichain, both distinct elements are maximal
but neither is greatest.

Logical form: both Boolean values satisfy `MaximalityFailsToImplyGreatest`,
and `false ≠ true`.
-/
theorem BooleanAntichainHasDistinctMaximalElementsButNoGreatest :
    MaximalityFailsToImplyGreatest
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) false /\
      MaximalityFailsToImplyGreatest
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) true /\
      false ≠ true := by
  sorry

end LRA.Order
