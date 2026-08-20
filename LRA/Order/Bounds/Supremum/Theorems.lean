import LRA.Order.Bounds.Supremum.Definition
import LRA.Order.Bounds.GreatestElement.Definition
import LRA.Relation.Properties.Definition
import LRA.Order.Lattices.Join.Definition
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Indexed

namespace LRA.Order

universe u v

/-- Antisymmetry makes a supremum unique. -/
theorem SupremumUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsSupremum : Supremum relation subset first)
    (secondIsSupremum : Supremum relation subset second) :
    first = second := by
  sorry

/-- In a reflexive relation, an element is a supremum of its represented singleton. -/
theorem SupremumOfSingleton
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [Singleton Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (element : Element)
    (singletonMembership :
      forall candidate,
        candidate ∈ ({element} : SetObject) ↔ candidate = element) :
    Supremum relation ({element} : SetObject) element := by
  sorry

/-- A supremum is an upper bound of the represented subset. -/
theorem SupremumIsUpperBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {supremum : Element}
    (supremumIsSupremum : Supremum relation subset supremum) :
    UpperBound relation subset supremum := by
  sorry

/-- A supremum lies below every upper bound of the represented subset. -/
theorem SupremumRelatedToEveryUpperBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {supremum bound : Element}
    (supremumIsSupremum : Supremum relation subset supremum)
    (boundIsUpperBound : UpperBound relation subset bound) :
    relation supremum bound := by
  sorry

/-- Once a supremum exists, upper bounds are exactly the elements above it. -/
theorem UpperBoundIffSupremumRelated
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {subset : SetObject} {supremum bound : Element}
    (supremumIsSupremum : Supremum relation subset supremum) :
    UpperBound relation subset bound ↔ relation supremum bound := by
  sorry

/-- Suprema are monotone under inclusion of represented subsets. -/
theorem SupremumMonotoneUnderInclusion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject} {smallerSupremum largerSupremum : Element}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (smallerSupremumIsSupremum :
      Supremum relation smaller smallerSupremum)
    (largerSupremumIsSupremum :
      Supremum relation larger largerSupremum) :
    relation smallerSupremum largerSupremum := by
  sorry

/-- Pointwise domination of one represented subset by another compares their suprema. -/
theorem SupremaCompareUnderPointwiseDomination
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {leftSubset rightSubset : SetObject}
    {leftSupremum rightSupremum : Element}
    (everyLeftHasLargerRight :
      forall left, left ∈ leftSubset ->
        exists right, right ∈ rightSubset /\ relation left right)
    (leftSupremumIsSupremum :
      Supremum relation leftSubset leftSupremum)
    (rightSupremumIsSupremum :
      Supremum relation rightSubset rightSupremum) :
    relation leftSupremum rightSupremum := by
  sorry

/-- A supremum that belongs to its subset is its greatest element. -/
theorem SupremumInSubsetIsGreatestElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {supremum : Element}
    (supremumIsSupremum : Supremum relation subset supremum)
    (supremumBelongs : supremum ∈ subset) :
    GreatestElement relation subset supremum := by
  sorry

open scoped LRA.Set



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
