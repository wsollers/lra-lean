import Mathlib.Data.Set.Finite.Basic
import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Order.Bounds.MaximalElement.Definition
import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition
import LRA.VolumeI.Order.Relation.StrictPart.Definition

namespace LRA.Order

universe u

/-- Every nonempty finite predicate subset of a partial order has a maximal element. -/
theorem NonemptyFiniteSubsetHasMaximalElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists maximal, MaximalElement (StrictPart relation) subset maximal := by
  sorry

end LRA.Order
