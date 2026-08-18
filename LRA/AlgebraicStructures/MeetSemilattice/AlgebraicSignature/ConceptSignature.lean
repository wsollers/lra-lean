import LRA.UniversalAlgebra.InterpretedOperationBundles

namespace LRA.AlgebraicStructures

/-- The algebraic signature of a meet semilattice: one binary meet operation. -/
structure MeetSemilatticeConceptSignature extends
    LRA.UniversalAlgebra.InterpretedOperationBundles.CarrierBundle where
  meet : LRA.Operation.BinaryOperation carrier

end LRA.AlgebraicStructures
