import LRA.Relation.Operations.Converse.Definition
import LRA.VolumeI.Order.Bounds.Infimum.Definition
import LRA.VolumeI.Order.Bounds.Supremum.Definition
import LRA.VolumeI.Order.Bounds.BoundSets.Definition
import LRA.VolumeI.Set.Interface.Membership

namespace LRA.Order

universe u v

/-- Infima in the converse relation are suprema in the original relation. -/
theorem InfimumOfConverseIffSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Infimum (LRA.Relation.Converse relation) subset candidate ↔
      Supremum relation subset candidate := by
  sorry

/-- A candidate is the infimum of the empty set exactly when it is a top element. -/
theorem InfimumOfEmptyIffTop
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (candidate : Element) :
    Infimum relation (∅ : SetObject) candidate ↔
      forall element, relation element candidate := by
  sorry

/-- An infimum is equivalently the supremum of the represented set of lower bounds. -/
theorem InfimumIffSupremumOfLowerBounds
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSeparation Element SetObject]
    [LRA.Set.HasUniversal SetObject] [LRA.Set.HasComplement SetObject]
    [LRA.Set.SeparationLaws Element SetObject]
    [LRA.Set.UniversalMembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Infimum relation subset candidate ↔
      Supremum relation (LowerBounds relation subset) candidate := by
  sorry

end LRA.Order
