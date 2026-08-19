import LRA.Function.Properties.Definition
import LRA.Morphism.Properties.PreservesBinaryOperation.Definition

namespace LRA.Morphism

universe u v

/-- A function is a binary-operation embedding when it is injective and
operation-preserving. -/
def BinaryOperationEmbedding {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceOperation : LRA.Operation.BinaryEndoOperation Source)
    (targetOperation : LRA.Operation.BinaryEndoOperation Target) : Prop :=
  LRA.Function.Injective function ∧
    PreservesBinaryOperation function sourceOperation targetOperation

end LRA.Morphism
