import LRA.VolumeI.Order.Bounds.Infimum.Definition
import LRA.VolumeI.Order.Bounds.Supremum.Definition
import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u v

/--
A complete lattice is a partial order in which every represented subset has a
supremum and an infimum. Empty subsets are deliberately included: their
supremum is a bottom element and their infimum is a top element.

Because `SetObject` is explicit, this is completeness relative to the chosen
set backend. Backend-independent consequences requiring empty, universal, or
comprehension-defined subsets are stated for `Set Element`.
-/
def CompleteLattice
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  PartialOrder relation /\
    forall subset : SetObject,
      (exists supremum, Supremum relation subset supremum) /\
        (exists infimum, Infimum relation subset infimum)

end LRA.Order
