import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.VolumeI.Order

universe u v

/-- The coordinatewise product of two relations. -/
def ProductRelation
    {Alpha : Type u} {Beta : Type v}
    (leftRelation : LRA.VolumeI.Relations.Endorelation Alpha)
    (rightRelation : LRA.VolumeI.Relations.Endorelation Beta) :
    LRA.VolumeI.Relations.Endorelation (Alpha × Beta) :=
  fun first second =>
    leftRelation first.1 second.1 /\ rightRelation first.2 second.2

end LRA.VolumeI.Order
