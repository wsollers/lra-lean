import LRA.Morphism.Properties.OperationEmbedding.Definition

namespace LRA.Morphism

universe u v

/-- Failure of binary-operation embedding by a function. -/
def FailsBinaryOperationEmbedding {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceOperation : LRA.Operation.BinaryEndoOperation Source)
    (targetOperation : LRA.Operation.BinaryEndoOperation Target) : Prop :=
  ¬ BinaryOperationEmbedding function sourceOperation targetOperation

end LRA.Morphism
