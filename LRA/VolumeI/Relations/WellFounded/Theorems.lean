import LRA.VolumeI.Relations.WellFounded.Definition

namespace LRA.Relation

universe u v

/--
**[Theorem — MinimalElementPrinciple]**

Every nonempty represented subset of a well-founded relation has a minimal
element.

Logical form:

```lean
theorem MinimalElementPrinciple
    (strictRelationIsWellFounded : WellFounded SetObject strictRelation)
    (subset : SetObject)
    (subsetIsNonempty : exists element : Element, element ∈ subset) :
    exists minimalElement,
      MinimalElement strictRelation subset minimalElement
```
-/
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

end LRA.Relation
