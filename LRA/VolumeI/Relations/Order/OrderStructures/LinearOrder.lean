import LRA.VolumeI.Relations.Order.OrderStructures.TotalOrder

namespace LRA.VolumeI.Relations.Order

universe u

/-- Linear order is the order-theory synonym for total order. -/
def LinearOrder {Alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  TotalOrder relation

end LRA.VolumeI.Relations.Order
