import LRA.Morphism.Properties.RelationEmbedding.Definition

namespace LRA.Morphism

universe u v

section RelationEmbedding

variable {Source : Type u} {Target : Type v}
variable {function : Source → Target}
variable {sourceRelation : LRA.Relation.Endorelation Source}
variable {targetRelation : LRA.Relation.Endorelation Target}

/-- A preserving-and-reflecting function preserves. -/
theorem PreservesAndReflectsRelation.preserves
    (law : PreservesAndReflectsRelation function sourceRelation targetRelation) :
    PreservesRelation function sourceRelation targetRelation :=
  law.left

/-- A preserving-and-reflecting function reflects. -/
theorem PreservesAndReflectsRelation.reflects
    (law : PreservesAndReflectsRelation function sourceRelation targetRelation) :
    ReflectsRelation function sourceRelation targetRelation :=
  law.right

/-- A relation embedding is injective. -/
theorem RelationEmbedding.injective
    (embedding : RelationEmbedding function sourceRelation targetRelation) :
    LRA.Function.Injective function :=
  embedding.left

/-- A relation embedding preserves and reflects. -/
theorem RelationEmbedding.preserves_and_reflects
    (embedding : RelationEmbedding function sourceRelation targetRelation) :
    PreservesAndReflectsRelation function sourceRelation targetRelation :=
  embedding.right

/-- A relation embedding preserves. -/
theorem RelationEmbedding.preserves
    (embedding : RelationEmbedding function sourceRelation targetRelation) :
    PreservesRelation function sourceRelation targetRelation :=
  embedding.right.left

/-- A relation embedding reflects. -/
theorem RelationEmbedding.reflects
    (embedding : RelationEmbedding function sourceRelation targetRelation) :
    ReflectsRelation function sourceRelation targetRelation :=
  embedding.right.right

end RelationEmbedding

end LRA.Morphism
