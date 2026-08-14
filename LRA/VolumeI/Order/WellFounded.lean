import LRA.VolumeI.Relations.Basic.Properties
import LRA.VolumeI.Order.Bounds
import LRA.VolumeI.Order.WellOrder

namespace LRA.VolumeI.Order

universe u v

/-- Order-facing synonym for subset-minimal well-foundedness.

Logical form:

```lean
def WellFoundedRelation
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (strictRelation : LRA.VolumeI.Relations.Endorelation Element) : Prop :=
  LRA.VolumeI.Relations.WellFounded SetObject strictRelation
```
-/
def WellFoundedRelation
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (strictRelation : LRA.VolumeI.Relations.Endorelation Element) : Prop :=
  LRA.VolumeI.Relations.WellFounded SetObject strictRelation

/-- Every nonempty subset of a well-founded relation has a minimal element.

Logical form:

```lean
theorem MinimalElementPrinciple
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {strictRelation : LRA.VolumeI.Relations.Endorelation Element}
    (strictRelationIsWellFounded : WellFoundedRelation SetObject strictRelation)
    (subset : SetObject)
    (subsetIsNonempty : exists element : Element, element ∈ subset) :
    exists minimalElement,
      LRA.VolumeI.Relations.MinimalElement strictRelation subset minimalElement
```
-/
theorem MinimalElementPrinciple
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {strictRelation : LRA.VolumeI.Relations.Endorelation Element}
    (strictRelationIsWellFounded : WellFoundedRelation SetObject strictRelation)
    (subset : SetObject)
    (subsetIsNonempty : exists element : Element, element ∈ subset) :
    exists minimalElement,
      LRA.VolumeI.Relations.MinimalElement strictRelation subset minimalElement := by
  exact strictRelationIsWellFounded subset subsetIsNonempty

/-- Every nonempty subset of a well-order has a least element.

Logical form:

```lean
theorem WellOrderingPrinciple
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {nonStrictRelation : LRA.VolumeI.Relations.Endorelation Element}
    (nonStrictRelationIsWellOrder : WellOrder SetObject nonStrictRelation)
    (subset : SetObject)
    (subsetIsNonempty : exists element : Element, element ∈ subset) :
    exists leastElement, LeastElement nonStrictRelation subset leastElement
```
-/
theorem WellOrderingPrinciple
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {nonStrictRelation : LRA.VolumeI.Relations.Endorelation Element}
    (nonStrictRelationIsWellOrder : WellOrder SetObject nonStrictRelation)
    (subset : SetObject)
    (subsetIsNonempty : exists element : Element, element ∈ subset) :
    exists leastElement, LeastElement nonStrictRelation subset leastElement :=
  nonStrictRelationIsWellOrder.right subset subsetIsNonempty

end LRA.VolumeI.Order
