import LRA.VolumeI.Relations.Order.Lattices

namespace LRA.VolumeI.Relations.Order

universe u

/-- Least-upper-bound property for a non-strict order. -/
def LeastUpperBoundProperty
    (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (relation : LRA.VolumeI.Relations.Endorelation interface.Element) : Prop :=
  forall subset : interface.SetObject,
    (exists element, interface.member element subset) ->
      (exists upperBound, UpperBound interface relation subset upperBound) ->
        exists supremum, Supremum interface relation subset supremum

/-- Greatest-lower-bound property for a non-strict order. -/
def GreatestLowerBoundProperty
    (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (relation : LRA.VolumeI.Relations.Endorelation interface.Element) : Prop :=
  forall subset : interface.SetObject,
    (exists element, interface.member element subset) ->
      (exists lowerBound, LowerBound interface relation subset lowerBound) ->
        exists infimum, Infimum interface relation subset infimum

/-- Complete lattice laws: every subset has both a supremum and an infimum. -/
def CompleteLattice
    (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (relation : LRA.VolumeI.Relations.Endorelation interface.Element) : Prop :=
  PartialOrder relation /\
    forall subset : interface.SetObject,
      (exists supremum, Supremum interface relation subset supremum) /\
        (exists infimum, Infimum interface relation subset infimum)

end LRA.VolumeI.Relations.Order
