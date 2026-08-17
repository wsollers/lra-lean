import LRA.VolumeI.Operations.Definition

namespace LRA.Map.Morphisms

universe u v

/-- A map preserves a unary operation. -/
def PreservesUnaryOperation {Source : Type u} {Target : Type v}
    (map : Source -> Target)
    (sourceOperation : LRA.Operation.UnaryEndoOperation Source)
    (targetOperation : LRA.Operation.UnaryEndoOperation Target) : Prop :=
  forall element,
    map (sourceOperation element) = targetOperation (map element)

end LRA.Map.Morphisms
