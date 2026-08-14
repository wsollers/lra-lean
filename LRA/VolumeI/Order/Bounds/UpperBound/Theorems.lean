import LRA.VolumeI.Order.Bounds.UpperBound.Definition

namespace LRA.VolumeI.Order

universe u v

/-- An upper bound of a larger represented subset bounds every subcollection. -/
theorem UpperBoundOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.VolumeI.Relations.Endorelation Element}
    {smaller larger : SetObject} {bound : Element}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (boundIsUpperForLarger : UpperBound relation larger bound) :
    UpperBound relation smaller bound := by
  sorry

end LRA.VolumeI.Order
