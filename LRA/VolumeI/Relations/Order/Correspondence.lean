import LRA.VolumeI.Relations.Order.OrderStructures.PartialOrder
import LRA.VolumeI.Relations.Order.OrderStructures.StrictPartialOrder
import LRA.VolumeI.Relations.Order.OrderStructures.TotalOrder
import LRA.VolumeI.Relations.Order.OrderStructures.StrictLinearOrder
import LRA.VolumeI.Relations.Order.Relations

namespace LRA.VolumeI.Relations.Order

universe u

/-- A non-strict order can be recovered from its strict part and equality. -/
def NonStrictFromStrict {Alpha : LRA.VolumeI.Set.LRACarrier}
    (strictRelation : LRA.VolumeI.Relations.Endorelation Alpha) :
    LRA.VolumeI.Relations.Endorelation Alpha :=
  LessThanOrEqual strictRelation

/-- A strict order can be recovered as the strict part of a non-strict order. -/
def StrictFromNonStrict {Alpha : LRA.VolumeI.Set.LRACarrier}
    (nonStrictRelation : LRA.VolumeI.Relations.Endorelation Alpha) :
    LRA.VolumeI.Relations.Endorelation Alpha :=
  StrictPart nonStrictRelation

/-- Strict partial orders induce partial orders through adjoining equality. -/
theorem StrictPartialOrderInducesPartialOrder
    {Alpha : LRA.VolumeI.Set.LRACarrier}
    {strictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (strictRelationIsStrictPartialOrder : StrictPartialOrder strictRelation) :
    PartialOrder (NonStrictFromStrict strictRelation) := by
  sorry

/-- Partial orders induce strict partial orders by removing equality. -/
theorem PartialOrderInducesStrictPartialOrder
    {Alpha : LRA.VolumeI.Set.LRACarrier}
    {nonStrictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (nonStrictRelationIsPartialOrder : PartialOrder nonStrictRelation) :
    StrictPartialOrder (StrictFromNonStrict nonStrictRelation) := by
  sorry

/-- Strict linear orders induce total orders through adjoining equality. -/
theorem StrictLinearOrderInducesTotalOrder
    {Alpha : LRA.VolumeI.Set.LRACarrier}
    {strictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (strictRelationIsStrictLinearOrder : StrictLinearOrder strictRelation) :
    TotalOrder (NonStrictFromStrict strictRelation) := by
  sorry

/-- The strict/non-strict conversions are inverse at the theorem-interface level. -/
theorem StrictNonStrictInverseCorrespondence
    {Alpha : LRA.VolumeI.Set.LRACarrier}
    {strictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (strictRelationIsStrictLinearOrder : StrictLinearOrder strictRelation) :
    StrictFromNonStrict (NonStrictFromStrict strictRelation) = strictRelation := by
  sorry

end LRA.VolumeI.Relations.Order
