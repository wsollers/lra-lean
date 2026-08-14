import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.VolumeI.Order

universe u v

/-- A map is monotone when it preserves the displayed relations. -/
def Monotone
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.VolumeI.Relations.Endorelation Alpha)
    (targetRelation : LRA.VolumeI.Relations.Endorelation Beta)
    (map : Alpha -> Beta) : Prop :=
  forall left right,
    sourceRelation left right -> targetRelation (map left) (map right)

end LRA.VolumeI.Order
