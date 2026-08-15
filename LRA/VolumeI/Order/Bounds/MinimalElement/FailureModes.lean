import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.LeastElement.Definition
import LRA.VolumeI.Order.Bounds.MinimalElement.Definition
import LRA.VolumeI.Order.Relations.StrictPart.Definition

namespace LRA.Order

universe u v

/--
`MinimalityFailsToImplyLeast`

Statement: A candidate is minimal for the strict relation but is not least for
the corresponding non-strict relation.

Logical form: `MinimalElement strictRelation subset candidate ∧ Not (LeastElement nonStrictRelation subset candidate)`.
-/
def MinimalityFailsToImplyLeast
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (strictRelation nonStrictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  MinimalElement strictRelation subset candidate /\
    Not (LeastElement nonStrictRelation subset candidate)

/--
`BooleanAntichainHasDistinctMinimalElementsButNoLeast`

Statement: In the two-element antichain, both distinct elements are minimal
but neither is least.

Logical form: both Boolean values satisfy `MinimalityFailsToImplyLeast`, and
`false ≠ true`.
-/
theorem BooleanAntichainHasDistinctMinimalElementsButNoLeast :
    MinimalityFailsToImplyLeast
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) false /\
      MinimalityFailsToImplyLeast
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) true /\
      false ≠ true := by
  sorry

end LRA.Order
