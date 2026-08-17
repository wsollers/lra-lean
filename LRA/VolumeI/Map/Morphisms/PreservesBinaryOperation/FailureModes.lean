import LRA.VolumeI.Map.Morphisms.PreservesBinaryOperation.Definition

namespace LRA.Map.Morphisms

universe u v

/-- Failure of binary-operation preservation by a map. -/
def FailsPreservesBinaryOperation {Source : Type u} {Target : Type v}
    (map : Source -> Target)
    (sourceOperation : LRA.Operation.BinaryEndoOperation Source)
    (targetOperation : LRA.Operation.BinaryEndoOperation Target) : Prop :=
  Not (PreservesBinaryOperation map sourceOperation targetOperation)

end LRA.Map.Morphisms
