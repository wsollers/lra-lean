import LRA.Order.Bounds.UpperBound.Definition
import LRA.Set.Interface.Indexed
import LRA.Set.Interface.Membership

namespace LRA.Order

open scoped LRA.Set

universe u v w

/-- Every element is vacuously an upper bound of the empty represented subset. -/
theorem UpperBoundOfEmpty
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (bound : Element) :
    UpperBound relation (∅ : SetObject) bound := by
  unfold UpperBound
  intro e elementExists
  exfalso
  exact LRA.Set.MembershipLaws.EmptyMembership e elementExists

/-- A bound of a larger represented subset bounds every subcollection. -/
theorem UpperBoundOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject} {bound : Element}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (boundIsUpperForLarger : UpperBound relation larger bound) :
    UpperBound relation smaller bound := by
  intro smallerElement elementInSubset
  have elementInLarger := smallerIsContained smallerElement elementInSubset
  unfold UpperBound at boundIsUpperForLarger
  exact boundIsUpperForLarger smallerElement elementInLarger

/-- A common upper bound of two represented subsets bounds their union. -/
theorem UpperBoundOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsUpperForLeft : UpperBound relation leftSubset bound)
    (boundIsUpperForRight : UpperBound relation rightSubset bound) :
    UpperBound relation (leftSubset ∪ rightSubset) bound := by
  unfold UpperBound
  intro chosen
  intro chosenInUnion
  have chosenInLeftOrRight :=
    (LRA.Set.MembershipLaws.UnionMembership leftSubset rightSubset chosen).mp chosenInUnion
  rcases chosenInLeftOrRight with (chosenInLeft | chosenInRight)
  · exact boundIsUpperForLeft chosen chosenInLeft
  · exact boundIsUpperForRight chosen chosenInRight

/-- An element is an upper bound of a union iff it bounds each constituent subset. -/
theorem UpperBoundOfUnionIff
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element} :
    UpperBound relation (leftSubset ∪ rightSubset) bound ↔
      UpperBound relation leftSubset bound /\
        UpperBound relation rightSubset bound := by
    constructor
    .
      intro hypothesis
      constructor
      .
        unfold UpperBound
        intro chosen
        intro chosenInLeft
        have chosenInUnion : chosen ∈ leftSubset ∪ rightSubset := by
          exact (LRA.Set.UnionMembership leftSubset rightSubset chosen).mpr
            (Or.inl chosenInLeft)
        exact hypothesis chosen chosenInUnion
      .
        sorry
    .
      sorry

/-- An upper bound of either set is an upper bound of their intersection. -/
theorem UpperBoundOfIntersection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsUpperForEither :
      UpperBound relation leftSubset bound \/
        UpperBound relation rightSubset bound) :
    UpperBound relation (leftSubset ∩ rightSubset) bound := by
  sorry

/-- Every upper bound of a set bounds each represented relative difference. -/
theorem UpperBoundOfDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {bound : Element}
    (boundIsUpperForSubset : UpperBound relation subset bound) :
    UpperBound relation (subset \\ removed) bound := by
  sorry

/-- A common upper bound of two sets bounds their symmetric difference. -/
theorem UpperBoundOfSymmetricDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsUpperForLeft : UpperBound relation leftSubset bound)
    (boundIsUpperForRight : UpperBound relation rightSubset bound) :
    UpperBound relation (leftSubset ∆ rightSubset) bound := by
  sorry

/-- An element bounds an indexed union above iff it bounds every member above. -/
theorem UpperBoundOfIndexedUnionIff
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {family : Index -> SetObject} {bound : Element} :
    UpperBound relation (LRA.Set.HasIndexedUnion.indexedUnion family) bound ↔
      forall index, UpperBound relation (family index) bound := by
  sorry

/-- An upper bound of any selected family member bounds the indexed intersection. -/
theorem UpperBoundOfIndexedIntersection
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {family : Index -> SetObject} (index : Index) {bound : Element}
    (boundIsUpperForMember : UpperBound relation (family index) bound) :
    UpperBound relation
      (LRA.Set.HasIndexedIntersection.indexedIntersection family) bound := by
  sorry

end LRA.Order
