import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Lattices.CompleteLattice.Definition

namespace LRA.VolumeI.Order

universe u

/-- A complete lattice over all predicate subsets has bottom and top elements. -/
theorem CompleteLatticeHasBottomAndTop
    {Element : Type u}
    {relation : LRA.VolumeI.Relations.Endorelation Element}
    (relationIsCompleteLattice : CompleteLattice (Set Element) relation) :
    (exists bottom, forall element, relation bottom element) /\
      (exists top, forall element, relation element top) := by
  sorry

/--
For predicate subsets, a partial order with suprema for all subsets is a
complete lattice; infima arise as suprema of sets of lower bounds.
-/
theorem AllSupremaImplyCompleteLattice
    {Element : Type u}
    {relation : LRA.VolumeI.Relations.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (everySubsetHasSupremum :
      forall subset : Set Element,
        exists supremum, Supremum relation subset supremum) :
    CompleteLattice (Set Element) relation := by
  sorry

end LRA.VolumeI.Order
