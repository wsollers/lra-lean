import LRA.VolumeI.Relations.Order.OrderStructures.LinearOrder

namespace LRA.VolumeI.Relations.Order

universe u

/-- A dense order is an order whose comparison relation is dense. -/
def DenseOrder {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  PartialOrder relation /\ LRA.VolumeI.Relations.Dense relation

/-- A dense linear order is both linear and dense. -/
def DenseLinearOrder {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  LinearOrder relation /\ LRA.VolumeI.Relations.Dense relation

end LRA.VolumeI.Relations.Order
