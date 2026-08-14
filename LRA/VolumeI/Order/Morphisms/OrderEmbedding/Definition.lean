import LRA.VolumeI.Order.Morphisms.Monotone.Definition

namespace LRA.VolumeI.Order

universe u v

/-- An order embedding preserves and reflects the displayed relation. -/
def OrderEmbedding
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.VolumeI.Relations.Endorelation Alpha)
    (targetRelation : LRA.VolumeI.Relations.Endorelation Beta)
    (map : Alpha -> Beta) : Prop :=
  forall left right,
    sourceRelation left right ↔ targetRelation (map left) (map right)

end LRA.VolumeI.Order
