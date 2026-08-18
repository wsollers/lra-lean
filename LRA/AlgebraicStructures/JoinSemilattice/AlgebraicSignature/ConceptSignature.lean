import LRA.UniversalAlgebra.InterpretedOperationBundles

namespace LRA.AlgebraicStructures

/-- The algebraic signature of a join semilattice: one binary join operation. -/
structure JoinSemilatticeConceptSignature extends
    LRA.UniversalAlgebra.InterpretedOperationBundles.CarrierBundle where
  join : LRA.Operation.BinaryOperation carrier

end LRA.AlgebraicStructures
