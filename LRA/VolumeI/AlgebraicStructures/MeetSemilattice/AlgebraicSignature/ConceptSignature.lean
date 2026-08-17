import LRA.VolumeI.UniversalAlgebra.Signatures.OperationBundles

namespace LRA.AlgebraicStructures

/-- The algebraic signature of a meet semilattice: one binary meet operation. -/
structure MeetSemilatticeConceptSignature extends
    LRA.UniversalAlgebra.Signatures.CarrierSignature where
  meet : LRA.Operation.BinaryOperation carrier

end LRA.AlgebraicStructures
