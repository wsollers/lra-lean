import LRA.VolumeI.Relations.Order.OrderStructures.Preorder

namespace LRA.VolumeI.Relations.Order

universe u

/-- Partial-order laws for an endorelation. -/
def PartialOrder {Alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  LRA.VolumeI.Relations.Reflexive relation /\
    LRA.VolumeI.Relations.Antisymmetric relation /\
      LRA.VolumeI.Relations.Transitive relation

end LRA.VolumeI.Relations.Order
