import LRA.Order.Bounds.Infimum.Definition
import LRA.Order.Bounds.Supremum.Definition
import LRA.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u v

/-- A complete lattice is a partial order in which every represented subset has a supremum and an infimum. -/
def CompleteLattice
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  PartialOrder relation /\
    forall subset : SetObject,
      (exists supremum, Supremum relation subset supremum) /\
        (exists infimum, Infimum relation subset infimum)

end LRA.Order
