import LRA.VolumeI.Order.Bounds.BoundedBelow.Definition
import LRA.VolumeI.Order.Bounds.LowerBound.Theorems
import LRA.VolumeI.Set.Interface.Membership
import LRA.VolumeI.Relations.Basic.CoreProperties

namespace LRA.Order

universe u v

/-- Every represented subcollection of a bounded-below set is bounded below. -/
theorem BoundedBelowOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (largerIsBoundedBelow : BoundedBelow relation larger) :
    BoundedBelow relation smaller := by
  sorry

/-- In a transitive total order, a union is bounded below exactly when both pieces are. -/
theorem UnionBoundedBelowIffPiecesBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (relationIsTotal : LRA.Relation.Total relation)
    (leftSubset rightSubset : SetObject) :
    BoundedBelow relation (leftSubset ∪ rightSubset) ↔
      BoundedBelow relation leftSubset /\
        BoundedBelow relation rightSubset := by
  sorry

/-- An intersection is bounded below whenever either constituent is. -/
theorem IntersectionBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (eitherIsBoundedBelow :
      BoundedBelow relation leftSubset \/
        BoundedBelow relation rightSubset) :
    BoundedBelow relation (leftSubset ∩ rightSubset) := by
  sorry

/-- A relative difference inherits boundedness below from its left operand. -/
theorem DifferenceBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (subset removed : SetObject)
    (subsetIsBoundedBelow : BoundedBelow relation subset) :
    BoundedBelow relation (subset \ removed) := by
  sorry

end LRA.Order
