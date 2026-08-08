import LRA.VolumeI.Relations.Order.OrderStructures.StrictLinearOrder

namespace LRA.VolumeI.Relations.Order

universe u

/-- Compatibility synonym for strict linear order. -/
def StrictTotalOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  StrictLinearOrder relation

end LRA.VolumeI.Relations.Order
