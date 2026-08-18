import LRA.VolumeI.Function.Morphisms.RelationEmbedding.Definition

namespace LRA.Function.Morphisms

universe u v

/-- Failure of the canonical strong relation-embedding predicate. -/
def FailsRelationEmbedding {Source : Type u} {Target : Type v}
    (map : Source -> Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  Not (RelationEmbedding map sourceRelation targetRelation)

end LRA.Function.Morphisms
