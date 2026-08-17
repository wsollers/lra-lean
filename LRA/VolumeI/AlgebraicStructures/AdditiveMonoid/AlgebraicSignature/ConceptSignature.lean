import LRA.VolumeI.UniversalAlgebra.Signatures.OperationBundles

namespace LRA.AlgebraicStructures

/-- The algebraic signature of an additive monoid: addition and zero. -/
structure AdditiveMonoidConceptSignature extends
    LRA.UniversalAlgebra.Signatures.AdditiveSignature where
  zero : carrier

end LRA.AlgebraicStructures
