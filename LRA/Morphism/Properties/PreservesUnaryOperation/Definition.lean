import LRA.Operation.Definition

namespace LRA.Morphism

universe u v

                                              
def PreservesUnaryOperation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceOperation : LRA.Operation.UnaryEndoOperation Source)
    (targetOperation : LRA.Operation.UnaryEndoOperation Target) : Prop :=
  ∀ element,
    function (sourceOperation element) = targetOperation (function element)

end LRA.Morphism
