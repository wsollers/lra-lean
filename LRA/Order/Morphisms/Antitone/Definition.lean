import LRA.Relation.Definition

namespace LRA.Order

universe u v

/-- A map is antitone when it reverses the displayed relations. -/
def Antitone
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.Relation.Endorelation Alpha)
    (targetRelation : LRA.Relation.Endorelation Beta)
    (map : Alpha -> Beta) : Prop :=
  forall left right,
    sourceRelation left right -> targetRelation (map right) (map left)

end LRA.Order
