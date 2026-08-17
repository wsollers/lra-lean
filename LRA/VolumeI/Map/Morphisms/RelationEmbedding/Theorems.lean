import LRA.VolumeI.Map.Morphisms.RelationEmbedding.Definition

namespace LRA.Map.Morphisms

universe u v

theorem PreservesAndReflectsRelation.preserves
    {Source : Type u} {Target : Type v}
    {map : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (law : PreservesAndReflectsRelation map sourceRelation targetRelation) :
    PreservesRelation map sourceRelation targetRelation :=
  law.left

theorem PreservesAndReflectsRelation.reflects
    {Source : Type u} {Target : Type v}
    {map : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (law : PreservesAndReflectsRelation map sourceRelation targetRelation) :
    ReflectsRelation map sourceRelation targetRelation :=
  law.right

theorem RelationEmbedding.injective
    {Source : Type u} {Target : Type v}
    {map : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (embedding : RelationEmbedding map sourceRelation targetRelation) :
    LRA.Map.Injective.Injective map :=
  embedding.left

theorem RelationEmbedding.preserves_and_reflects
    {Source : Type u} {Target : Type v}
    {map : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (embedding : RelationEmbedding map sourceRelation targetRelation) :
    PreservesAndReflectsRelation map sourceRelation targetRelation :=
  embedding.right

theorem RelationEmbedding.preserves
    {Source : Type u} {Target : Type v}
    {map : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (embedding : RelationEmbedding map sourceRelation targetRelation) :
    PreservesRelation map sourceRelation targetRelation :=
  embedding.right.left

theorem RelationEmbedding.reflects
    {Source : Type u} {Target : Type v}
    {map : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (embedding : RelationEmbedding map sourceRelation targetRelation) :
    ReflectsRelation map sourceRelation targetRelation :=
  embedding.right.right

end LRA.Map.Morphisms
