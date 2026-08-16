import LRA.VolumeI.Map.Operation.Laws.NumberEmbeddings.Definition

namespace LRA.Map.Operation.Laws.NumberEmbeddings

open LRA.Map.Operation

universe u v w

theorem InjectiveMap.apply {Source : Type u} {Target : Type v}
    {embedding : Source -> Target}
    (law : InjectiveMap embedding)
    {left right : Source}
    (equal_outputs : embedding left = embedding right) :
    left = right := by
  sorry

theorem PreservesNullaryOperation.apply {Source : Type u} {Target : Type v}
    {embedding : Source -> Target}
    {sourceElement : NullaryOperation Source}
    {targetElement : NullaryOperation Target}
    (law : PreservesNullaryOperation embedding sourceElement targetElement) :
    embedding sourceElement = targetElement := by
  sorry

theorem PreservesUnaryOperation.apply {Source : Type u} {Target : Type v}
    {embedding : Source -> Target}
    {sourceOperation : UnaryEndoOperation Source}
    {targetOperation : UnaryEndoOperation Target}
    (law : PreservesUnaryOperation embedding sourceOperation targetOperation)
    (element : Source) :
    embedding (sourceOperation element) = targetOperation (embedding element) := by
  sorry

theorem PreservesBinaryOperation.apply {Source : Type u} {Target : Type v}
    {embedding : Source -> Target}
    {sourceOperation : BinaryEndoOperation Source}
    {targetOperation : BinaryEndoOperation Target}
    (law : PreservesBinaryOperation embedding sourceOperation targetOperation)
    (left right : Source) :
    embedding (sourceOperation left right) =
      targetOperation (embedding left) (embedding right) := by
  sorry

theorem PreservesRelation.apply {Source : Type u} {Target : Type v}
    {embedding : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (law : PreservesRelation embedding sourceRelation targetRelation)
    {left right : Source}
    (related : sourceRelation left right) :
    targetRelation (embedding left) (embedding right) := by
  sorry

theorem ReflectsRelation.apply {Source : Type u} {Target : Type v}
    {embedding : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (law : ReflectsRelation embedding sourceRelation targetRelation)
    {left right : Source}
    (related_targets : targetRelation (embedding left) (embedding right)) :
    sourceRelation left right := by
  sorry

theorem RelationEmbedding.preserves {Source : Type u} {Target : Type v}
    {embedding : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (law : RelationEmbedding embedding sourceRelation targetRelation) :
    PreservesRelation embedding sourceRelation targetRelation := by
  sorry

theorem RelationEmbedding.reflects {Source : Type u} {Target : Type v}
    {embedding : Source -> Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (law : RelationEmbedding embedding sourceRelation targetRelation) :
    ReflectsRelation embedding sourceRelation targetRelation := by
  sorry

theorem BinaryOperationEmbedding.injective {Source : Type u} {Target : Type v}
    {embedding : Source -> Target}
    {sourceOperation : BinaryEndoOperation Source}
    {targetOperation : BinaryEndoOperation Target}
    (law : BinaryOperationEmbedding embedding sourceOperation targetOperation) :
    InjectiveMap embedding := by
  sorry

theorem BinaryOperationEmbedding.preserves {Source : Type u} {Target : Type v}
    {embedding : Source -> Target}
    {sourceOperation : BinaryEndoOperation Source}
    {targetOperation : BinaryEndoOperation Target}
    (law : BinaryOperationEmbedding embedding sourceOperation targetOperation) :
    PreservesBinaryOperation embedding sourceOperation targetOperation := by
  sorry

theorem MixedBinaryOperationByEmbedding.apply {Left : Type u} {Right : Type v}
    {Result : Type w}
    (leftEmbedding : Left -> Result)
    (rightEmbedding : Right -> Result)
    (resultOperation : BinaryEndoOperation Result)
    (left : Left)
    (right : Right) :
    MixedBinaryOperationByEmbedding leftEmbedding rightEmbedding resultOperation left right =
      resultOperation (leftEmbedding left) (rightEmbedding right) := by
  sorry

end LRA.Map.Operation.Laws.NumberEmbeddings
