import LRA.VolumeI.Map.Morphisms.PreservesNullaryOperation.Definition

namespace LRA.Map.Morphisms

universe u v

/-- Failure of distinguished-element preservation by a map. -/
def FailsPreservesNullaryOperation {Source : Type u} {Target : Type v}
    (map : Source -> Target)
    (sourceElement : LRA.Operation.NullaryOperation Source)
    (targetElement : LRA.Operation.NullaryOperation Target) : Prop :=
  Not (PreservesNullaryOperation map sourceElement targetElement)

/-- Constant map from natural numbers to integers. -/
def ConstantZeroNaturalToIntegerMap (_ : Nat) : Int :=
  0

end LRA.Map.Morphisms
