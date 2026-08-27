import LRA.AlgebraicStructures.Lattice.Interface.Laws.Definition
import LRA.UniversalAlgebra.InterpretedOperationBundles

namespace LRA.AlgebraicStructures

/-- The UA-level signature for a lattice: one carrier, two binary operations
(`join`, `meet`) — `LatticeOperationBundle` bundles exactly this. -/
abbrev LatticeConceptSignature :=
  LRA.UniversalAlgebra.InterpretedOperationBundles.LatticeOperationBundle

end LRA.AlgebraicStructures
