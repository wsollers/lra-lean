import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Order.Lattices.DistributiveLattice.Definition

namespace LRA.Order

universe u

/--
Statement: Predicate subsets ordered by inclusion form a distributive lattice.

Logical form: `DistributiveLattice (fun left right : Set Alpha => left ⊆ right)`.
-/
example
    {Alpha : Type u} :
    DistributiveLattice (fun left right : Set Alpha => left ⊆ right) := by
  sorry

end LRA.Order
