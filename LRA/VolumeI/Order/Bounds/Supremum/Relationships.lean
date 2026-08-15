import LRA.VolumeI.Order.Bounds.Infimum.Definition
import LRA.VolumeI.Order.Bounds.Supremum.Definition
import LRA.VolumeI.Set.Interface.Membership
import LRA.VolumeI.Relations.Basic.CoreProperties

namespace LRA.Order

universe u v

/-- Suprema in the converse relation are infima in the original relation. -/
theorem SupremumOfConverseIffInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Supremum (LRA.Relation.Converse relation) subset candidate ↔
      Infimum relation subset candidate := by
  sorry

/-- A candidate is the supremum of the empty set exactly when it is a bottom element. -/
theorem SupremumOfEmptyIffBottom
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (candidate : Element) :
    Supremum relation (∅ : SetObject) candidate ↔
      forall element, relation candidate element := by
  sorry

/-- A supremum is equivalently the infimum of the represented set of upper bounds. -/
theorem SupremumIffInfimumOfUpperBounds
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSeparation Element SetObject]
    [LRA.Set.HasUniversal SetObject] [LRA.Set.HasComplement SetObject]
    [LRA.Set.SeparationLaws Element SetObject]
    [LRA.Set.UniversalMembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Supremum relation subset candidate ↔
      Infimum relation
        (LRA.Set.HasSeparation.separation
          (LRA.Set.HasUniversal.universal : SetObject)
          (UpperBound relation subset))
        candidate := by
  sorry

/-- For a nonempty represented subset, every infimum lies below every supremum. -/
theorem InfimumRelatedToSupremumOfNonemptySubset
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {subset : SetObject} {infimum supremum : Element}
    (subsetIsNonempty : exists element, element ∈ subset)
    (infimumIsInfimum : Infimum relation subset infimum)
    (supremumIsSupremum : Supremum relation subset supremum) :
    relation infimum supremum := by
  sorry

end LRA.Order
