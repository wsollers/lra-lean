import LRA.VolumeI.Operations.Definition

namespace LRA.Function.Morphisms

universe u v

/-- A map preserves a nullary operation, i.e. a distinguished element. -/
def PreservesNullaryOperation {Source : Type u} {Target : Type v}
    (map : Source -> Target)
    (sourceElement : LRA.Operation.NullaryOperation Source)
    (targetElement : LRA.Operation.NullaryOperation Target) : Prop :=
  map sourceElement = targetElement

end LRA.Function.Morphisms
