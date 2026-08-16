import LRA.VolumeI.Operations.Laws.NumberEmbeddings.Theorems

namespace LRA.Operation.Laws.NumberEmbeddings

open LRA.Operation

universe u v w

theorem MixedBinaryOperationByEmbedding.has_result_carrier
    {Left : Type u} {Right : Type v} {Result : Type w}
    (leftEmbedding : Left -> Result)
    (rightEmbedding : Right -> Result)
    (resultOperation : BinaryEndoOperation Result) :
    MixedOperationResultCarrier
      (MixedBinaryOperationByEmbedding leftEmbedding rightEmbedding resultOperation) := by
  sorry

theorem MixedOperationIsEndoAfterCommonCarrierChoice {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) :
    MixedOperationResultCarrier operation := by
  sorry

theorem LeftEmbeddableIntoResult.injective
    {Left : Type u} {Result : Type w}
    {leftEmbedding : Left -> Result}
    (law : LeftEmbeddableIntoResult leftEmbedding) :
    InjectiveMap leftEmbedding := by
  sorry

theorem RightEmbeddableIntoResult.injective
    {Right : Type v} {Result : Type w}
    {rightEmbedding : Right -> Result}
    (law : RightEmbeddableIntoResult rightEmbedding) :
    InjectiveMap rightEmbedding := by
  sorry

end LRA.Operation.Laws.NumberEmbeddings
