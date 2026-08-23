import LRA.AlgebraicStructures.MeetSemilattice.Laws.Definition
import LRA.UniversalAlgebra.InterpretedOperationBundles

namespace LRA.AlgebraicStructures

                                                                                
structure MeetSemilatticeConceptSignature extends
    LRA.UniversalAlgebra.InterpretedOperationBundles.CarrierBundle where
  meet : LRA.Operation.BinaryOperation carrier

end LRA.AlgebraicStructures
