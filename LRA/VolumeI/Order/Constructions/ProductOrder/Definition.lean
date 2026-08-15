import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.Order

universe u v

/-- The coordinatewise product of two relations. -/
def ProductRelation
    {Alpha : Type u} {Beta : Type v}
    (leftRelation : LRA.Relation.Endorelation Alpha)
    (rightRelation : LRA.Relation.Endorelation Beta) :
    LRA.Relation.Endorelation (Alpha × Beta) :=
  fun first second =>
    leftRelation first.1 second.1 /\ rightRelation first.2 second.2

end LRA.Order
