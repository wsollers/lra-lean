import LRA.Morphism.Properties.PreservesNullaryOperation.Definition

namespace LRA.Morphism

universe u v

                                                                   
def FailsPreservesNullaryOperation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceElement : LRA.Operation.NullaryOperation Source)
    (targetElement : LRA.Operation.NullaryOperation Target) : Prop :=
  ¬ PreservesNullaryOperation function sourceElement targetElement

                                                          
def ConstantZeroNaturalToIntegerFunction (_ : Nat) : Int :=
  0

end LRA.Morphism
