import LRA.AlgebraicStructures.Semigroup.Laws.Definition
import LRA.UniversalAlgebra.InterpretedOperationBundles

namespace LRA.AlgebraicStructures

/-- The algebraic signature of a semigroup: one binary multiplication. -/
abbrev SemigroupConceptSignature :=
  LRA.UniversalAlgebra.InterpretedOperationBundles.MultiplicativeOperationBundle

end LRA.AlgebraicStructures
