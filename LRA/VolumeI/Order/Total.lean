import LRA.VolumeI.Order.Posets

namespace LRA.VolumeI.Order

universe u

/-- Total-order laws for a non-strict endorelation. -/
def TotalOrder {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  PartialOrder relation /\ LRA.VolumeI.Relations.Total relation

/-- Linear order is the order-theory synonym for total order. -/
def LinearOrder {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  TotalOrder relation

/-- Strict linear order laws: irreflexivity, transitivity, and trichotomy. -/
def StrictLinearOrder {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  LRA.VolumeI.Relations.Irreflexive relation /\
    LRA.VolumeI.Relations.Transitive relation /\
      LRA.VolumeI.Relations.ExactlyTrichotomous relation

/-- Compatibility synonym for strict linear order. -/
def StrictTotalOrder {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  StrictLinearOrder relation

end LRA.VolumeI.Order
