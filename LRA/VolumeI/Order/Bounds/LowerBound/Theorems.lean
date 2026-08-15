import LRA.VolumeI.Order.Bounds.LowerBound.Definition
import LRA.VolumeI.Set.Interface.Membership

namespace LRA.Order

universe u v

/-- A lower bound of a larger represented subset bounds every subcollection. -/
theorem LowerBoundOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject} {bound : Element}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (boundIsLowerForLarger : LowerBound relation larger bound) :
    LowerBound relation smaller bound := by
  sorry

/-- A common lower bound of two represented subsets bounds their union. -/
theorem LowerBoundOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsLowerForLeft : LowerBound relation leftSubset bound)
    (boundIsLowerForRight : LowerBound relation rightSubset bound) :
    LowerBound relation (leftSubset ∪ rightSubset) bound := by
  sorry

/-- A lower bound of a union bounds each constituent subset. -/
theorem LowerBoundOfUnionIff
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element} :
    LowerBound relation (leftSubset ∪ rightSubset) bound ↔
      LowerBound relation leftSubset bound /\
        LowerBound relation rightSubset bound := by
  sorry

/-- A lower bound of either set is a lower bound of their intersection. -/
theorem LowerBoundOfIntersection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsLowerForEither :
      LowerBound relation leftSubset bound \/
        LowerBound relation rightSubset bound) :
    LowerBound relation (leftSubset ∩ rightSubset) bound := by
  sorry

/-- Every lower bound of a set bounds each represented relative difference. -/
theorem LowerBoundOfDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {bound : Element}
    (boundIsLowerForSubset : LowerBound relation subset bound) :
    LowerBound relation (subset \ removed) bound := by
  sorry

end LRA.Order
