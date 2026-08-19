import LRA.Order.Bounds.GreatestLowerBoundProperty.Definition
import LRA.Order.Bounds.Infimum.Theorems

namespace LRA.Order

universe u v

/-- The greatest-lower-bound property gives a unique infimum in an antisymmetric relation. -/
theorem GreatestLowerBoundPropertyGivesUniqueInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    (relationHasGreatestLowerBounds :
      GreatestLowerBoundProperty SetObject relation)
    (subset : SetObject)
    (subsetIsNonempty : exists element, element ∈ subset)
    (subsetIsBoundedBelow : BoundedBelow relation subset) :
    exists infimum,
      Infimum relation subset infimum /\
        forall other,
          Infimum relation subset other -> other = infimum := by
  sorry

end LRA.Order
