import LRA.UniversalAlgebra.InterpretedOperationBundles

namespace LRA.AlgebraicStructures

/-- The algebraic signature of an additive monoid: addition and zero. -/
structure AdditiveMonoidConceptSignature extends
    LRA.UniversalAlgebra.InterpretedOperationBundles.AdditiveOperationBundle where
  zero : carrier

end LRA.AlgebraicStructures
