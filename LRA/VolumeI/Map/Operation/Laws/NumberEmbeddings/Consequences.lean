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
    LRA.Order.Monotone sourceRelation targetRelation embedding :=
  preserves

/-- The strong relation-embedding predicate includes injectivity. -/
theorem InjectiveRelationEmbedding.injective
    {Source : Type u} {Target : Type v}
    {embedding : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (embeddingIsRelationEmbedding :
      InjectiveRelationEmbedding embedding sourceRelation targetRelation) :
    InjectiveMap embedding :=
  embeddingIsRelationEmbedding.1

/-- The strong relation-embedding predicate preserves the displayed relation. -/
theorem InjectiveRelationEmbedding.preserves
    {Source : Type u} {Target : Type v}
    {embedding : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (embeddingIsRelationEmbedding :
      InjectiveRelationEmbedding embedding sourceRelation targetRelation) :
    PreservesRelation embedding sourceRelation targetRelation :=
  embeddingIsRelationEmbedding.2.1

/-- The strong relation-embedding predicate reflects the displayed relation. -/
theorem InjectiveRelationEmbedding.reflects
    {Source : Type u} {Target : Type v}
    {embedding : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (embeddingIsRelationEmbedding :
      InjectiveRelationEmbedding embedding sourceRelation targetRelation) :
    ReflectsRelation embedding sourceRelation targetRelation :=
  embeddingIsRelationEmbedding.2.2

end LRA.Map.Operation.Laws.NumberEmbeddings
