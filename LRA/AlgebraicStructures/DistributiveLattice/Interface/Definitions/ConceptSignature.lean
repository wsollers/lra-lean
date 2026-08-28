import LRA.AlgebraicStructures.DistributiveLattice.Interface.Laws.Definition
import LRA.AlgebraicStructures.Lattice.Interface.Definitions.ConceptSignature

namespace LRA.AlgebraicStructures

/-- The UA-level signature for a distributive lattice is exactly `Lattice`'s
— distributivity is `Laws`-level content, not a new signature element. -/
abbrev DistributiveLatticeConceptSignature :=
  LatticeConceptSignature

end LRA.AlgebraicStructures
