import LRA.Operation.Definition

namespace LRA.Morphism

universe u v

                                                                                  
def PreservesNullaryOperation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceElement : LRA.Operation.NullaryOperation Source)
    (targetElement : LRA.Operation.NullaryOperation Target) : Prop :=
  function sourceElement = targetElement

end LRA.Morphism
