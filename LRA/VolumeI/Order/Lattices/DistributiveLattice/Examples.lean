import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Order.Lattices.DistributiveLattice.Definition

namespace LRA.Order

universe u

/-- Predicate subsets ordered by inclusion form a distributive lattice. -/
theorem PredicatePowerSetIsDistributiveLattice
    {Alpha : Type u} :
    DistributiveLattice (fun left right : Set Alpha => left ⊆ right) := by
  sorry

end LRA.Order
