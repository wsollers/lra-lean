import LRA.Order.Bounds.GreatestElement.Definition
import LRA.Relation.Properties.Definition
import LRA.Set.Interface.Membership

namespace LRA.Order

universe u v

/-- Antisymmetry makes a greatest element unique. -/
theorem GreatestElementUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsGreatest : GreatestElement relation subset first)
    (secondIsGreatest : GreatestElement relation subset second) :
    first = second := by
  sorry

open scoped LRA.Set



/-- A greatest element remains greatest in an intersection that retains it. -/
theorem GreatestElementRetainedByIntersection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset retainedBy : SetObject} {greatest : Element}
    (greatestIsGreatest : GreatestElement relation subset greatest)
    (greatestIsRetained : greatest ∈ retainedBy) :
    GreatestElement relation (subset ∩ retainedBy) greatest := by
  sorry

/-- A greatest element remains greatest after a deletion that does not remove it. -/
theorem GreatestElementRetainedByDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {greatest : Element}
    (greatestIsGreatest : GreatestElement relation subset greatest)
    (greatestIsNotRemoved : greatest ∉ removed) :
    GreatestElement relation (subset \ removed) greatest := by
  sorry

/-- A greatest element of the union remains greatest in a symmetric difference that retains it. -/
theorem GreatestElementRetainedBySymmetricDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {greatest : Element}
    (greatestIsGreatestOfUnion : GreatestElement relation (leftSubset ∪ rightSubset) greatest)
    (greatestIsRetained : greatest ∈ (leftSubset ∆ rightSubset)) :
    GreatestElement relation (leftSubset ∆ rightSubset) greatest := by
  sorry

/-- A greatest element of one operand that bounds the other is greatest in the union. -/
theorem GreatestElementOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {greatest : Element}
    (greatestIsGreatestOfLeft : GreatestElement relation leftSubset greatest)
    (greatestBoundsRight : UpperBound relation rightSubset greatest) :
    GreatestElement relation (leftSubset ∪ rightSubset) greatest := by
  sorry

end LRA.Order
