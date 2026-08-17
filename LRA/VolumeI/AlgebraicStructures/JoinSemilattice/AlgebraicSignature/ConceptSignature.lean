import LRA.VolumeI.UniversalAlgebra.Signatures.OperationBundles

namespace LRA.AlgebraicStructures

/-- The algebraic signature of a join semilattice: one binary join operation. -/
structure JoinSemilatticeConceptSignature extends
    LRA.UniversalAlgebra.Signatures.CarrierSignature where
  join : LRA.Operation.BinaryOperation carrier

end LRA.AlgebraicStructures
