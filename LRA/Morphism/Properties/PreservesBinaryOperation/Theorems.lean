import LRA.Morphism.Properties.PreservesBinaryOperation.Definition

namespace LRA.Morphism

universe u v

                                                                 
theorem PreservesBinaryOperation.apply {Source : Type u} {Target : Type v}
    {function : Source → Target}
    {sourceOperation : LRA.Operation.BinaryEndoOperation Source}
    {targetOperation : LRA.Operation.BinaryEndoOperation Target}
    (law : PreservesBinaryOperation function sourceOperation targetOperation)
    (left right : Source) :
    function (sourceOperation left right) =
      targetOperation (function left) (function right) := by
  sorry

end LRA.Morphism
