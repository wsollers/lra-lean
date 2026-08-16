import LRA.VolumeI.Order.Relation.Comparable.Definition

namespace LRA.Order

universe u v

/-- A chain is a subset whose elements are pairwise comparable. The empty
subset is a chain under this convention. -/
def Chain
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  forall first second,
    first ∈ subset ->
      second ∈ subset ->
        Comparable relation first second

end LRA.Order
