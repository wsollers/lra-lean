import LRA.VolumeI.Map.Morphisms.PreservesBinaryOperation.Definition

namespace LRA.Map.Morphisms

universe u v

theorem PreservesBinaryOperation.apply {Source : Type u} {Target : Type v}
    {map : Source -> Target}
    {sourceOperation : LRA.Operation.BinaryEndoOperation Source}
    {targetOperation : LRA.Operation.BinaryEndoOperation Target}
    (law : PreservesBinaryOperation map sourceOperation targetOperation)
    (left right : Source) :
    map (sourceOperation left right) =
      targetOperation (map left) (map right) :=
  law left right

end LRA.Map.Morphisms
