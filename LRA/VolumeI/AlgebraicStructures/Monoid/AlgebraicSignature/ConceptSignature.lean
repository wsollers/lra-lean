import LRA.VolumeI.UniversalAlgebra.Signatures.OperationBundles

namespace LRA.AlgebraicStructures

/-- The algebraic signature of a monoid: multiplication and one. -/
structure MonoidConceptSignature extends
    LRA.UniversalAlgebra.Signatures.MultiplicativeSignature where
  one : carrier

end LRA.AlgebraicStructures
