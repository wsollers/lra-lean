import LRA.VolumeI.Map.Morphisms.ReflectsRelation.Definition

namespace LRA.Map.Morphisms

universe u v

theorem ReflectsRelation.apply {Source : Type u} {Target : Type v}
    {map : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (law : ReflectsRelation map sourceRelation targetRelation)
    {left right : Source}
    (related_targets : targetRelation (map left) (map right)) :
    sourceRelation left right :=
  law left right related_targets

end LRA.Map.Morphisms
