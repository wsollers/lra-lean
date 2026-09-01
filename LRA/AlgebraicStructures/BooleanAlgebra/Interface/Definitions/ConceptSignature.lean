import LRA.AlgebraicStructures.BooleanAlgebra.Interface.Laws.Definition
import LRA.UniversalAlgebra.InterpretedOperationBundles

namespace LRA.AlgebraicStructures

/-- The UA-level signature for a Boolean algebra: the bundled interpreted
operations for join, meet, complement, bottom, and top. -/
abbrev BooleanAlgebraConceptSignature :=
  LRA.UniversalAlgebra.InterpretedOperationBundles.BooleanAlgebraOperationBundle

end LRA.AlgebraicStructures
