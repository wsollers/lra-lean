import LRA.VolumeI.Function.Morphisms.PreservesNullaryOperation.Definition

namespace LRA.Function.Morphisms

universe u v

/-- Failure of distinguished-element preservation by a map. -/
def FailsPreservesNullaryOperation {Source : Type u} {Target : Type v}
    (map : Source -> Target)
    (sourceElement : LRA.Operation.NullaryOperation Source)
    (targetElement : LRA.Operation.NullaryOperation Target) : Prop :=
  Not (PreservesNullaryOperation map sourceElement targetElement)

/-- Constant map from natural numbers to integers. -/
def ConstantZeroNaturalToIntegerFunction (_ : Nat) : Int :=
  0

end LRA.Function.Morphisms
