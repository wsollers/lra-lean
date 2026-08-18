import LRA.VolumeI.Function.Morphisms.PreservesBinaryOperation.Definition

namespace LRA.Function.Morphisms

universe u v

/-- Failure of binary-operation preservation by a map. -/
def FailsPreservesBinaryOperation {Source : Type u} {Target : Type v}
    (map : Source -> Target)
    (sourceOperation : LRA.Operation.BinaryEndoOperation Source)
    (targetOperation : LRA.Operation.BinaryEndoOperation Target) : Prop :=
  Not (PreservesBinaryOperation map sourceOperation targetOperation)

end LRA.Function.Morphisms
