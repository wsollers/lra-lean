import LRA.VolumeI.Function.Morphisms.PreservesUnaryOperation.Definition

namespace LRA.Function.Morphisms

universe u v

/-- Failure of unary-operation preservation by a map. -/
def FailsPreservesUnaryOperation {Source : Type u} {Target : Type v}
    (map : Source -> Target)
    (sourceOperation : LRA.Operation.UnaryEndoOperation Source)
    (targetOperation : LRA.Operation.UnaryEndoOperation Target) : Prop :=
  Not (PreservesUnaryOperation map sourceOperation targetOperation)

end LRA.Function.Morphisms
