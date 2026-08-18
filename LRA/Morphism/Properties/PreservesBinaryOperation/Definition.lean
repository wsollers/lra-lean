import LRA.Operation.Definition

namespace LRA.Morphism

universe u v

/-- A function preserves a binary operation. -/
def PreservesBinaryOperation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceOperation : LRA.Operation.BinaryEndoOperation Source)
    (targetOperation : LRA.Operation.BinaryEndoOperation Target) : Prop :=
  ∀ left right,
    function (sourceOperation left right) =
      targetOperation (function left) (function right)

end LRA.Morphism
