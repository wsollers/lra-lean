import LRA.Order.Bounds.Bounded.Definition
import LRA.Order.Bounds.BoundedAbove.Theorems
import LRA.Order.Bounds.BoundedBelow.Theorems

namespace LRA.Order

open scoped LRA.Set

universe u v

/-- Every represented subcollection of a bounded set is bounded. -/
theorem BoundedOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (largerIsBounded : Bounded relation larger) :
    Bounded relation smaller := by
  sorry

/-- In a transitive total order, a union is bounded exactly when both pieces are. -/
theorem UnionBoundedIffPiecesBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (relationIsTotal : LRA.Relation.Total relation)
    (leftSubset rightSubset : SetObject) :
    Bounded relation (leftSubset ∪ rightSubset) ↔
      Bounded relation leftSubset /\ Bounded relation rightSubset := by
  sorry

/-- An intersection is bounded whenever either constituent is bounded. -/
theorem IntersectionBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (eitherIsBounded :
      Bounded relation leftSubset \/ Bounded relation rightSubset) :
    Bounded relation (leftSubset ∩ rightSubset) := by
  sorry

/-- A relative difference inherits boundedness from its left operand. -/
theorem DifferenceBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (subset removed : SetObject)
    (subsetIsBounded : Bounded relation subset) :
    Bounded relation (subset \ removed) := by
  sorry

/-- A symmetric difference is bounded when both operands are bounded. -/
theorem SymmetricDifferenceBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (leftIsBounded : Bounded relation leftSubset)
    (rightIsBounded : Bounded relation rightSubset) :
    Bounded relation (leftSubset ∆ rightSubset) := by
  sorry

end LRA.Order
