import LRA.VolumeI.Map.Injective.Definition
import LRA.VolumeI.Map.Morphisms.PreservesBinaryOperation.Definition

namespace LRA.Map.Morphisms

universe u v

/-- A map is a binary-operation embedding when it is injective and operation-preserving. -/
def BinaryOperationEmbedding {Source : Type u} {Target : Type v}
    (map : Source -> Target)
    (sourceOperation : LRA.Operation.BinaryEndoOperation Source)
    (targetOperation : LRA.Operation.BinaryEndoOperation Target) : Prop :=
  LRA.Map.Injective.Injective map /\
    PreservesBinaryOperation map sourceOperation targetOperation

end LRA.Map.Morphisms
