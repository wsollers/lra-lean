import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.GreatestElement.Definition
import LRA.VolumeI.Order.Bounds.MaximalElement.Definition
import LRA.VolumeI.Order.Relations.StrictPart.Definition

namespace LRA.Order

/--
In the two-element antichain, maximal elements are neither unique nor
greatest. This shows why totality is required to promote maximal to greatest.
-/
theorem BooleanAntichainHasDistinctMaximalElementsButNoGreatest :
    MaximalElement
        (StrictPart (fun left right : Bool => left = right))
        (Set.univ : Set Bool) false /\
      MaximalElement
        (StrictPart (fun left right : Bool => left = right))
        (Set.univ : Set Bool) true /\
      false ≠ true /\
      Not (GreatestElement (fun left right : Bool => left = right)
        (Set.univ : Set Bool) false) /\
      Not (GreatestElement (fun left right : Bool => left = right)
        (Set.univ : Set Bool) true) := by
  sorry

end LRA.Order
