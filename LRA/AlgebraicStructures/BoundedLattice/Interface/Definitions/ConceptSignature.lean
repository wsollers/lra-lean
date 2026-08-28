import LRA.AlgebraicStructures.BoundedLattice.Interface.Laws.Definition
import LRA.AlgebraicStructures.Lattice.Interface.Definitions.ConceptSignature

namespace LRA.AlgebraicStructures

/-- The UA-level signature for a bounded lattice: `Lattice`'s carrier/`join`/
`meet` bundle plus the two distinguished constants `bottom`/`top` — matching
the user's signature `ℒ_BLat = {∨, ∧, 0, 1}`. -/
structure BoundedLatticeConceptSignature extends LatticeConceptSignature where
  bottom : carrier
  top : carrier

end LRA.AlgebraicStructures
