import Mathlib.Data.Set.Finite.Basic
import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Order.Bounds.MinimalElement.Definition
import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition
import LRA.VolumeI.Order.Relations.StrictPart.Definition

namespace LRA.Order

universe u

/-- Every nonempty finite predicate subset of a partial order has a minimal element. -/
theorem NonemptyFiniteSubsetHasMinimalElement
    {Element : Type u}
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (subset : Set Element)
    (subsetIsFinite : subset.Finite)
    (subsetIsNonempty : exists element, element ∈ subset) :
    exists minimal, MinimalElement (StrictPart relation) subset minimal := by
  sorry

end LRA.Order
