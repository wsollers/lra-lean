import LRA.VolumeI.Order.Relations.Comparable.Definition

namespace LRA.VolumeI.Order

universe u v

/-- A chain is a subset whose elements are pairwise comparable. The empty
subset is a chain under this convention. -/
def Chain
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject) : Prop :=
  forall first second,
    first ∈ subset ->
      second ∈ subset ->
        Comparable relation first second

end LRA.VolumeI.Order
