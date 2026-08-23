import LRA.AlgebraicStructures.JoinSemilattice.Laws.Definition
import LRA.UniversalAlgebra.InterpretedOperationBundles

namespace LRA.AlgebraicStructures

                                                                                
structure JoinSemilatticeConceptSignature extends
    LRA.UniversalAlgebra.InterpretedOperationBundles.CarrierBundle where
  join : LRA.Operation.BinaryOperation carrier

end LRA.AlgebraicStructures
