import LRA.VolumeI.Relations.Basic.Properties
import LRA.VolumeI.Order.Bounds
import LRA.VolumeI.Order.WellOrder

namespace LRA.VolumeI.Order

universe u v

/-- Subset-minimal well-foundedness relative to a chosen set backend.

Logical form:

```lean
def SubsetWellFounded
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (strictRelation : LRA.VolumeI.Relations.Endorelation Element) : Prop :=
  LRA.VolumeI.Relations.WellFounded SetObject strictRelation
```
-/
def SubsetWellFounded
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
    (strictRelationIsWellFounded : SubsetWellFounded SetObject strictRelation)
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
    (strictRelationIsWellFounded : SubsetWellFounded SetObject strictRelation)
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

/--
For a total order, the least-element and strict-minimal-element formulations
of well-ordering agree. Totality is exactly what promotes the local statement
"nothing is strictly below" to the global statement "below everything."
-/
theorem WellOrderIffTotalAndStrictPartSubsetWellFounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {nonStrictRelation : LRA.VolumeI.Relations.Endorelation Element} :
    WellOrder SetObject nonStrictRelation ↔
      TotalOrder nonStrictRelation /\
        SubsetWellFounded SetObject (StrictPart nonStrictRelation) := by
  sorry

/-!
No backend-generic theorem `SubsetWellFounded -> Irreflexive` is stated here:
the usual singleton argument requires the chosen `SetObject` backend to
represent singleton subsets. A future backend-adequacy interface should make
that requirement explicit.
-/

end LRA.VolumeI.Order
