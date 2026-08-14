import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.VolumeI.Order

universe u v

/-- A map is antitone when it reverses the displayed relations. -/
def Antitone
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.VolumeI.Relations.Endorelation Alpha)
    (targetRelation : LRA.VolumeI.Relations.Endorelation Beta)
    (map : Alpha -> Beta) : Prop :=
  forall left right,
    sourceRelation left right -> targetRelation (map right) (map left)

end LRA.VolumeI.Order
