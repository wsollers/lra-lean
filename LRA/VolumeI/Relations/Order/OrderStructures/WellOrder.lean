import LRA.VolumeI.Relations.Order.Bounds
import LRA.VolumeI.Relations.Order.OrderStructures.TotalOrder

namespace LRA.VolumeI.Relations.Order

universe u

/-- Well-order laws for a non-strict order. -/
def WellOrder {Alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  TotalOrder relation /\
    forall subset : LRA.VolumeI.Set.LRASet Alpha,
      LRA.VolumeI.Set.LRASet.Nonempty subset ->
        exists least, LeastElement relation subset least

end LRA.VolumeI.Relations.Order
