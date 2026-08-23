import LRA.Morphism.Properties.ReflectsRelation.Definition

namespace LRA.Morphism

universe u v

                                                             
theorem ReflectsRelation.apply {Source : Type u} {Target : Type v}
    {function : Source → Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (law : ReflectsRelation function sourceRelation targetRelation)
    {left right : Source}
    (relatedValues : targetRelation (function left) (function right)) :
    sourceRelation left right := by
  sorry

end LRA.Morphism
