import LRA.Morphism.Properties.RelationEmbedding.Definition

namespace LRA.Morphism

universe u v

                                                   
def FailsRelationEmbedding {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  ¬ RelationEmbedding function sourceRelation targetRelation

end LRA.Morphism
