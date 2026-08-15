import LRA.VolumeI.Order.Bounds.LeastUpperBoundProperty.Definition
import LRA.VolumeI.Order.Bounds.Supremum.Theorems

namespace LRA.Order

universe u v

/-- The least-upper-bound property gives a unique supremum in an antisymmetric relation. -/
theorem LeastUpperBoundPropertyGivesUniqueSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    (relationHasLeastUpperBounds :
      LeastUpperBoundProperty SetObject relation)
    (subset : SetObject)
    (subsetIsNonempty : exists element, element ∈ subset)
    (subsetIsBoundedAbove : BoundedAbove relation subset) :
    exists supremum,
      Supremum relation subset supremum /\
        forall other,
          Supremum relation subset other -> other = supremum := by
  sorry

end LRA.Order
