import LRA.VolumeI.Relations.Order.OrderStructures.PartialOrder

namespace LRA.VolumeI.Relations.Order

/-- A poset is a carrier equipped with a partial order. -/
structure Poset where
  carrier : LRA.VolumeI.Set.LRACarrier
  order : LRA.VolumeI.Relations.Endorelation carrier
  orderIsPartial : PartialOrder order

end LRA.VolumeI.Relations.Order
