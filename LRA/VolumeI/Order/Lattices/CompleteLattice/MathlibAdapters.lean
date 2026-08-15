import Mathlib.Data.Finite.Defs
import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Order.Lattices.CompleteLattice.Definition
import LRA.VolumeI.Order.Lattices.Lattice.Definition

namespace LRA.Order

universe u

/-- Every nonempty finite lattice is complete for predicate subsets. -/
theorem FiniteLatticeIsComplete
    {Alpha : Type u} [Finite Alpha] [Nonempty Alpha]
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLattice : Lattice relation) :
    CompleteLattice (Set Alpha) relation := by
  sorry

end LRA.Order
