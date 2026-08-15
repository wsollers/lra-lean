import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Order.Lattices.CompleteLattice.Definition
import LRA.VolumeI.Order.Lattices.Lattice.Definition

namespace LRA.Order

universe u

/-- Predicate subsets ordered by inclusion form a complete lattice. -/
theorem PredicatePowerSetIsCompleteLattice
    {Alpha : Type u} :
    CompleteLattice (Set (Set Alpha))
      (fun left right : Set Alpha => left ⊆ right) := by
  sorry

end LRA.Order
