import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition
import LRA.VolumeI.Order.OrderedSets.StrictOrder.Definition
import LRA.VolumeI.Order.OrderedSets.LinearOrder.Definition
import LRA.VolumeI.Order.Relations.GreaterThan.Definition
import LRA.VolumeI.Order.OrderedSets.StrictLinearOrder.Definition

namespace LRA.Order

universe u

/-- Partial-order laws are invariant under reversing the relation. -/
theorem GreaterThanIsPartialOrderIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    PartialOrder (GreaterThan relation) ↔ PartialOrder relation := by
  sorry

/-- Strict-order laws are invariant under reversing the relation. -/
theorem GreaterThanIsStrictOrderIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    StrictOrder (GreaterThan relation) ↔ StrictOrder relation := by
  sorry

/-- Linear-order laws are invariant under reversing the relation. -/
theorem GreaterThanIsLinearOrderIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    LinearOrder (GreaterThan relation) ↔ LinearOrder relation := by
  sorry

/-- Strict-linear-order laws are invariant under reversing the relation. -/
theorem GreaterThanIsStrictLinearOrderIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    StrictLinearOrder (GreaterThan relation) ↔ StrictLinearOrder relation := by
  sorry

end LRA.Order
