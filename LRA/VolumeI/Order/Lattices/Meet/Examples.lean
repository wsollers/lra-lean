import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Order.Lattices.Meet.Definition

namespace LRA.Order.Lattices.Meet

universe u

/--
Statement: Intersection is the meet operation in the inclusion order on sets.

Logical form: `LRA.Order.Meet (fun first second : Set Alpha => first ⊆ second) left right (left ∩ right)`.
-/
example
    {Alpha : Type u} (left right : Set Alpha) :
    LRA.Order.Meet
      (fun first second : Set Alpha => first ⊆ second)
      left right (left ∩ right) := by
  sorry

end LRA.Order.Lattices.Meet
