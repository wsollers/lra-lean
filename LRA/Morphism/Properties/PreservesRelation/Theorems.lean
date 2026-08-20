import LRA.Morphism.Properties.PreservesRelation.Definition

namespace LRA.Morphism

universe u v

/-- Apply relation preservation to a related pair. -/
theorem PreservesRelation.apply {Source : Type u} {Target : Type v}
    {function : Source → Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (law : PreservesRelation function sourceRelation targetRelation)
    {left right : Source}
    (related : sourceRelation left right) :
    targetRelation (function left) (function right) := by
  sorry

end LRA.Morphism
