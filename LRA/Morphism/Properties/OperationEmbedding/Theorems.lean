import LRA.Morphism.Properties.OperationEmbedding.Definition

namespace LRA.Morphism

universe u v

section OperationEmbedding

variable {Source : Type u} {Target : Type v}
variable {function : Source → Target}
variable {sourceOperation : LRA.Operation.BinaryEndoOperation Source}
variable {targetOperation : LRA.Operation.BinaryEndoOperation Target}

/-- A binary-operation embedding is injective. -/
theorem BinaryOperationEmbedding.injective
    (law : BinaryOperationEmbedding function sourceOperation targetOperation) :
    LRA.Function.Injective function := by
  sorry

/-- A binary-operation embedding preserves the operation. -/
theorem BinaryOperationEmbedding.preserves
    (law : BinaryOperationEmbedding function sourceOperation targetOperation) :
    PreservesBinaryOperation function sourceOperation targetOperation := by
  sorry

end OperationEmbedding

end LRA.Morphism
