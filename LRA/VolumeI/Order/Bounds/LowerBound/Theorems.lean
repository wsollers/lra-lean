import LRA.VolumeI.Order.Bounds.LowerBound.Definition

namespace LRA.VolumeI.Order

universe u v

/-- A lower bound of a larger represented subset bounds every subcollection. -/
theorem LowerBoundOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.VolumeI.Relations.Endorelation Element}
    {smaller larger : SetObject} {bound : Element}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (boundIsLowerForLarger : LowerBound relation larger bound) :
    LowerBound relation smaller bound := by
  sorry

end LRA.VolumeI.Order
