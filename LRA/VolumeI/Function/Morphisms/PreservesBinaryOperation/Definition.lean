import LRA.VolumeI.Operations.Definition

namespace LRA.Function.Morphisms

universe u v

/-- A map preserves a binary operation. -/
def PreservesBinaryOperation {Source : Type u} {Target : Type v}
    (map : Source -> Target)
    (sourceOperation : LRA.Operation.BinaryEndoOperation Source)
    (targetOperation : LRA.Operation.BinaryEndoOperation Target) : Prop :=
  forall left right,
    map (sourceOperation left right) =
      targetOperation (map left) (map right)

end LRA.Function.Morphisms
