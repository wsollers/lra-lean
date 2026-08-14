import LRA.VolumeI.Order.OrderedSets.WellOrder.Definition
import LRA.VolumeI.Order.Relations.StrictPart.Definition
import LRA.VolumeI.Relations.WellFounded.Definition

namespace LRA.VolumeI.Order

universe u v

/-- For a linear order, least-element and strict-minimal-element formulations
of well-ordering agree. Linearity promotes local minimality to global
leastness. -/
theorem WellOrderIffLinearAndStrictPartWellFounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {nonStrictRelation : LRA.VolumeI.Relations.Endorelation Element} :
    WellOrder SetObject nonStrictRelation ↔
      LinearOrder nonStrictRelation /\
        LRA.VolumeI.Relations.WellFounded SetObject
          (StrictPart nonStrictRelation) := by
  sorry

/-!
No backend-generic theorem `WellFounded -> Irreflexive` is stated: the usual
singleton argument requires the selected set backend to represent singletons.
-/

end LRA.VolumeI.Order
