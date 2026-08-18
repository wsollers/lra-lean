import LRA.Morphism.Properties.PreservesUnaryOperation.Definition

namespace LRA.Morphism

universe u v

/-- Failure of unary-operation preservation by a function. -/
def FailsPreservesUnaryOperation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceOperation : LRA.Operation.UnaryEndoOperation Source)
    (targetOperation : LRA.Operation.UnaryEndoOperation Target) : Prop :=
  ¬ PreservesUnaryOperation function sourceOperation targetOperation

end LRA.Morphism
