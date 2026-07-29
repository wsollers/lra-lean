import LRA.VolumeI.Order.Bounds

namespace LRA.VolumeI.Order

universe u

/-- A join of two elements is the supremum of their two-element subset. -/
def Join {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (left right join : alpha) : Prop :=
  Supremum relation (fun element => element = left \/ element = right) join

/-- A meet of two elements is the infimum of their two-element subset. -/
def Meet {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (left right meet : alpha) : Prop :=
  Infimum relation (fun element => element = left \/ element = right) meet

/-- Lattice laws: every pair has a join and a meet. -/
def Lattice {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  PartialOrder relation /\
    forall left right : alpha,
      (exists join, Join relation left right join) /\
        (exists meet, Meet relation left right meet)

end LRA.VolumeI.Order
