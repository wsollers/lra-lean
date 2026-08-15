import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.Order

universe u v

/-- A map is monotone when it preserves the displayed relations. -/
def Monotone
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.Relation.Endorelation Alpha)
    (targetRelation : LRA.Relation.Endorelation Beta)
    (map : Alpha -> Beta) : Prop :=
  forall left right,
    sourceRelation left right -> targetRelation (map left) (map right)

end LRA.Order
