import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.Supremum.Definition
import LRA.VolumeI.Order.OrderedSets.Preorder.Definition

namespace LRA.Order

/--
Antisymmetry is necessary for uniqueness: in the universal preorder on
`Bool`, both distinct elements are suprema of the full subset.
-/
theorem SupremaNeedNotBeUniqueInPreorder :
    Preorder (fun _ _ : Bool => True) /\
      exists first second : Bool,
        first ≠ second /\
          Supremum (fun _ _ : Bool => True) (Set.univ : Set Bool) first /\
            Supremum (fun _ _ : Bool => True) (Set.univ : Set Bool) second := by
  sorry

end LRA.Order
