import LRA.VolumeI.Relations.Order.Bounds
import LRA.VolumeI.Relations.Order.OrderStructures.TotalOrder

namespace LRA.VolumeI.Relations.Order

universe u

/-- Well-order laws for a non-strict order. -/
def WellOrder (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (relation : LRA.VolumeI.Relations.Endorelation interface.Element) : Prop :=
  TotalOrder relation /\
    forall subset : interface.SetObject,
      (exists element, interface.member element subset) ->
        exists least, LeastElement interface relation subset least

end LRA.VolumeI.Relations.Order
