import LRA.Morphism.Properties.ReflectsRelation.Definition

namespace LRA.Morphism

universe u v

/-- Apply relation reflection to a related pair of values. -/
theorem ReflectsRelation.apply {Source : Type u} {Target : Type v}
    {function : Source → Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (law : ReflectsRelation function sourceRelation targetRelation)
    {left right : Source}
    (relatedValues : targetRelation (function left) (function right)) :
    sourceRelation left right :=
  law left right relatedValues

end LRA.Morphism
