import LRA.Morphism.Properties.PreservesBinaryOperation.Definition

namespace LRA.Morphism

universe u v

/-- Failure of binary-operation preservation by a function. -/
def FailsPreservesBinaryOperation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceOperation : LRA.Operation.BinaryEndoOperation Source)
    (targetOperation : LRA.Operation.BinaryEndoOperation Target) : Prop :=
  ¬ PreservesBinaryOperation function sourceOperation targetOperation

end LRA.Morphism
