import LRA.VolumeI.Relations.Order.Lattices

namespace LRA.VolumeI.Relations.Order

universe u

/-- Least-upper-bound property for a non-strict order. -/
def LeastUpperBoundProperty {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  forall subset : LRA.VolumeI.Set.LRASet alpha,
    LRA.VolumeI.Set.LRASet.nonempty subset ->
      (exists upperBound, UpperBound relation subset upperBound) ->
        exists supremum, Supremum relation subset supremum

/-- Greatest-lower-bound property for a non-strict order. -/
def GreatestLowerBoundProperty {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  forall subset : LRA.VolumeI.Set.LRASet alpha,
    LRA.VolumeI.Set.LRASet.nonempty subset ->
      (exists lowerBound, LowerBound relation subset lowerBound) ->
        exists infimum, Infimum relation subset infimum

/-- Complete lattice laws: every subset has both a supremum and an infimum. -/
def CompleteLattice {alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  PartialOrder relation /\
    forall subset : LRA.VolumeI.Set.LRASet alpha,
      (exists supremum, Supremum relation subset supremum) /\
        (exists infimum, Infimum relation subset infimum)

end LRA.VolumeI.Relations.Order
