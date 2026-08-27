import LRA.AlgebraicStructures.BoundedLattice.Laws.Definition
import LRA.AlgebraicStructures.Lattice.Interface.Definitions.ConceptSignature

namespace LRA.AlgebraicStructures

/--
`BoundedLatticeConceptSignature` TODO

Predicate logic:

  structure BoundedLatticeConceptSignature extends LatticeConceptSignature where
  bottom : carrier
  top : carrier

Predicate logic (unfolded):

  structure BoundedLatticeConceptSignature extends LatticeConceptSignature where
  bottom : carrier
  top : carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure BoundedLatticeConceptSignature extends LatticeConceptSignature where
  bottom : carrier
  top : carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
structure BoundedLatticeConceptSignature extends LatticeConceptSignature where
  bottom : carrier
  top : carrier

end LRA.AlgebraicStructures
