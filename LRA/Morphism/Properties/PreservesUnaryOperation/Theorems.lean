import LRA.Morphism.Properties.PreservesUnaryOperation.Definition

namespace LRA.Morphism

universe u v

/-- Apply unary-operation preservation at an element. -/
theorem PreservesUnaryOperation.apply {Source : Type u} {Target : Type v}
    {function : Source → Target}
    {sourceOperation : LRA.Operation.UnaryEndoOperation Source}
    {targetOperation : LRA.Operation.UnaryEndoOperation Target}
    (law : PreservesUnaryOperation function sourceOperation targetOperation)
    (element : Source) :
    function (sourceOperation element) = targetOperation (function element) := by
  sorry

end LRA.Morphism
