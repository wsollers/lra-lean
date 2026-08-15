import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Order.Lattices.Join.Definition

namespace LRA.Order.Lattices.Join

universe u

/--
Statement: Union is the join operation in the inclusion order on sets.

Logical form: `LRA.Order.Join (fun first second : Set Alpha => first ⊆ second) left right (left ∪ right)`.
-/
example
    {Alpha : Type u} (left right : Set Alpha) :
    LRA.Order.Join
      (fun first second : Set Alpha => first ⊆ second)
      left right (left ∪ right) := by
  sorry

end LRA.Order.Lattices.Join
