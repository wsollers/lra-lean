import LRA.VolumeI.Function.Injective.Definition
import LRA.VolumeI.Function.Morphisms.PreservesBinaryOperation.Definition

namespace LRA.Function.Morphisms

universe u v

/-- A map is a binary-operation embedding when it is injective and operation-preserving. -/
def BinaryOperationEmbedding {Source : Type u} {Target : Type v}
    (map : Source -> Target)
    (sourceOperation : LRA.Operation.BinaryEndoOperation Source)
    (targetOperation : LRA.Operation.BinaryEndoOperation Target) : Prop :=
  LRA.Function.Injective.Injective map /\
    PreservesBinaryOperation map sourceOperation targetOperation

end LRA.Function.Morphisms
