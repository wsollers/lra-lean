import LRA.UniversalAlgebra.InterpretedOperationBundles

namespace LRA.AlgebraicStructures

/-- The algebraic signature of a monoid: multiplication and one. -/
structure MonoidConceptSignature extends
    LRA.UniversalAlgebra.InterpretedOperationBundles.MultiplicativeOperationBundle where
  one : carrier

end LRA.AlgebraicStructures
