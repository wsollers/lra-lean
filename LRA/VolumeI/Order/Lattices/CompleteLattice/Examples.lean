import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Order.Lattices.CompleteLattice.Definition
import LRA.VolumeI.Order.Lattices.Lattice.Definition

namespace LRA.Order

universe u

/--
Statement: Predicate subsets ordered by inclusion form a complete lattice.

Logical form: `CompleteLattice (Set (Set Alpha)) (fun left right : Set Alpha => left ⊆ right)`.
-/
example
    {Alpha : Type u} :
    CompleteLattice (Set (Set Alpha))
      (fun left right : Set Alpha => left ⊆ right) := by
  sorry

end LRA.Order
