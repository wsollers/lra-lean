import LRA.Order.Bounds.Supremum.Theorems
import LRA.VolumeI.Order.Lattices.Join.Definition
import LRA.VolumeI.Set.Interface.Membership
import LRA.VolumeI.Set.Interface.Indexed

namespace LRA.Order

open scoped LRA.Set

universe u v w

/-- The join of two existing suprema is the supremum of their union. -/
theorem SupremumOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {leftSubset rightSubset : SetObject}
    {leftSupremum rightSupremum unionSupremum : Element}
    (leftSupremumIsSupremum : Supremum relation leftSubset leftSupremum)
    (rightSupremumIsSupremum : Supremum relation rightSubset rightSupremum)
    (unionSupremumIsJoin : Join relation leftSupremum rightSupremum unionSupremum) :
    Supremum relation (leftSubset ∪ rightSubset) unionSupremum := by
  sorry

/-- The supremum of an intersection is below the supremum of either containing operand. -/
theorem SupremumOfIntersectionRelatedToContainingSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {containingSubset otherSubset : SetObject}
    {intersectionSupremum containingSupremum : Element}
    (intersectionIsSupremum : Supremum relation (containingSubset ∩ otherSubset) intersectionSupremum)
    (containingIsSupremum : Supremum relation containingSubset containingSupremum) :
    relation intersectionSupremum containingSupremum := by
  sorry

/-- The supremum of a relative difference is below the supremum of its left operand. -/
theorem SupremumOfDifferenceRelatedToContainingSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {differenceSupremum subsetSupremum : Element}
    (differenceIsSupremum : Supremum relation (subset \ removed) differenceSupremum)
    (subsetIsSupremum : Supremum relation subset subsetSupremum) :
    relation differenceSupremum subsetSupremum := by
  sorry

/-- The supremum of a symmetric difference is below the supremum of the union. -/
theorem SupremumOfSymmetricDifferenceRelatedToUnionSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject}
    {differenceSupremum unionSupremum : Element}
    (differenceIsSupremum : Supremum relation (leftSubset ∆ rightSubset) differenceSupremum)
    (unionIsSupremum : Supremum relation (leftSubset ∪ rightSubset) unionSupremum) :
    relation differenceSupremum unionSupremum := by
  sorry

/-- Suprema of all family members assemble into the supremum of the indexed union under a least-common-upper-bound hypothesis. -/
theorem SupremumOfIndexedUnion
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (family : Index -> SetObject) (memberSupremum : Index -> Element)
    (familySupremum : Element)
    (eachIsSupremum : forall index, Supremum relation (family index) (memberSupremum index))
    (familySupremumBoundsMembers : forall index, relation (memberSupremum index) familySupremum)
    (familySupremumIsLeast : forall bound,
      (forall index, relation (memberSupremum index) bound) -> relation familySupremum bound) :
    Supremum relation (LRA.Set.HasIndexedUnion.indexedUnion family) familySupremum := by
  sorry

end LRA.Order
