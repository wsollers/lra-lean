import LRA.Relation.Properties.WellFounded.Definition

namespace LRA.Relation

universe u v

/--
**[Theorem — MinimalElementPrinciple]**

Every nonempty represented subset of a well-founded relation has a minimal
element.
-/
theorem MinimalElementPrinciple
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {strictRelation : Endorelation Element}
    (strictRelationIsWellFounded : WellFounded SetObject strictRelation)
    (subset : SetObject)
    (subsetIsNonempty : ∃ element : Element, element ∈ subset) :
    ∃ minimalElement,
      MinimalElement strictRelation subset minimalElement :=
  strictRelationIsWellFounded subset subsetIsNonempty

end LRA.Relation
