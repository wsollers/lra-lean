import LRA.VolumeI.Map.Morphisms.OperationEmbedding.Definition

namespace LRA.Map.Morphisms

universe u v

theorem BinaryOperationEmbedding.injective {Source : Type u} {Target : Type v}
    {map : Source -> Target}
    {sourceOperation : LRA.Operation.BinaryEndoOperation Source}
    {targetOperation : LRA.Operation.BinaryEndoOperation Target}
    (law : BinaryOperationEmbedding map sourceOperation targetOperation) :
    LRA.Map.Injective.Injective map :=
  law.left

theorem BinaryOperationEmbedding.preserves {Source : Type u} {Target : Type v}
    {map : Source -> Target}
    {sourceOperation : LRA.Operation.BinaryEndoOperation Source}
    {targetOperation : LRA.Operation.BinaryEndoOperation Target}
    (law : BinaryOperationEmbedding map sourceOperation targetOperation) :
    PreservesBinaryOperation map sourceOperation targetOperation :=
  law.right

end LRA.Map.Morphisms
