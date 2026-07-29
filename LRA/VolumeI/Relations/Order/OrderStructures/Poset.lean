import LRA.VolumeI.Relations.Order.OrderStructures.PartialOrder

namespace LRA.VolumeI.Relations.Order

/-- A poset is a carrier equipped with a partial order. -/
structure Poset where
  Carrier : LRA.VolumeI.Set.LRACarrier
  Relation : LRA.VolumeI.Relations.Endorelation Carrier
  RelationIsPartialOrder : PartialOrder Relation

end LRA.VolumeI.Relations.Order
