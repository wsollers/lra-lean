import LRA.AlgebraicStructures.Lattice.AlgebraicSignature.ConceptSignature

namespace LRA.AlgebraicStructures

/-- The algebraic signature of a bounded lattice: join, meet, bottom, and top. -/
structure BoundedLatticeConceptSignature extends LatticeConceptSignature where
  bottom : carrier
  top : carrier

end LRA.AlgebraicStructures
