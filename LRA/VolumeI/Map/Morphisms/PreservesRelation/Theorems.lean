import LRA.VolumeI.Map.Morphisms.PreservesRelation.Definition

namespace LRA.Map.Morphisms

universe u v

theorem PreservesRelation.apply {Source : Type u} {Target : Type v}
    {map : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (law : PreservesRelation map sourceRelation targetRelation)
    {left right : Source}
    (related : sourceRelation left right) :
    targetRelation (map left) (map right) :=
  law left right related

end LRA.Map.Morphisms
