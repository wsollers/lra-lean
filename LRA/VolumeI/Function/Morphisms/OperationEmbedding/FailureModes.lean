import LRA.VolumeI.Function.Morphisms.OperationEmbedding.Definition

namespace LRA.Function.Morphisms

universe u v

/-- Failure of binary-operation embedding. -/
def FailsBinaryOperationEmbedding {Source : Type u} {Target : Type v}
    (map : Source -> Target)
    (sourceOperation : LRA.Operation.BinaryEndoOperation Source)
    (targetOperation : LRA.Operation.BinaryEndoOperation Target) : Prop :=
  Not (BinaryOperationEmbedding map sourceOperation targetOperation)

end LRA.Function.Morphisms
