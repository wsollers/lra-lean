import LRA.AlgebraicStructures.Lattice.Interface.Laws.Definition
import LRA.UniversalAlgebra.InterpretedOperationBundles

namespace LRA.AlgebraicStructures

/--
`LatticeConceptSignature` The UA-level signature for a lattice: one carrier, two binary operations (`join`, `meet`) — `LatticeOperationBundle` bundles exactly this.

Predicate logic:

  abbrev LatticeConceptSignature :=
    LRA.UniversalAlgebra.InterpretedOperationBundles.LatticeOperationBundle

Predicate logic (unfolded):

  abbrev LatticeConceptSignature :=
    LRA.UniversalAlgebra.InterpretedOperationBundles.LatticeOperationBundle (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LatticeConceptSignature :=
  LRA.UniversalAlgebra.InterpretedOperationBundles.LatticeOperationBundle
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev LatticeConceptSignature :=
  LRA.UniversalAlgebra.InterpretedOperationBundles.LatticeOperationBundle

end LRA.AlgebraicStructures
