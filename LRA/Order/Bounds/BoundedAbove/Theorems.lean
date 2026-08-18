import LRA.Order.Bounds.BoundedAbove.Definition
import LRA.Order.Bounds.UpperBound.Theorems
import LRA.Set.Interface.Membership
import LRA.Relation.Properties.Definition

namespace LRA.Order

open scoped LRA.Set

universe u v

/-- Every represented subcollection of a bounded-above set is bounded above. -/
theorem BoundedAboveOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (largerIsBoundedAbove : BoundedAbove relation larger) :
    BoundedAbove relation smaller := by
  sorry

/-- In a transitive total order, a union is bounded above exactly when both pieces are. -/
theorem UnionBoundedAboveIffPiecesBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (relationIsTotal : LRA.Relation.Total relation)
    (leftSubset rightSubset : SetObject) :
    BoundedAbove relation (leftSubset ∪ rightSubset) ↔
      BoundedAbove relation leftSubset /\
        BoundedAbove relation rightSubset := by
  sorry

/-- An intersection is bounded above whenever either constituent is. -/
theorem IntersectionBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (eitherIsBoundedAbove :
      BoundedAbove relation leftSubset \/
        BoundedAbove relation rightSubset) :
    BoundedAbove relation (leftSubset ∩ rightSubset) := by
  sorry

/-- A relative difference inherits boundedness above from its left operand. -/
theorem DifferenceBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (subset removed : SetObject)
    (subsetIsBoundedAbove : BoundedAbove relation subset) :
    BoundedAbove relation (subset \ removed) := by
  sorry

/-- A symmetric difference is bounded above when both operands are. -/
theorem SymmetricDifferenceBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (leftIsBoundedAbove : BoundedAbove relation leftSubset)
    (rightIsBoundedAbove : BoundedAbove relation rightSubset) :
    BoundedAbove relation (leftSubset ∆ rightSubset) := by
  sorry

end LRA.Order
