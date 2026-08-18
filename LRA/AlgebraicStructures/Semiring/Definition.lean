import LRA.AlgebraicStructures.Semiring.Laws.Definition
import LRA.UniversalAlgebra.InterpretedOperationBundles

namespace LRA.AlgebraicStructures

/-- The algebraic signature of a semiring: zero, one, addition, multiplication. -/
structure SemiringConceptSignature extends
    LRA.UniversalAlgebra.InterpretedOperationBundles.BooleanRingOperationBundle

end LRA.AlgebraicStructures
