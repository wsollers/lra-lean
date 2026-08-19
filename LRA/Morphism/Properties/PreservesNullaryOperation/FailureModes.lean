import LRA.Morphism.Properties.PreservesNullaryOperation.Definition

namespace LRA.Morphism

universe u v

/-- Failure of distinguished-element preservation by a function. -/
def FailsPreservesNullaryOperation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceElement : LRA.Operation.NullaryOperation Source)
    (targetElement : LRA.Operation.NullaryOperation Target) : Prop :=
  ¬ PreservesNullaryOperation function sourceElement targetElement

/-- Constant function from natural numbers to integers. -/
def ConstantZeroNaturalToIntegerFunction (_ : Nat) : Int :=
  0

end LRA.Morphism
