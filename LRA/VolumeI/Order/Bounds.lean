import LRA.VolumeI.Order.Total

namespace LRA.VolumeI.Order

universe u

/-- An upper bound of a subset with respect to a non-strict order. -/
def UpperBound {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (subset : LRA.VolumeI.Set.LRASet alpha)
    (bound : alpha) : Prop :=
  forall element,
    LRA.VolumeI.Set.LRASet.member element subset ->
      relation element bound

/-- A lower bound of a subset with respect to a non-strict order. -/
def LowerBound {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (subset : LRA.VolumeI.Set.LRASet alpha)
    (bound : alpha) : Prop :=
  forall element,
    LRA.VolumeI.Set.LRASet.member element subset ->
      relation bound element

/-- A least element of a subset with respect to a non-strict order. -/
def LeastElement {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (subset : LRA.VolumeI.Set.LRASet alpha)
    (least : alpha) : Prop :=
  LRA.VolumeI.Set.LRASet.member least subset /\ LowerBound relation subset least

/-- A greatest element of a subset with respect to a non-strict order. -/
def GreatestElement {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (subset : LRA.VolumeI.Set.LRASet alpha)
    (greatest : alpha) : Prop :=
  LRA.VolumeI.Set.LRASet.member greatest subset /\ UpperBound relation subset greatest

/-- A minimal element of a subset with respect to a strict order. -/
def MinimalElement {alpha : LRA.VolumeI.Set.LRACarrier}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha)
    (subset : LRA.VolumeI.Set.LRASet alpha)
    (minimal : alpha) : Prop :=
  LRA.VolumeI.Set.LRASet.member minimal subset /\
    forall element,
      LRA.VolumeI.Set.LRASet.member element subset ->
        Not (strictRelation element minimal)

/-- A maximal element of a subset with respect to a strict order. -/
def MaximalElement {alpha : LRA.VolumeI.Set.LRACarrier}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha)
    (subset : LRA.VolumeI.Set.LRASet alpha)
    (maximal : alpha) : Prop :=
  LRA.VolumeI.Set.LRASet.member maximal subset /\
    forall element,
      LRA.VolumeI.Set.LRASet.member element subset ->
        Not (strictRelation maximal element)

/-- A supremum, or least upper bound, of a subset. -/
def Supremum {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (subset : LRA.VolumeI.Set.LRASet alpha)
    (supremum : alpha) : Prop :=
  UpperBound relation subset supremum /\
    forall bound, UpperBound relation subset bound -> relation supremum bound

/-- An infimum, or greatest lower bound, of a subset. -/
def Infimum {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (subset : LRA.VolumeI.Set.LRASet alpha)
    (infimum : alpha) : Prop :=
  LowerBound relation subset infimum /\
    forall bound, LowerBound relation subset bound -> relation bound infimum

end LRA.VolumeI.Order
