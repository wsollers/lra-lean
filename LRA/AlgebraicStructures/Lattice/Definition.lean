import LRA.AlgebraicStructures.Lattice.Laws.Definition
import LRA.UniversalAlgebra.InterpretedOperationBundles

namespace LRA.AlgebraicStructures

/-- The algebraic signature of a lattice: binary join and meet. -/
abbrev LatticeConceptSignature :=
  LRA.UniversalAlgebra.InterpretedOperationBundles.LatticeOperationBundle

end LRA.AlgebraicStructures
