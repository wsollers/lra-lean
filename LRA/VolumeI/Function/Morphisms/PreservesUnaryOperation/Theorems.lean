import LRA.VolumeI.Function.Morphisms.PreservesUnaryOperation.Definition

namespace LRA.Function.Morphisms

universe u v

theorem PreservesUnaryOperation.apply {Source : Type u} {Target : Type v}
    {map : Source -> Target}
    {sourceOperation : LRA.Operation.UnaryEndoOperation Source}
    {targetOperation : LRA.Operation.UnaryEndoOperation Target}
    (law : PreservesUnaryOperation map sourceOperation targetOperation)
    (element : Source) :
    map (sourceOperation element) = targetOperation (map element) :=
  law element

end LRA.Function.Morphisms
