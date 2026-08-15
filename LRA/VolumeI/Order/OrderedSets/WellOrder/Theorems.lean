import LRA.VolumeI.Order.OrderedSets.WellOrder.Definition

namespace LRA.Order

universe u v

/-- Every nonempty represented subset of a well-order has a least element. -/
theorem WellOrderingPrinciple
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {nonStrictRelation : LRA.Relation.Endorelation Element}
    (nonStrictRelationIsWellOrder : WellOrder SetObject nonStrictRelation)
    (subset : SetObject)
    (subsetIsNonempty : exists element : Element, element ∈ subset) :
    exists leastElement, LeastElement nonStrictRelation subset leastElement :=
  nonStrictRelationIsWellOrder.right subset subsetIsNonempty

end LRA.Order
