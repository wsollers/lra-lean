import LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Laws.Definition
import LRA.UniversalAlgebra.InterpretedOperationBundles

namespace LRA.AlgebraicStructures

structure CommutativeSemiringWithoutZeroConceptSignature extends
    LRA.UniversalAlgebra.InterpretedOperationBundles.AdditiveOperationBundle where
  multiply : LRA.Operation.BinaryOperation carrier
  one : carrier

end LRA.AlgebraicStructures
