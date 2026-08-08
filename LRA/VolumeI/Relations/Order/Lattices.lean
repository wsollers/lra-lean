import LRA.VolumeI.Relations.Order.Bounds

namespace LRA.VolumeI.Relations.Order

universe u

/-- A join of two elements is their least upper bound. -/
def Join {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (left right join : alpha) : Prop :=
  relation left join /\ relation right join /\
    forall upper,
      relation left upper -> relation right upper -> relation join upper

/-- A meet of two elements is their greatest lower bound. -/
def Meet {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (left right meet : alpha) : Prop :=
  relation meet left /\ relation meet right /\
    forall lower,
      relation lower left -> relation lower right -> relation lower meet

/-- Lattice laws: every pair has a join and a meet. -/
def Lattice {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  PartialOrder relation /\
    forall left right : alpha,
      (exists join, Join relation left right join) /\
        (exists meet, Meet relation left right meet)

end LRA.VolumeI.Relations.Order
