import LRA.Morphism.Properties.OperationEmbedding.Definition

namespace LRA.Morphism

universe u v

section OperationEmbedding

variable {Source : Type u} {Target : Type v}
variable {function : Source → Target}
variable {sourceOperation : LRA.Operation.BinaryEndoOperation Source}
variable {targetOperation : LRA.Operation.BinaryEndoOperation Target}

                                                 
theorem BinaryOperationEmbedding.injective
    (law : BinaryOperationEmbedding function sourceOperation targetOperation) :
    LRA.Function.Injective function := by
  sorry

                                                            
theorem BinaryOperationEmbedding.preserves
    (law : BinaryOperationEmbedding function sourceOperation targetOperation) :
    PreservesBinaryOperation function sourceOperation targetOperation := by
  sorry

end OperationEmbedding

end LRA.Morphism
