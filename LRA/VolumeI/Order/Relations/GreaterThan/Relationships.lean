import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition
import LRA.VolumeI.Order.OrderedSets.StrictOrder.Definition
import LRA.VolumeI.Order.OrderedSets.TotalOrder.Definition
import LRA.VolumeI.Order.Relations.GreaterThan.Definition
import LRA.VolumeI.Order.StrictLinearOrder

namespace LRA.VolumeI.Order

universe u

/-- Partial-order laws are invariant under reversing the relation. -/
theorem GreaterThanIsPartialOrderIff
    {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) :
    PartialOrder (GreaterThan relation) ↔ PartialOrder relation := by
  sorry

/-- Strict-order laws are invariant under reversing the relation. -/
theorem GreaterThanIsStrictOrderIff
    {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) :
    StrictOrder (GreaterThan relation) ↔ StrictOrder relation := by
  sorry

/-- Total-order laws are invariant under reversing the relation. -/
theorem GreaterThanIsTotalOrderIff
    {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) :
    TotalOrder (GreaterThan relation) ↔ TotalOrder relation := by
  sorry

/-- Strict-linear-order laws are invariant under reversing the relation. -/
theorem GreaterThanIsStrictLinearOrderIff
    {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) :
    StrictLinearOrder (GreaterThan relation) ↔ StrictLinearOrder relation := by
  sorry

end LRA.VolumeI.Order
