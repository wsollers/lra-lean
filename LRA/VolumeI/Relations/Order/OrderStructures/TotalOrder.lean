import LRA.VolumeI.Relations.Order.OrderStructures.PartialOrder

namespace LRA.VolumeI.Relations.Order

universe u

/-- Total-order laws for a non-strict endorelation. -/
def TotalOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  PartialOrder relation /\ LRA.VolumeI.Relations.Total relation

end LRA.VolumeI.Relations.Order
