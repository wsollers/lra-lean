import LRA.VolumeI.Order.OrderedSets.StrictOrder.Definition

namespace LRA.VolumeI.Order

universe u

/-- A strict poset is a carrier equipped with a strict order. -/
structure StrictPoset where
  Carrier : Type u
  StrictRelation : LRA.VolumeI.Relations.Endorelation Carrier
  StrictRelationIsStrictOrder : LRA.VolumeI.Order.StrictOrder StrictRelation

end LRA.VolumeI.Order
