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
    PreservesRelation function sourceRelation targetRelation := by
  sorry

/-- A preserving-and-reflecting function reflects. -/
theorem PreservesAndReflectsRelation.reflects
    (law : PreservesAndReflectsRelation function sourceRelation targetRelation) :
    ReflectsRelation function sourceRelation targetRelation := by
  sorry

/-- A relation embedding is injective. -/
theorem RelationEmbedding.injective
    (embedding : RelationEmbedding function sourceRelation targetRelation) :
    LRA.Function.Injective function := by
  sorry

/-- A relation embedding preserves and reflects. -/
theorem RelationEmbedding.preserves_and_reflects
    (embedding : RelationEmbedding function sourceRelation targetRelation) :
    PreservesAndReflectsRelation function sourceRelation targetRelation := by
  sorry

/-- A relation embedding preserves. -/
theorem RelationEmbedding.preserves
    (embedding : RelationEmbedding function sourceRelation targetRelation) :
    PreservesRelation function sourceRelation targetRelation := by
  sorry

/-- A relation embedding reflects. -/
theorem RelationEmbedding.reflects
    (embedding : RelationEmbedding function sourceRelation targetRelation) :
    ReflectsRelation function sourceRelation targetRelation := by
  sorry

end RelationEmbedding

end LRA.Morphism
