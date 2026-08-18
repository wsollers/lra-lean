import LRA.Order.Morphisms.Monotone.Definition

namespace LRA.Order

universe u v

/-- An order embedding preserves and reflects the displayed relation. -/
def OrderEmbedding
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.Relation.Endorelation Alpha)
    (targetRelation : LRA.Relation.Endorelation Beta)
    (map : Alpha -> Beta) : Prop :=
  forall left right,
    sourceRelation left right ↔ targetRelation (map left) (map right)

end LRA.Order
