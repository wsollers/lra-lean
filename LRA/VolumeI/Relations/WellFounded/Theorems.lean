import LRA.VolumeI.Relations.WellFounded.Definition

namespace LRA.VolumeI.Relations

universe u v

/-- Every nonempty represented subset of a well-founded relation has a
minimal element. -/
theorem MinimalElementPrinciple
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {strictRelation : Endorelation Element}
    (strictRelationIsWellFounded : WellFounded SetObject strictRelation)
    (subset : SetObject)
    (subsetIsNonempty : exists element : Element, element ∈ subset) :
    exists minimalElement,
      MinimalElement strictRelation subset minimalElement :=
  strictRelationIsWellFounded subset subsetIsNonempty

end LRA.VolumeI.Relations
