import LRA.VolumeI.Order.OrderedSets.PartialOrder.Examples
import LRA.VolumeI.Order.OrderedSets.TotalOrder.Definition

namespace LRA.VolumeI.Order.OrderedSets.TotalOrder

universe u

/-- An endorelation fails totality when some pair is incomparable. -/
def FailsTotality
    {Carrier : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Carrier) : Prop :=
  Not (LRA.VolumeI.Relations.Total relation)

/-- Equality on booleans is a partial order but not a total order. -/
theorem BooleanEqualityPartialOrderFailsTotality :
    FailsTotality
      LRA.VolumeI.Order.OrderedSets.PartialOrder.BooleanEqualityNonStrictPartialOrder.relation := by
  sorry

end LRA.VolumeI.Order.OrderedSets.TotalOrder
