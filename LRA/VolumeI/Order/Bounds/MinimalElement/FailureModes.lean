import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.LeastElement.Definition
import LRA.VolumeI.Order.Bounds.MinimalElement.Definition
import LRA.VolumeI.Order.Relations.StrictPart.Definition

namespace LRA.Order

/-- In the two-element antichain, minimal elements are neither unique nor least. -/
theorem BooleanAntichainHasDistinctMinimalElementsButNoLeast :
    MinimalElement
        (StrictPart (fun left right : Bool => left = right))
        (Set.univ : Set Bool) false /\
      MinimalElement
        (StrictPart (fun left right : Bool => left = right))
        (Set.univ : Set Bool) true /\
      false ≠ true /\
      Not (LeastElement (fun left right : Bool => left = right)
        (Set.univ : Set Bool) false) /\
      Not (LeastElement (fun left right : Bool => left = right)
        (Set.univ : Set Bool) true) := by
  sorry

end LRA.Order
