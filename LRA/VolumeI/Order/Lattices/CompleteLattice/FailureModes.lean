import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.LeastUpperBoundProperty.Definition
import LRA.VolumeI.Order.Lattices.CompleteLattice.Definition

namespace LRA.Order

/--
The integers have the least-upper-bound property for nonempty bounded-above
subsets but are not a complete lattice: unbounded subsets have no supremum.
-/
theorem IntegerLeastUpperBoundPropertyDoesNotImplyCompleteLattice :
    LeastUpperBoundProperty (Set Int) (fun left right : Int => left ≤ right) /\
      Not (CompleteLattice (Set Int) (fun left right : Int => left ≤ right)) := by
  sorry

end LRA.Order
