import LRA.VolumeI.Order.OrderedSets.WellOrder.Definition
import LRA.VolumeI.Order.Relation.StrictPart.Definition
import LRA.VolumeI.Set.Interface.Membership

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

/-- Every element that has a strict successor in a well-order has a least such successor. -/
theorem WellOrderHasImmediateSuccessor
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSeparation Element SetObject]
    [LRA.Set.HasUniversal SetObject] [LRA.Set.HasComplement SetObject]
    [LRA.Set.SeparationLaws Element SetObject]
    [LRA.Set.UniversalMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsWellOrder : WellOrder SetObject relation)
    (element : Element)
    (elementHasStrictSuccessor :
      exists candidate, StrictPart relation element candidate) :
    exists successor,
      StrictPart relation element successor /\
        forall candidate,
          StrictPart relation element candidate ->
            relation successor candidate := by
  sorry

end LRA.Order
