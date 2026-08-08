import LRA.VolumeI.Relations.Order.Relations

namespace LRA.VolumeI.Relations.Order

universe u

/-- Strict partial-order laws for an endorelation. -/
def StrictPartialOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  LRA.VolumeI.Relations.Irreflexive relation /\
    LRA.VolumeI.Relations.Transitive relation

end LRA.VolumeI.Relations.Order
