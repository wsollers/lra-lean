import LRA.Order.Bounds.Infimum.Theorems
import LRA.VolumeI.Order.Bounds.LeastElement.Definition
import LRA.VolumeI.Order.Lattices.Meet.Definition
import LRA.VolumeI.Set.Interface.Membership
import LRA.VolumeI.Set.Interface.Indexed

namespace LRA.Order

open scoped LRA.Set

universe u v w

/-- An infimum that belongs to its subset is the least element. -/
theorem InfimumInSubsetIsLeastElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {infimum : Element}
    (infimumIsInfimum : Infimum relation subset infimum)
    (infimumBelongs : infimum ∈ subset) :
    LeastElement relation subset infimum := by
  sorry

/-- The meet of two existing infima is the infimum of their union. -/
theorem InfimumOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {leftSubset rightSubset : SetObject}
    {leftInfimum rightInfimum unionInfimum : Element}
    (leftInfimumIsInfimum : Infimum relation leftSubset leftInfimum)
    (rightInfimumIsInfimum : Infimum relation rightSubset rightInfimum)
    (unionInfimumIsMeet : Meet relation leftInfimum rightInfimum unionInfimum) :
    Infimum relation (leftSubset ∪ rightSubset) unionInfimum := by
  sorry

/-- The infimum of either containing operand is below the infimum of their intersection. -/
theorem ContainingInfimumRelatedToInfimumOfIntersection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {containingSubset otherSubset : SetObject}
    {intersectionInfimum containingInfimum : Element}
    (intersectionIsInfimum : Infimum relation (containingSubset ∩ otherSubset) intersectionInfimum)
    (containingIsInfimum : Infimum relation containingSubset containingInfimum) :
    relation containingInfimum intersectionInfimum := by
  sorry

/-- The infimum of a set is below the infimum of each relative difference. -/
theorem ContainingInfimumRelatedToInfimumOfDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {differenceInfimum subsetInfimum : Element}
    (differenceIsInfimum : Infimum relation (subset \ removed) differenceInfimum)
    (subsetIsInfimum : Infimum relation subset subsetInfimum) :
    relation subsetInfimum differenceInfimum := by
  sorry

/-- The infimum of a union is below the infimum of its symmetric difference. -/
theorem UnionInfimumRelatedToInfimumOfSymmetricDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject}
    {differenceInfimum unionInfimum : Element}
    (differenceIsInfimum : Infimum relation (leftSubset ∆ rightSubset) differenceInfimum)
    (unionIsInfimum : Infimum relation (leftSubset ∪ rightSubset) unionInfimum) :
    relation unionInfimum differenceInfimum := by
  sorry

/-- Infima of all family members assemble into the infimum of the indexed union under a greatest-common-lower-bound hypothesis. -/
theorem InfimumOfIndexedUnion
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (family : Index -> SetObject) (memberInfimum : Index -> Element)
    (familyInfimum : Element)
    (eachIsInfimum : forall index, Infimum relation (family index) (memberInfimum index))
    (familyInfimumBoundsMembers : forall index, relation familyInfimum (memberInfimum index))
    (familyInfimumIsGreatest : forall bound,
      (forall index, relation bound (memberInfimum index)) -> relation bound familyInfimum) :
    Infimum relation (LRA.Set.HasIndexedUnion.indexedUnion family) familyInfimum := by
  sorry

end LRA.Order
