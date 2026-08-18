import LRA.VolumeI.Function.Morphisms.PreservesRelation.Definition

namespace LRA.Function.Morphisms

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

end LRA.Function.Morphisms
