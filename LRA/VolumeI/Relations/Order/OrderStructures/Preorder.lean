import LRA.VolumeI.Relations.Order.Relations

namespace LRA.VolumeI.Relations.Order

universe u

/-- Preorder laws for an endorelation. -/
def Preorder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  LRA.VolumeI.Relations.Reflexive relation /\
    LRA.VolumeI.Relations.Transitive relation

end LRA.VolumeI.Relations.Order
