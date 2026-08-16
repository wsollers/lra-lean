import LRA.VolumeI.Map.Operation.Laws.NumberEmbeddings.Theorems

namespace LRA.Map.Operation.Laws.NumberEmbeddings

/-!
Consequences and projections for number-embedding map predicates.
-/

universe u v

/-- Relation preservation is monotonicity for the displayed relations. -/
theorem PreservesRelation.is_monotone
    {Source : Type u} {Target : Type v}
    {embedding : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (preserves : PreservesRelation embedding sourceRelation targetRelation) :
    LRA.Order.Monotone sourceRelation targetRelation embedding := by
  sorry

/-- The strong relation-embedding predicate includes injectivity. -/
theorem InjectiveRelationEmbedding.injective
    {Source : Type u} {Target : Type v}
    {embedding : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (embeddingIsRelationEmbedding :
      InjectiveRelationEmbedding embedding sourceRelation targetRelation) :
    InjectiveMap embedding := by
  sorry

/-- The strong relation-embedding predicate preserves the displayed relation. -/
theorem InjectiveRelationEmbedding.preserves
    {Source : Type u} {Target : Type v}
    {embedding : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (embeddingIsRelationEmbedding :
      InjectiveRelationEmbedding embedding sourceRelation targetRelation) :
    PreservesRelation embedding sourceRelation targetRelation := by
  sorry

/-- The strong relation-embedding predicate reflects the displayed relation. -/
theorem InjectiveRelationEmbedding.reflects
    {Source : Type u} {Target : Type v}
    {embedding : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (embeddingIsRelationEmbedding :
      InjectiveRelationEmbedding embedding sourceRelation targetRelation) :
    ReflectsRelation embedding sourceRelation targetRelation := by
  sorry

end LRA.Map.Operation.Laws.NumberEmbeddings
