import LRA.AlgebraicStructures.BoundedLattice.Laws.Definition
import LRA.AlgebraicStructures.Lattice.Definition

namespace LRA.AlgebraicStructures

                                                                                 
structure BoundedLatticeConceptSignature extends LatticeConceptSignature where
  bottom : carrier
  top : carrier

end LRA.AlgebraicStructures
