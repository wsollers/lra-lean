import LRA.Order.Bounds.BoundSets.Definition
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Subset

namespace LRA.Order

open LRA.Set

universe u v

section GenericBoundSets

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSeparation Element SetObject]
variable [HasUniversal SetObject] [HasComplement SetObject]
variable [MembershipLaws Element SetObject]
variable [SeparationLaws Element SetObject]
variable [UniversalMembershipLaws Element SetObject]
variable [ExtensionalityLaw Element SetObject]
variable [SubsetLaws SetObject]

                                                                                          
theorem UpperBoundsMembership
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (bound : Element) :
    bound ∈ UpperBounds relation subset ↔
      UpperBound relation subset bound := by
  sorry

                                                                                          
theorem LowerBoundsMembership
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (bound : Element) :
    bound ∈ LowerBounds relation subset ↔
      LowerBound relation subset bound := by
  sorry

                                                                              
theorem UpperBoundsAntitoneUnderInclusion
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : smaller ⊆ larger) :
    UpperBounds relation larger ⊆ UpperBounds relation smaller := by
  sorry

                                                                              
theorem LowerBoundsAntitoneUnderInclusion
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : smaller ⊆ larger) :
    LowerBounds relation larger ⊆ LowerBounds relation smaller := by
  sorry

                                                                         
theorem UpperBoundsOfEmpty
    (relation : LRA.Relation.Endorelation Element) :
    UpperBounds relation (∅ : SetObject) =
      (HasUniversal.universal : SetObject) := by
  sorry

                                                                         
theorem LowerBoundsOfEmpty
    (relation : LRA.Relation.Endorelation Element) :
    LowerBounds relation (∅ : SetObject) =
      (HasUniversal.universal : SetObject) := by
  sorry

end GenericBoundSets

end LRA.Order
