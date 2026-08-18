import LRA.AlgebraicStructures.AdditiveSemigroup.Laws.Definition
import LRA.UniversalAlgebra.InterpretedOperationBundles

namespace LRA.AlgebraicStructures

/-- The algebraic signature of an additive semigroup: one binary addition. -/
abbrev AdditiveSemigroupConceptSignature :=
  LRA.UniversalAlgebra.InterpretedOperationBundles.AdditiveOperationBundle

end LRA.AlgebraicStructures
