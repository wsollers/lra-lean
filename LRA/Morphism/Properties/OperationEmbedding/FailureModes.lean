import LRA.Morphism.Properties.OperationEmbedding.Definition

namespace LRA.Morphism

universe u v

                                                           
def FailsBinaryOperationEmbedding {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceOperation : LRA.Operation.BinaryEndoOperation Source)
    (targetOperation : LRA.Operation.BinaryEndoOperation Target) : Prop :=
  ¬ BinaryOperationEmbedding function sourceOperation targetOperation

end LRA.Morphism
