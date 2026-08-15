import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Order.Lattices.Join.Definition

namespace LRA.Order.Lattices.Join

universe u

/-- Union is the join operation in the inclusion order on sets. -/
theorem SetUnionIsJoin
    {Alpha : Type u} (left right : Set Alpha) :
    LRA.Order.Join
      (fun first second : Set Alpha => first ⊆ second)
      left right (left ∪ right) := by
  sorry

end LRA.Order.Lattices.Join
